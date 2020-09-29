// See example in "signature.html".  The idea of this code is that it
// will be called once a SRFI has been loaded, and that it will parse
// the signature text in each <scheme-procedure> element, replacing it
// with markup that makes the signature clearer and better-looking.
// With JavaScript disabled, the signature would just be rendered as
// plain text.

function parseConstant(constant, value = constant) {
  return function(string, offset) {
    return string.startsWith(constant, offset)
      && { v: value, o: offset + constant.length };
  };
}

function parseOr(...parsers) {
  return function(string, offset) {
    for (let i = 0; i < parsers.length; i++) {
      let r = parsers[i](string, offset);

      if (r) {
        return { v: r.v, o: r.o };
      }
    }
    return false;
  };
}

function parseSequence(lift, ...parsers) {
  return function(string, offset) {
    let a = [];
    let o = offset;

    for (let i = 0; i < parsers.length; i++) {
      let r = parsers[i](string, o);

      if (r) {
        a.push(r.v);
        o = r.o;
      } else {
        return false;
      }
    }
    return { v: lift(...a), o: o };
  };
}

function parseRegexp(regexp, lift = x => x) {
  return function(string, offset) {
    const re = new RegExp(regexp, "g");
    const m = re.exec(string.slice(offset));

    return m
      && { v: lift(string.slice(offset, offset + re.lastIndex)),
           o: offset + re.lastIndex };
  };
}

// <> Handle all Scheme identifiers.
function parseIdentifier() {
  return parseRegexp("^([a-zA-Z0-9---<>!?])+");
}

function parseWhiteSpace() {
  return parseRegexp("\\s+", x => null);
}

function parseOptionalWhiteSpace() {
  return parseRegexp("\\s*", x => null);
}

function parsePaired(open, close, body, lift = x => x) {
  let pc = parseConstant;
  let ows = parseOptionalWhiteSpace();

  return parseSequence(
    (o, b, c, d, e) => lift(c), pc(open), ows, body, ows, pc(close));
}

function parseBracketed(body) {
  return parsePaired("[", "]", body);
}

function parseParenthesized(body) {
  return parsePaired("(", ")", body);
}

function parseEnd() {
  return function(string, offset) {
    return (string.length === offset) && { v: true, o: offset };
  };
}

function parseStar(parser, lift = x => x, min = 0) {
  return function(string, offset) {
    let a = [];
    let o = offset;
    let r = parser(string, o);

    while(r) {
      a.push(r.v);
      o = r.o;
      r = parser(string, o);
    }
    return (a.length >= min) && { v: lift(a), o: o };
  };
}

function parsePlus(parser, lift = x => x) {
  return parseStar(parser, lift, 1);
}

function parsePrefixed(parser, prefix) {
  return function(string, offset) {
    let r = prefix(string, offset);

    return r && parser(string, r.o);
  };
}

function parseSuffixed(parser, suffix) {
  return function(string, offset) {
    let r0 = parser(string, offset);

    if (r0) {
      let r1 = suffix(string, r0.o);

      return r1 && { v: r0.v, o: r1.o };
    } else {
      return false;
    }
  };
}

function parseSeparated(parser, separator, lift = x => x) {
  return function(string, offset) {
    let r0 = parser(string, offset);

    if (r0) {
      let p = parseStar(parsePrefixed(parser, separator));
      let rn = p(string, r0.o);

      return rn && { v: lift([r0.v, ...rn.v]), o: rn.o };
    } else {
      return { v: lift([]), o: offset };
    }
  };
}

function parseDelayed(makeParser) {
  return function(string, offset) {
    return makeParser()(string, offset);
  };
}

function parseExpression() {
  let pe = parseDelayed(parseExpression);

  let subExpression = parseSeparated(
    parseOr(parseIdentifier(),
            parseParenthesized(pe),
            parseBracketed(pe)),
    parseWhiteSpace());

  // The top-level expression can be an unparenthesized list in case
  // the author prefers expressing the signature in that style.
  return parseOr(
    parseParenthesized(pe),
    parseBracketed(pe),
    subExpression);
}

function parseEntireInput(parser) {
  return parseSequence((ws1, body, ws2, eof) => body,
                       parseOptionalWhiteSpace(),
                       parser,
                       parseOptionalWhiteSpace(),
                       parseEnd());
}

function signature(string) {
  let r = parseEntireInput(parseExpression())(string, 0);

  return r && r.v;
}

function isTextNode(node) {
  return node.nodeType == Node.TEXT_NODE;
}

function text(string) {
  return document.createTextNode(string);
}

function variable(string) {
  let v = document.createElement("var");

  v.appendChild(text(string));
  return v;
}

// <> Finish translation from "srfi-signature.scm":
// - Handle ellipses.  (Extend grammar.)
// - Handle return types.  (Extend grammar.)
// - Handle brackets.  (Expand signatures containing them.)
// - Handle notes.  (Extend grammar.)
// - Handle syntax.  (Add <scheme-syntax>.)
// - Handle constants, e.g. pi.  (Add <scheme-constant>.)
// - Handle IDs (anchors).
function decorateSignature(node) {
  let c = node.childNodes;

  if (c.length === 1 && isTextNode(c[0])) {
    let s = signature(c[0].textContent);

    if (s) {
      let t = document.querySelector("#signature").content.cloneNode(true);
      let dfn = t.querySelector("dfn");
      let span = t.querySelector("span");

      dfn.textContent = s[0];

      if (s.length == 1) {
        t.insertBefore(text(")"), span);
      } else {
        let first = true;

        for (let arg of s.slice(1)) {
          if (first) {
            first = false;
          } else {
            span.appendChild(text(" "));
          }
          span.appendChild(variable(arg));
        }
        span.appendChild(text(")"));
      }
      node.appendChild(t);
      node.removeChild(c[0]);
    }
  }
}

function decorateAllSignatures() {
  document.querySelectorAll("scheme-procedure").forEach(decorateSignature);
}

decorateAllSignatures();