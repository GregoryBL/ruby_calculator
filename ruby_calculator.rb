def split_input(input_string)
  int_regex = /\A[0-9]+/
  op_regex = /\A[+\-*\/]/
  var_regex = /\A[a-zA-Z][a-zA-Z0-9_!\-]*/
  left_paren_regex = /\A\(/
  right_paren_regex = /\A\)/
  
  split_array = input_string.split(' ')
  
  split_array.map! do |string| # each string is a set of characters separated from the others by spaces
    new_array = []
    while string != ""
      if int_regex =~ string
        new_array << [int_regex.match(string)[0], :int]
        # puts "Match int"
      elsif op_regex =~ string
        new_array << [op_regex.match(string)[0], :op]
        # puts "Match operation"
      elsif var_regex =~ string
        new_array << [var_regex.match(string)[0], :var]
        # puts "Match variable"
      elsif left_paren_regex =~ string
        new_array << [left_paren_regex.match(string)[0], :lparen]
        # puts "Match left paren"
      elsif right_paren_regex =~ string
        new_array << [right_paren_regex.match(string)[0], :rparen]
        # puts "match right paren"
      end
      string = string[(new_array[-1][0].length)..-1] # remove consumed characters
    end
    new_array
  end
  symbol_array = split_array.flatten(1)
end

p split_input("( 3 + 45 * 2) + 3")