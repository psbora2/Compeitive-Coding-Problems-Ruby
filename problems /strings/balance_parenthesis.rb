def valid_parentheses(string)
	opposite = {
		"{" => "}",
		"[" => "]",
		"(" => ")"
	}

	stack =  []

	string.split('').each do |el|
		if stack.last && opposite[stack.last] == el
			stack.pop
		else
			stack << el
		end
	end
	stack.empty?
end

valid_parentheses("(){}[]")