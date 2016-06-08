def split_input(input_string)
  int_regex = /\A[0-9]+/
  op_regex = /\A[+-*/]/
  var_regex = /\A[a-zA-Z][a-zA-Z0-9_!\-]*/
  left_paren_regex = /\A\(/
  right_paren_regex = /\A\)/
  
  split_array = input_string.split(' ')
  
  split_array.map! do |string|
    while string != ""
      new_array = []
      if int_regex ~= input_string
        new_array << (int_regex ~= input_string)[0].to_i
      elsif op_regex ~= input_string
        new_array << (op_regex ~= input_string)[0]
      elsif var_regex ~= input_string
        new_array << (var_regex ~= input_string)[0]
      elsif left_paren_regex ~= input_string
        new_array << (left_paren_regex ~= input_string)[0]
      elsif right_paren_regex ~= input_string
        new_array << (right_paren_regex ~= input_string)[0]
      end
    end
    
end