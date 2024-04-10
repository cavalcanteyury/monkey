#!/usr/bin/env ruby

require_relative "token"

class Lexer
  attr_reader :position, :read_position, :ch, :input

  def initialize(input)
    @input = input
    @read_position = 0
    @position = 0
    @token = nil

    read_ch
  end

  def read_ch
    if @read_position >= @input.length
      @ch = 0
    else
      @ch = @input[@read_position]
    end

    @position = @read_position
    @read_position += 1
  end

  def next_token
    case @ch
    when "("
      @token = Token.new(["LPAREN", @ch])
    when ")"
      @token = Token.new(["RPAREN", @ch])
    when "{"
      @token = Token.new(["LBRACE", @ch])
    when "}"
      @token = Token.new(["RBRACE", @ch])
    when ","
      @token = Token.new(["COMMA", @ch])
    when ";"
      @token = Token.new(["SEMICOLON", @ch])
    end

    read_ch
    @token
  end
end
