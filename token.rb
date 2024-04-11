require 'byebug'

class Token
  attr_reader :type, :literal

  TOKEN_TYPE = {
    "":        "EOF",
    "ILLEGAL": "ILLEGAL",

    # Identifiers + literals
    "IDENT":   "IDENT",
    "INT":     "INT",

    # Operators
    "=":       "ASSIGN",
    "+":       "PLUS",

    # Delimiters
    ",":       "COMMA",
    ";":       "SEMICOLON",
    "(":       "LPAREN",
    ")":       "RPAREN",
    "{":       "LBRACE",
    "}":       "RBRACE",
  }.freeze

  KEYWORDS = {
    "let": "LET",
    "fn":  "FUNCTION",
  }.freeze

  def initialize(literal = nil)
    parse(literal) unless literal.nil?
  end

  def type=(t)
    @type = t
  end

  def literal=(l)
    @literal = l
  end

  def literal_to_type(t)
    return @type = TOKEN_TYPE[t.to_sym] if TOKEN_TYPE.has_key?(t.to_sym)

    return @type = KEYWORDS[t.to_sym] if KEYWORDS.has_key?(t.to_sym)

    @type = t
  end


  def parse(literal)
    self.type = literal_to_type(literal)
    self.literal = literal
  end
end


# let five = 5;
# let ten = 10;
#
# let add = fn(x, y) {
#   x + y;
# }
#
# let result = add(five, ten);
