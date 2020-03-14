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
(feature multi-paragraph-list-item "List items with paragraph breaks")
(feature numbered-sections "Sections are explicitly numbered 1,2,3,...")
(feature custom-highlight-font "Parts of SRFI are highlighted in red font, etc.")

(feature list-of-references "List of citations at end of SRFI")
(feature inline-citation "Inline references in square brackets")
(feature footnote "Footnote referenced from the SRFI text")

(feature c-code "Contains C code")

(feature custom-kind "Definition that is proc, var, type, or syntax")
(feature define-type "The SRFI defines a new Scheme datatype")
(feature define-syntax "The SRFI defines a Scheme macro")
(feature read-syntax "The SRFI defines new reader syntax")

(feature abstract-list "Abstract contains a HTML list")
(feature abstract-link "Abstract contains a HTML link")
(feature abstract-pre "Abstract contains preformatted text")
(feature abstract-table "Abstract contains a table")

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
(feature author-website "Has link to author's website")
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
    multi-paragraph-list-item
    definition-list
    table
    list-of-references
    implementation-copyright)

(33 "Integer Bitwise-operation Library (2003, withdrawn)"
    procedure-index
    definition-list
    table
    multi-paragraph-list-item
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
    custom-css-embedded
    author-email
    custom-css-classes)

(50 "Mixing Scheme and C (2005, withdrawn)"
    abstract-list
    abstract-link
    definition-list
    define-syntax
    c-code
    table
    list-of-references)

(51 "Handling rest list (2004)"
    abstract-list
    define-syntax
    footer-last-modified)

(52 "Permitting and Supporting Extended Character Sets (2004, withdrawn)"
    abstract-link
    grammar
    definition-list
    footer-author
    footer-last-modified)

(53 "Syntactic computations with computation-rules (2004, withdrawn)"
    define-syntax
    list-of-references
    author-email
    footer-author
    footer-last-modified)

(54 "Formatting (2004)"
    definition-list
    footer-last-modified)

(55 "require-extension (2004)"
    multiple-authors
    define-syntax
    footer-last-modified)

(56 "Binary I/O (2005, withdrawn)"
    custom-css-embedded
    custom-css-classes
    procedure-index
    list-of-references)

(57 "Records (2005)"
    grammar
    define-syntax
    multi-level-lists
    author-email
    footer-author
    footer-last-modified)

(58 "Array Notation (2005)"
    custom-status
    abstract-link
    grammar
    table
    footer-last-modified)

(59 "Vicinity (2005)"
    footer-last-modified)

(60 "Integers as Bits (2005)"
    abstract-list
    footer-last-modified)

(61 "A more general cond clause (2005)"
    grammar
    define-syntax)

(62 "S-expression comments (2005)"
    read-syntax
    grammar)

(63 "Homogeneous and Heterogeneous Arrays (2005)"
    abstract-list
    table
    multi-level-lists
    footer-last-modified)

(64 "A Scheme API for test suites (2006)"
    custom-css-embedded
    post-finalization-note
    author-email
    footer-author
    footer-last-modified)

(65 "define-immutable: A Syntax to Define Identifiers With Immutable Values (2005, withdrawn)"
    author-website
    abstract-pre
    list-of-references)

(66 "Octet Vectors (2005)"
    post-finalization-note
    list-of-references)

(67 "Compare Procedures (2005)"
    define-syntax
    custom-css-file
    custom-status
    numbered-sections
    table
    blockquote
    math-image
    inline-citation
    list-of-references)

(68 "Comprehensive I/O (2005, withdrawn)"
    abstract-list
    abstract-link
    define-type
    blockquote
    multi-level-lists
    list-of-references)

(69 "Basic hash tables (2005)"
    abstract-list
    procedure-index
    footer-last-modified)

(70 "Numbers (2005)"
    abstract-list
    table
    blockquote
    math-unicode
    grammar
    custom-highlight-font
    footer-last-modified)

(71 "Extended LET-syntax for multiple values (2005)"
    author-email
    abstract-pre
    grammar
    define-syntax
    list-of-references
    author-email
    footer-author
    footer-last-modified)

(72 "Hygienic macros (2005)"
    post-finalization-note
    abstract-list
    read-syntax
    define-syntax
    blockquote
    custom-highlight-font
    list-of-references
    author-email
    footer-author)

(73 "Exact Infinities (2005, withdrawn)"
    custom-highlight-font
    list-of-references
    footer-author)

(74 "Octet-Addressed Binary Blocks (2005)"
    list-of-references)

(75 "R6RS Unicode data (2006, withdrawn)"
    multiple-authors
    custom-status
    custom-highlight-font
    greek-letters
    definition-list
    list-of-references)

(76 "R6RS Records (2006, withdrawn)"
    multiple-authors
    define-syntax
    blockquote
    list-of-references)

(77 "Preliminary Proposal for R6RS Arithmetic (2006, withdrawn)"
    multiple-authors
    custom-status
    custom-highlight-font
    abstract-list
    read-syntax
    blockquote
    table
    grammar
    list-of-references)

(78 "Lightweight testing (2006)"
    post-finalization-note
    abstract-link
    abstract-list
    abstract-pre
    define-syntax
    list-of-references
    author-email
    footer-author)

(79 "Primitive I/O (2006, withdrawn)"
    abstract-link
    multi-level-list
    define-type
    define-syntax
    blockquote
    list-of-references)

(80 "Stream I/O (2006, withdrawn)"
    abstract-link
    abstract-list
    define-syntax
    blockquote
    list-of-references)

(81 "Port I/O (2006, withdrawn)"
    abstract-link
    abstract-list
    list-of-references)

(82 "Stream Ports (2006, withdrawn)"
    abstract-link
    list-of-references)

(83 "R6RS Library Syntax (2006, withdrawn)"
    multiple-authors
    custom-highlight-font
    grammar
    multi-level-list
    list-of-references)

(84 "Universal Identifiers (2006, withdrawn)"
    author-website
    inline-citation
    grammar
    multi-level-list
    footer-last-modified)

(85 "Recursive Equivalence Predicates (2006, withdrawn)"
    list-of-references)

(86 "MU and NU simulating VALUES & CALL-WITH-VALUES, and their related LET-syntax (2006)"
    multi-paragraph-list-item
    grammar
    list-of-references)

(87 "=> in case clauses (2006)"
    define-syntax
    custom-highlight-font
    blockquote
    footer-last-modified)

(88 "Keyword objects (2007)"
    read-syntax
    multi-paragraph-list-item
    grammar)

(89 "Optional positional and named parameters (2007)"
    define-syntax
    grammar
    multi-level-list)

(90 "Extensible hash table constructor (2007)")

(91 "Extended ports (2007, withdrawn)"
    multi-level-list
    multi-paragraph-list-item)

(92 "ALAMBDA and ALAMBDA* (2007, withdrawn)"
    abstract-list
    define-syntax
    grammar
    list-of-references)

(93 "R6RS Syntax-Case Macros (2006, withdrawn)"
    read-syntax
    define-syntax
    custom-status
    numbered-sections
    inline-image
    math-image
    math-unicode
    blockquote
    list-of-references)

(94 "Type-Restricted Numerical Functions (2007)"
    custom-status
    blockquote
    table
    custom-highlight-font)

(95 "Sorting and Merging (2007)"
    post-finalization-note)

(96 "SLIB Prerequisites (2008)"
    abstract-link
    blockquote
    table
    definition-list
    define-syntax
    footer-last-modified)

(97 "SRFI Libraries (2008)"
    post-finalization-note
    custom-highlight-font
    table
    list-of-references)

(98 "An interface to access environment variables (2008)"
    custom-status
    table)

(99 "ERR5RS Records (2009)"
    define-syntax
    list-of-references)

(100 "define-lambda-object (2010)"
     grammar
     list-of-references)

(101 "Purely Functional Random-Access Pairs and Lists (2013)"
     abstract-link
     blockquote
     list-of-references)

(102 "Procedure Arity Inspection (2013, withdrawn)"
     list-of-references)

(103 "Library Files (2013, withdrawn)"
     custom-status
     blockquote
     list-of-references)

(104 "Library Files Utilities (2010, withdrawn)"
     abstract-link
     list-of-references)

(105 "Curly-infix-expressions (2012)"
     multiple-authors
     author-website
     abstract-pre
     math-unicode
     grammar
     read-syntax)

(106 "Basic socket interface (2013)"
     post-finalization-note
     procedure-index
     definition-list
     table
     list-of-references
     author-email
     footer-author
     footer-last-modified)

(107 "XML reader syntax (2013)"
     custom-css-embedded
     author-email
     footer-author
     read-syntax
     grammar
     custom-highlight-font
     math-unicode)

(108 "Named quasi-literal constructors (2013)"
     abstract-link
     custom-css-embedded
     author-email
     footer-author
     read-syntax
     grammar
     custom-highlight-font
     math-unicode)

(109 "Extended string quasi-literals (2013)"
     abstract-link
     custom-css-embedded
     author-email
     footer-author
     read-syntax
     grammar
     custom-highlight-font
     math-unicode)

(110 "Sweet-expressions (t-expressions) (2013)"
     multiple-authors
     author-website
     custom-status
     abstract-link
     abstract-pre
     abstract-table
     read-syntax
     table
     grammar
     multi-level-list
     blockquote)

(111 "Boxes (2013)"
     table
     footer-last-modified)

(112 "Environment Inquiry (2013)"
     post-finalization-note
     footer-last-modified)

(113 "Sets and bags (2014)"
     post-finalization-note
     procedure-index)

(114 "Comparators (2017, withdrawn)"
     custom-status
     superseded-by
     abstract-link
     procedure-index
     multi-level-list)

(115 "Scheme Regular Expressions (2014)"
     post-finalization-note
     abstract-link
     procedure-index
     definition-list
     custom-highlight-font
     grammar
     list-of-references)

(116 "Immutable List Library (2014)"
     custom-css-embedded
     author-email
     author-website
     post-finalization-note
     abstract-link
     procedure-index
     definition-list
     list-of-references)

(117 "Queues based on lists (2015)"
     author-email
     post-finalization-note
     footer-last-modified)

(118 "Simple adjustable-size strings (2015)"
     custom-css-embedded
     author-email
     footer-author)

(119 "wisp: simpler indentation-sensitive scheme (2015)"
     table
     custom-highlight-font
     footnote
     footer-last-modified)

(120 "Timer APIs (2015)")

(121 "Generators (2019, withdrawn)"
     multiple-authors
     superseded-by
     post-finalization-note
     math-unicode
     footer-last-modified)

(122 "Nonempty Intervals and Generalized Arrays (2016)"
     custom-status
     math-unicode
     definition-list
     procedure-index
     list-of-references)

(123 "Generic accessor and modifier operators (2015)"
     author-email
     custom-status
     read-syntax
     define-syntax)

(124 "Ephemerons (2015)"
     list-of-references)

(125 "Intermediate hash tables (2015)"
     multiple-authors
     post-finalization-note
     multi-level-list
     procedure-index
     footer-last-modified)

(126 "R6RS-based hashtables (2016)"
     author-email
     post-finalization-note)

(127 "Lazy Sequences (2016)"
     post-finalization-note
     abstract-link
     procedure-index
     definition-list
     multi-level-list)

(128 "Comparators (reduced) (2016)"
     post-finalization-note
     procedure-index
     multi-level-list)

(129 "Titlecase procedures (2016)"
     custom-status)

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
