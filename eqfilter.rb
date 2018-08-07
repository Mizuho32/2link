#!/usr/bin/env ruby
# coding: utf-8


def filter(str)
  str
  .gsub(/\\\[Theta\](\d+)/, 't\1')
  .gsub("[t]", "")
  .gsub(/(t\d+)\^\\\[Prime\]/, 'd\1')
  .gsub(/\\\[Tau\](\d+)/, 'tau\1')
  .gsub(/Sin\[(.+?)\]/, 'sin(\1)')
  .gsub(/Cos\[(.+?)\]/, 'cos(\1)')
  .gsub(" ", ".*")
  .gsub("^", ".^")
end
   

eq1 = '((lg1 m1+l1 m2) Cos[\[Theta]1[t]]+lg2 m2 Cos[\[Theta]1[t]+\[Theta]2[t]]) (\[Theta]1^\[Prime])[t]^2+(((lg1 m1+l1 m2) (I2+lg2^2 m2+l1 lg2 m2 Cos[\[Theta]2[t]]) Sin[\[Theta]1[t]]-lg2 m2 (I1+lg1^2 m1+l1^2 m2+l1 lg2 m2 Cos[\[Theta]2[t]]) Sin[\[Theta]1[t]+\[Theta]2[t]]) (-\[Tau]2+g lg2 m2 Cos[\[Theta]1[t]+\[Theta]2[t]]+l1 lg2 m2 Sin[\[Theta]2[t]] (\[Theta]1^\[Prime])[t]^2))/((I1+lg1^2 m1+l1^2 m2) (I2+lg2^2 m2)-l1^2 lg2^2 m2^2 Cos[\[Theta]2[t]]^2)+2 lg2 m2 Cos[\[Theta]1[t]+\[Theta]2[t]] (\[Theta]1^\[Prime])[t] (\[Theta]2^\[Prime])[t]+lg2 m2 Cos[\[Theta]1[t]+\[Theta]2[t]] (\[Theta]2^\[Prime])[t]^2-(((lg1 m1+l1 m2) (I2+lg2^2 m2) Sin[\[Theta]1[t]]-l1 lg2^2 m2^2 Cos[\[Theta]2[t]] Sin[\[Theta]1[t]+\[Theta]2[t]]) (-\[Tau]1+g lg1 m1 Cos[\[Theta]1[t]]+g l1 m2 Cos[\[Theta]1[t]]+g lg2 m2 Cos[\[Theta]1[t]+\[Theta]2[t]]-2 l1 lg2 m2 Sin[\[Theta]2[t]] (\[Theta]1^\[Prime])[t] (\[Theta]2^\[Prime])[t]-l1 lg2 m2 Sin[\[Theta]2[t]] (\[Theta]2^\[Prime])[t]^2))/((I1+lg1^2 m1+l1^2 m2) (I2+lg2^2 m2)-l1^2 lg2^2 m2^2 Cos[\[Theta]2[t]]^2)'
eq2 = '-g (m1+m2)+((lg1 m1+l1 m2) Sin[\[Theta]1[t]]+lg2 m2 Sin[\[Theta]1[t]+\[Theta]2[t]]) (\[Theta]1^\[Prime])[t]^2-(((lg1 m1+l1 m2) Cos[\[Theta]1[t]] (I2+lg2^2 m2+l1 lg2 m2 Cos[\[Theta]2[t]])-lg2 m2 (I1+lg1^2 m1+l1^2 m2+l1 lg2 m2 Cos[\[Theta]2[t]]) Cos[\[Theta]1[t]+\[Theta]2[t]]) (-\[Tau]2+g lg2 m2 Cos[\[Theta]1[t]+\[Theta]2[t]]+l1 lg2 m2 Sin[\[Theta]2[t]] (\[Theta]1^\[Prime])[t]^2))/((I1+lg1^2 m1+l1^2 m2) (I2+lg2^2 m2)-l1^2 lg2^2 m2^2 Cos[\[Theta]2[t]]^2)+2 lg2 m2 Sin[\[Theta]1[t]+\[Theta]2[t]] (\[Theta]1^\[Prime])[t] (\[Theta]2^\[Prime])[t]+lg2 m2 Sin[\[Theta]1[t]+\[Theta]2[t]] (\[Theta]2^\[Prime])[t]^2+(((lg1 m1+l1 m2) (I2+lg2^2 m2) Cos[\[Theta]1[t]]-l1 lg2^2 m2^2 Cos[\[Theta]2[t]] Cos[\[Theta]1[t]+\[Theta]2[t]]) (-\[Tau]1+g lg1 m1 Cos[\[Theta]1[t]]+g l1 m2 Cos[\[Theta]1[t]]+g lg2 m2 Cos[\[Theta]1[t]+\[Theta]2[t]]-2 l1 lg2 m2 Sin[\[Theta]2[t]] (\[Theta]1^\[Prime])[t] (\[Theta]2^\[Prime])[t]-l1 lg2 m2 Sin[\[Theta]2[t]] (\[Theta]2^\[Prime])[t]^2))/((I1+lg1^2 m1+l1^2 m2) (I2+lg2^2 m2)-l1^2 lg2^2 m2^2 Cos[\[Theta]2[t]]^2)'

puts t1_1 = filter(eq1)
puts t2_1 = filter(eq2)



require 'ripper'
require 'pp'


class AST < Ripper
  attr_reader :code

  def initialize(src)
    super

    @code = nil
    @last = nil
  end

  def on_unary(op, v)
    @code = {op[0] => [v]}
  end

  def on_paren(*a)
    @last
    #@code = {:paren => [@code]}
    #@code
  end

  def on_binary(l,o,r)
    #pp o
    @last = @code = {o=>[l, r]}

    #puts @code, ""

    #@code[o] = [l, r]
    #@code
  end
end


def to_tex(code) if not (Hash === code) then
    return code
  end

  op = code.keys.first
  l =  code[op].first
  r =  code[op].last

  if op == :/ then
    #puts "1", op, code
    "\\\\ \\frac{#{to_tex(l)}}{#{to_tex(r)}} \\\\"
  elsif op == :paren
    "(#{to_tex(l)})"
  elsif l == r
    "#{op}#{to_tex(l)}"
  else
    "#{to_tex(l)}#{op}#{to_tex(r)}"
  end
end

def to_ruby(t)
  t.gsub(".*", "*")
   .gsub(".^", "**")
   .gsub(/(cos)\(([^\)]+)\)/, '\1\2')
   .gsub(/(sin)\(([^\)]+)\)/, '\1\2')
end

def finish(t)
  t.gsub("**", ?^)
   .gsub("*", " ")
   .gsub(/(g\d+)/, '_{\1}')
   .gsub("tau", '\tau')
   .gsub(/cos(\w+)/, '\cos\1')
   .gsub(/sin(\w+)/, '\sin\1')
   .gsub(/t(\d+)/, '\theta\1')
   .gsub(/([^\^g])(\d+)/, '\1_\2')
end
r1 = to_ruby(t1_1)
pp r1
code1 = AST.new(r1)
#code1 = AST.new("(1/2+3/4)/3")
code1.parse
#pp code1.code
puts "", finish(to_tex(code1.code))
#puts "", to_tex(code1.code)

=begin

code2 = AST.new(to_ruby(t2_1))
code2.parse
puts "", finish(to_tex(code2.code))
=end
