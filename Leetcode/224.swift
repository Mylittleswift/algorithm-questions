/***
 224. Basic Calculator
 Hard

 Implement a basic calculator to evaluate a simple expression string.
 
 The expression string may contain open ( and closing parentheses ), the plus + or minus sign -, non-negative integers and empty spaces .
 
 Example 1:
 
 Input: "1 + 1"
 Output: 2
 Example 2:
 
 Input: " 2-1 + 2 "
 Output: 3
 Example 3:
 
 Input: "(1+(4+5+2)-3)+(6+8)"
 Output: 23
 Note:
 You may assume that the given expression is always valid.
 Do not use the eval built-in library function.
 ***/



class Solution224x1 {
    func calculate(_ s: String) -> Int {
        var num = 0
        var res = 0
        var sign = 1
        var stack = [Int]()
        var s = Array(s)
        for i in 0 ..< s.count {
            var c = s[i]
            
            if c == "+" {
                res += sign*num
                num = 0
                sign = 1
            } else if c == "-" {
                res += sign*num
                num = 0
                sign = -1
            } else if c == "(" {
                stack.append(res)
                stack.append(sign)
                res = 0
                sign = 1
            } else if c == ")" {
                res += sign*num
                num = 0
                res *= stack.removeLast()
                res += stack.removeLast()
            } else {
                if let n = Int(String(c)) {
                    num = 10*num+n
                }
            }
        }
        
        if num != 0 {
            res += sign*num
        }
        return res
    }
}


class Solution224x2 {
    func calculate(_ s: String) -> Int {
        var res = 0
        var num = 0
        var sign = 1
        var stack = [Int]()
        let sArray = Array(s)
        
        for i in 0..<sArray.count {
            if let value = Int(String(sArray[i])) {
                num = num * 10 + value
            }else if sArray[i] == "+" || sArray[i] == "-" {
                res += sign * num
                sign = sArray[i] == "+" ? 1 : -1
                num = 0
            }else if sArray[i] == "(" {
                stack.append(res)
                stack.append(sign)
                sign = 1
                res = 0
            }else if sArray[i] == ")" {
                res += num * sign
                let tmp = res * stack.removeLast()
                res = stack.removeLast() + tmp
                sign = 1
                num = 0
            }
        }
        
        return num == 0 ? res : res + sign * num
    }
}
