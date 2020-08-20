
# https://leetcode.com/problems/validate-binary-search-tree/submissions/

def is_valid_bst(el, low_side = (-1/0.0), upper_side = (1/0.0))
	if el.nil?
		return true
	else
		if (el.val > upper_side  || el.val < low_side)
			flag =  false
		else
			flag = false
			if is_valid_bst(el.left, low_side, el.val) && is_valid_bst(el.right, el.val, upper_side)
				flag = true
			end
		end
		return flag
	end 
end
