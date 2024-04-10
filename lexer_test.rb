#!/usr/bin/env ruby
require "minitest/autorun"
require_relative "lexer"

class LexerTest < Minitest::Test
  describe "Lexer" do
    it "must convert delimiters token" do
      input = "(){},;"

      lexer = Lexer.new(input)

      curr_token = lexer.next_token

      assert_equal "LPAREN", curr_token.type
      assert_equal "(", curr_token.literal
    end
  end
end
