/***
 227. Basic Calculator II
 Medium

 Implement a basic calculator to evaluate a simple expression string.
 
 The expression string contains only non-negative integers, +, -, *, / operators and empty spaces . The integer division should truncate toward zero.
 
 Example 1:
 
 Input: "3+2*2"
 Output: 7
 Example 2:
 
 Input: " 3/2 "
 Output: 1
 Example 3:
 
 Input: " 3+5 / 2 "
 Output: 5
 Note:
 
 You may assume that the given expression is always valid.
 Do not use the eval built-in library function.
 ***/



class Solution227x1 {
    func calculate(_ s: String) -> Int {
        var num = 0
        var sign = "+"
        var strArr = Array(s)
        var stack = [Int]()
        var res = 0
        
        for i in 0..<strArr.count {
            if strArr[i] >= "0" && strArr[i] <= "9" {
                num = num * 10 + Int(String(strArr[i]))!
            }
            
            if ((strArr[i] < "0" || strArr[i] > "9") && strArr[i] != " ") || i == strArr.count - 1 {
                if sign == "+" {
                    stack.append(num)
                } else if sign == "-" {
                    stack.append(-num)
                } else if sign == "*" {
                    stack.append(stack.removeLast() * num)
                } else if sign == "/" {
                    stack.append(stack.removeLast() / num)
                }
                
                sign = String(strArr[i])
                num = 0
            }
        }
        
        
        for i in stack {
            res += i
        }
        
        return res
    }
}


class Solution227x2 {
    func calculate(_ s: String) -> Int {
        var stack = [Int]()
        var str = Array(s+"+")
        
        var num = 0
        var sign: Character = "+"
        
        for char in str {
            if char >= "0" && char <= "9" {
                num = num * 10 + Int(String(char))!
            } else if operators.contains(char) {
                if sign == "+" || sign == "-"{
                    stack.append((sign == "-" ? -1 : 1) * num)
                } else if sign == "*" || sign == "/" {
                    let n = stack.removeLast()
                    stack.append(sign == "*" ? n * num : n / num)
                }
                num = 0
                sign = char
            }
        }
        return stack.reduce(0, +)
    }
    
    let operators = Set<Character>(["+", "-", "*", "/"])
}



class Solution227x3 {
    func calculate(_ s: String) -> Int {
        var stack = [Int]()
        var str = Array(s+"+")
        
        var num = 0
        var sign: Character = "+"
        
        for char in str {
            if operands.contains(char) {
                num = num * 10 + Int(String(char))!
            } else if operators.contains(char) {
                if sign == "+" || sign == "-"{
                    stack.append((sign == "-" ? -1 : 1) * num)
                } else if sign == "*" || sign == "/" {
                    let n = stack.removeLast()
                    stack.append(sign == "*" ? n * num : n / num)
                }
                num = 0
                sign = char
            }
        }
        return stack.reduce(0, +)
    }
    
    let operators = Set<Character>(["+", "-", "*", "/"])
    let operands = Set<Character>(["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"])
}
