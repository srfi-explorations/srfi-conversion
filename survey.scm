(feature greek-letters "Greek letters")
(feature math-unicode "Inline math formulas as Unicode")
(feature math-image "Image of a math formula")
(feature block-image "Non-math image used as a block element")
(feature inline-image "Non-math image used as an inline element")

(feature procedure-index "Contains a procedure index")
(feature grammar "Contains a BNF-style grammar")
(feature acronym "Contains acronyms with mousable expansions")
(feature table "Tables using a proportional (non-fixed-width) font")
(feature blockquote "Uses HTML <blockquote>")
(feature definition-list "Has list of terms and their expansions")
(feature denotational-semantics "Contains denotational semantics")
(feature multi-level-lists "Lists within lists")
(feature ascii-art-flowchart "Contains a flowchart as ASCII art")
(feature ordered-list-letters "Ordered list <ol> using letters, not numbers")
(feature multi-paragrpah-list-item "List items with paragraph breaks")

(feature list-of-references "List of citations at end of SRFI")
(feature inline-citation "Inline references in square brackets")

(feature custom-kind "Definition that is proc, var, type, or syntax")
(feature define-type "The SRFI defines a new Scheme datatype")
(feature define-syntax "The SRFI defines a Scheme macro")
(feature read-syntax "The SRFI defines new reader syntax")

(feature abstract-list "Abstract contains a HTML list")
(feature abstract-link "Abstract contains a HTML link")
(feature abstract-pre "Abstract contains preformatted text")

(feature figure-caption "A table or diagram is captioned")

(feature superseded-by "Mentions that it's superseded by another SRFI")
(feature post-finalization-note "Contains a post-finalization note")

(feature custom-css-embedded "Has custom CSS styles embedded in the HTML")
(feature custom-css-file "Has custom .css file included from the HTML")
(feature custom-css-classes "Uses custom class= attributes")

(feature implementation-copyright "Implementation license printed separately")
(feature footer-author "Has author under the final <hr>")
(feature footer-last-modified "Has timestamp under the final <hr>")
(feature custom-status "Status section includes non-standard text")
(feature author-email "Has author's email address or email link")
(feature author-residence "Has author's affiliation or contact info (non-email)")
(feature multiple-authors "Has more than one author")

(0 "Feature-based conditional expansion construct (1999)"
   abstract-list
   abstract-link
   grammar
   define-syntax
   footer-last-modified)

(1 "List Library (1999)"
   custom-css-embedded
   author-email
   multi-level-lists
   acronym
   table
   procedure-index
   blockquote
   custom-css-classes
   definition-list
   list-of-references)

(2 "AND-LET*: an AND with local bindings, a guarded LET* special form (1999)"
   define-syntax
   grammar
   denotational-semantics
   footer-last-modified)

(3 "List-Set Library (1999, withdrawn)"
   custom-status
   abstract-list)

(4 "Homogeneous numeric vector datatypes (1999)"
   definition-list)

(5 "A compatible let form with signatures and rest arguments (1999)"
   define-syntax
   grammar)

(6 "Basic String Ports (1999)"
   abstract-list
   footer-last-modified)

(7 "Feature-based program configuration language (1999)"
   define-syntax
   grammar)

(8 "receive: Binding to multiple values (1999)"
   define-syntax
   author-email
   author-residence)

(9 "Defining Record Types (1999)"
   define-syntax
   grammar)

(10 "#, external form (2000)"
    read-syntax
    grammar
    author-email
    footer-author)

(11 "Syntax for receiving multiple values (2000)"
    define-syntax
    footer-last-modified)

(12 "Exception Handling (2000, withdrawn)"
    multiple-authors
    define-syntax
    footer-last-modified)

(13 "String Libraries (2000)"
    custom-css-embedded
    author-email
    multi-level-lists
    acronym
    table
    procedure-index
    custom-css-classes
    definition-list
    list-of-references)

(14 "Character-set Library (2000)"
    custom-css-embedded
    author-email
    multi-level-lists
    acronym
    table
    procedure-index
    custom-css-classes
    definition-list
    list-of-references
    post-finalization-note)

(15 "Syntax for dynamic scoping (2000, withdrawn)"
    define-syntax
    footer-last-modified)

(16 "Syntax for procedures of variable arity (2000)"
    define-syntax
    footer-last-modified)

(17 "Generalized set! (2000)"
    define-syntax
    footer-last-modified)

(18 "Multithreading support (2001)"
    abstract-list
    ascii-art-flowchart
    definition-list)

(19 "Time Data Types and Procedures (2000)"
    definition-list
    table
    figure-caption
    footer-last-modified)

(20 "Simple object system (2001, withdrawn)"
    abstract-link)

(21 "Real-time multithreading support (2001)"
    abstract-link
    ascii-art-flowchart)

(22 "Running Scheme Scripts on Unix (2002)"
    abstract-list
    grammar
    multiple-authors)

(23 "Error reporting mechanism (2001)"
    footer-last-modified)

(24 "Define-syntax in local lexical scopes (2002, withdrawn)"
    grammar
    footer-last-modified)

(25 "Multi-dimensional Array Primitives (2002)"
    footer-last-modified)

(26 "Notation for Specializing Parameters without Currying (2002)"
    abstract-pre
    author-email
    footer-author
    footer-last-modified)

(27 "Sources of Random Bits (2002)"
    abstract-list
    ordered-list-letters
    list-of-references
    author-email
    footer-author
    footer-last-modified)

(28 "Basic Format Strings (2002)"
    author-email
    footer-author
    footer-last-modified)

(29 "Localization (2002)"
    author-email
    footer-author
    footer-last-modified)

(30 "Nested Multi-line Comments (2002)"
    read-syntax
    grammar
    footer-last-modified)

(31 "A special form `rec' for recursive evaluation (2002)"
    abstract-link
    inline-citation
    list-of-references
    footer-author)

(32 "Sort Libraries (2003, withdrawn)"
    multi-paragrpah-list-item
    definition-list
    table
    list-of-references
    implementation-copyright)

(33 "Integer Bitwise-operation Library (2003, withdrawn)"
    procedure-index
    definition-list
    table
    multi-paragrpah-list-item
    multi-level-lists
    list-of-references
    implementation-copyright)

(34 "Exception Handling for Programs (2002)"
    multiple-authors
    abstract-list
    abstract-link
    define-syntax
    list-of-references)

(35 "Conditions (2002)"
    multiple-authors
    define-syntax
    define-type
    list-of-references)

(36 "I/O Conditions (2002)"
    abstract-link
    multi-level-lists
    define-type
    table
    list-of-references)

(37 "args-fold: a program argument processor (2003)")

(38 "External Representation for Data With Shared Structure (2003)"
    grammar
    footer-last-modified)

(39 "Parameter objects (2003)"
    define-syntax)

(40 "A Library of Streams (2017, withdrawn)"
    superseded-by
    table
    list-of-references
    author-residence
    footer-last-modified)

(41 "Streams (2008)"
    post-finalization-note
    block-image
    math-image
    math-unicode
    greek-letters
    syntax
    custom-kind
    list-of-references
    implementation-copyright)

(42 "Eager Comprehensions (2003)"
    abstract-link
    abstract-pre
    inline-citation
    custom-kind
    table
    definition-list
    list-of-references
    author-email
    footer-author
    footer-last-modified)

(43 "Vector library (2004)"
    abstract-list
    abstract-link
    procedure-index
    definition-list
    inline-citation
    greek-letters
    list-of-references)

(44 "Collections (2004)"
    ascii-art-flowchart
    definition-list
    list-of-references
    author-email
    footer-author
    footer-last-modified)

(45 "Primitives for Expressing Iterative Lazy Algorithms (2004)"
    abstract-link
    abstract-pre
    inline-citation
    list-of-references
    author-email
    footer-author
    footer-last-modified)

(46 "Basic Syntax-rules Extensions (2005)"
    grammar
    define-syntax
    math-unicode
    list-of-references
    footer-last-modified)

(47 "Array (2004)"
    superseded-by
    footer-last-modified)

(48 "Intermediate Format Strings (2004)"
    abstract-link
    table
    author-email
    footer-author
    footer-last-modified)

(49 "Indentation-sensitive syntax (2005)"
)

(50 "Mixing Scheme and C (2005, withdrawn)"
)

(51 "Handling rest list (2004)"
)

(52 "Permitting and Supporting Extended Character Sets (2004, withdrawn)"
)

(53 "Syntactic computations with computation-rules (2004, withdrawn)"
)

(54 "Formatting (2004)"
)

(55 "require-extension (2004)"
)

(56 "Binary I/O (2005, withdrawn)"
)

(57 "Records (2005)"
)

(58 "Array Notation (2005)"
)

(59 "Vicinity (2005)"
)

(60 "Integers as Bits (2005)"
)

(61 "A more general cond clause (2005)"
)

(62 "S-expression comments (2005)"
)

(63 "Homogeneous and Heterogeneous Arrays (2005)"
)

(64 "A Scheme API for test suites (2006)"
)

(65 "define-immutable: A Syntax to Define Identifiers With Immutable Values (2005, withdrawn)"
)

(66 "Octet Vectors (2005)"
)

(67 "Compare Procedures (2005)"
    math-image)

(68 "Comprehensive I/O (2005, withdrawn)"
)

(69 "Basic hash tables (2005)"
)

(70 "Numbers (2005)"
)

(71 "Extended LET-syntax for multiple values (2005)"
)

(72 "Hygienic macros (2005)"
)

(73 "Exact Infinities (2005, withdrawn)"
)

(74 "Octet-Addressed Binary Blocks (2005)"
)

(75 "R6RS Unicode data (2006, withdrawn)"
)

(76 "R6RS Records (2006, withdrawn)"
)

(77 "Preliminary Proposal for R6RS Arithmetic (2006, withdrawn)"
)

(78 "Lightweight testing (2006)"
)

(79 "Primitive I/O (2006, withdrawn)"
)

(80 "Stream I/O (2006, withdrawn)"
)

(81 "Port I/O (2006, withdrawn)"
)

(82 "Stream Ports (2006, withdrawn)"
)

(83 "R6RS Library Syntax (2006, withdrawn)"
)

(84 "Universal Identifiers (2006, withdrawn)"
)

(85 "Recursive Equivalence Predicates (2006, withdrawn)"
)

(86 "MU and NU simulating VALUES & CALL-WITH-VALUES, and their related LET-syntax (2006)"
)

(87 "=> in case clauses (2006)"
)

(88 "Keyword objects (2007)"
)

(89 "Optional positional and named parameters (2007)"
)

(90 "Extensible hash table constructor (2007)"
)

(91 "Extended ports (2007, withdrawn)"
)

(92 "ALAMBDA and ALAMBDA* (2007, withdrawn)"
)

(93 "R6RS Syntax-Case Macros (2006, withdrawn)"
    inline-image
    math-image)

(94 "Type-Restricted Numerical Functions (2007)"
)

(95 "Sorting and Merging (2007)"
)

(96 "SLIB Prerequisites (2008)"
)

(97 "SRFI Libraries (2008)"
)

(98 "An interface to access environment variables (2008)"
)

(99 "ERR5RS Records (2009)"
)

(100 "define-lambda-object (2010)"
)

(101 "Purely Functional Random-Access Pairs and Lists (2013)"
)

(102 "Procedure Arity Inspection (2013, withdrawn)"
)

(103 "Library Files (2013, withdrawn)"
)

(104 "Library Files Utilities (2010, withdrawn)"
)

(105 "Curly-infix-expressions (2012)"
)

(106 "Basic socket interface (2013)"
)

(107 "XML reader syntax (2013)"
)

(108 "Named quasi-literal constructors (2013)"
)

(109 "Extended string quasi-literals (2013)"
)

(110 "Sweet-expressions (t-expressions) (2013)"
)

(111 "Boxes (2013)"
)

(112 "Environment Inquiry (2013)"
)

(113 "Sets and bags (2014)"
)

(114 "Comparators (2017, withdrawn)"
)

(115 "Scheme Regular Expressions (2014)"
)

(116 "Immutable List Library (2014)"
)

(117 "Queues based on lists (2015)"
)

(118 "Simple adjustable-size strings (2015)"
)

(119 "wisp: simpler indentation-sensitive scheme (2015)"
)

(120 "Timer APIs (2015)"
)

(121 "Generators (2019, withdrawn)"
)

(122 "Nonempty Intervals and Generalized Arrays (2016)"
)

(123 "Generic accessor and modifier operators (2015)"
)

(124 "Ephemerons (2015)"
)

(125 "Intermediate hash tables (2015)"
)

(126 "R6RS-based hashtables (2016)"
)

(127 "Lazy Sequences (2016)"
)

(128 "Comparators (reduced) (2016)"
)

(129 "Titlecase procedures (2016)"
)

(130 "Cursor-based string library (2016)"
)

(131 "ERR5RS Record Syntax (reduced) (2016)"
)

(132 "Sort Libraries (2016)"
)

(133 "Vector Library (R7RS-compatible) (2016)"
)

(134 "Immutable Deques (2016)"
)

(135 "Immutable Texts (2016)"
)

(136 "Extensible record types (2016)"
)

(137 "Minimal Unique Types (2016)"
)

(138 "Compiling Scheme programs to executables (2016)"
)

(139 "Syntax parameters (2016)"
)

(140 "Immutable Strings (2017)"
)

(141 "Integer division (2016)"
)

(142 "Bitwise Operations (2017, withdrawn)"
)

(143 "Fixnums (2017)"
)

(144 "Flonums (2017)"
)

(145 "Assumptions (2017)"
)

(146 "Mappings (2018)"
)

(147 "Custom macro transformers (2017)"
)

(148 "Eager syntax-rules (2017)"
)

(149 "Basic Syntax-rules Template Extensions (2017)"
)

(150 "Hygienic ERR5RS Record Syntax (reduced) (2018)"
)

(151 "Bitwise Operations (2017)"
)

(152 "String Library (reduced) (2017)"
)

(153 "Ordered Sets (2018, withdrawn)"
)

(154 "First-class dynamic extents (2018)"
)

(155 "Promises (2018)"
)

(156 "Syntactic combiners for binary predicates (2017)"
)

(157 "Continuation marks (2018)"
)

(158 "Generators and Accumulators (2017)"
)

(159 "Combinator Formatting (2018)"
)

(160 "Homogeneous numeric vector libraries (2019)"
)

(161 "Unifiable Boxes (2019)"
)

(162 "Comparators sublibrary (2019)"
)

(163 "Enhanced array literals (2019)"
)

(164 "Enhanced multi-dimensional Arrays (2019)"
)

(165 "The Environment Monad (2019)"
)

(166 "Monadic Formatting (draft)"
)

(167 "Ordered Key Value Store (2019)"
)

(168 "Generic Tuple Store Database (2019)"
)

(169 "Underscores in numbers (2019)"
)

(170 "POSIX API (draft)"
)

(171 "Transducers (2019)"
)

(172 "Two Safer Subsets of R7RS (2019)"
)

(173 "Hooks (2019)"
)

(174 "POSIX Timespecs (2019)"
)

(175 "ASCII character library (2019)"
)

(176 "Version flag (2020)"
)

(177 "Portable keyword arguments (draft)"
)

(178 "Bitvector library (draft)"
)

(179 "Nonempty Intervals and Generalized Arrays (Updated) (draft)"
)

(180 "JSON (draft)"
)

(181 "Custom ports (draft)"
)

(182 "ADBMAL, ALET, and ALET* (draft)"
)

(183 "Another format procedure, Fox (draft)"
)

(184 "define-record-lambda (draft)"
)

(185 "Linear adjustable-size strings (draft)"
)

(186 "Transcoders and transcoded ports (draft)"
)

(187 "ALAMBDA and ADEFINE (draft)"
)
