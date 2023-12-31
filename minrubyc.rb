require "minruby"

tree = minruby_parse(ARGF.read)

puts "\t.intel_syntax noprefix"
puts "\t.text"
puts "\t.globl main"
puts "main:"
puts "\tpush rbp"
puts "\tmov rbp, rsp"

if tree[0] == "lit"
  puts "\tmov rax, #{tree[1]}"
else
  raise "invalid AST: #{tree}"
end

# 入力した整数をプリントする
puts "\tmov rdi, rax"
puts "\tcall p"

puts "\tmov rsp, rbp"
puts "\tpop rbp"
puts "\tret"
