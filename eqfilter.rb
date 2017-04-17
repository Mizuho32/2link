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

puts filter(eq1)
puts filter(eq2)
