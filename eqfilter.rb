#!/usr/bin/env ruby
# coding: utf-8


def filter(str)
  str
  .gsub(/\\\[Theta\](\d+)/, 't\1')
  .gsub("[t]", "")
  .gsub(/(t\d+)\^\\\[Prime\]/, 'd\1')
  .gsub(/Sin\[(.+?)\]/, 'sin(\1)')
  .gsub(/Cos\[(.+?)\]/, 'cos(\1)')
  .gsub(" ", "*")
end
   

eq1 = '-(1/4) l1 (l1 (m1+4 m2) Cos[\[Theta]1[t]] (\[Theta]1^\[Prime])[t]^2+2 l2 m2 Cos[\[Theta]2[t]] (\[Theta]2^\[Prime])[t]^2)'
eq2 = 'g m1+g m2+1/4 l1^2 m1 (-Sin[\[Theta]1[t]] (\[Theta]1^\[Prime])[t]^2)+l1 m2 (-l1 Sin[\[Theta]1[t]] (\[Theta]1^\[Prime])[t]^2-1/2 l2 Sin[\[Theta]2[t]] (\[Theta]2^\[Prime])[t]^2)'

puts filter(eq1)
puts filter(eq2)
