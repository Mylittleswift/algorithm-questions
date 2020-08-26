/***
150. Evaluate Reverse Polish Notation
Medium

Evaluate the value of an arithmetic expression in Reverse Polish Notation.

Valid operators are +, -, *, /. Each operand may be an integer or another expression.

Note:

Division between two integers should truncate toward zero.
The given RPN expression is always valid. That means the expression would always evaluate to a result and there won't be any divide by zero operation.
Example 1:

Input: ["2", "1", "+", "3", "*"]
Output: 9
Explanation: ((2 + 1) * 3) = 9
Example 2:

Input: ["4", "13", "5", "/", "+"]
Output: 6
Explanation: (4 + (13 / 5)) = 6
Example 3:

Input: ["10", "6", "9", "3", "+", "-11", "*", "/", "*", "17", "+", "5", "+"]
Output: 22
Explanation:
((10 * (6 / ((9 + 3) * -11))) + 17) + 5
= ((10 * (6 / (12 * -11))) + 17) + 5
= ((10 * (6 / -132)) + 17) + 5
= ((10 * 0) + 17) + 5
= (0 + 17) + 5
= 17 + 5
= 22
***/



class Solution150x1 {
    func evalRPN(_ tokens: [String]) -> Int {
        var intStack = [Int]()
        for t in tokens {
            switch t {
            case "+":
                guard let a = intStack.popLast(), let b = intStack.popLast() else {return -1}
                intStack.append(a+b)
            case "-":
                guard let a = intStack.popLast(), let b = intStack.popLast() else {return -1}
                intStack.append(b-a)
            case "*":
                guard let a = intStack.popLast(), let b = intStack.popLast() else {return -1}
                intStack.append(b*a)
            case "/":
                guard let a = intStack.popLast(), let b = intStack.popLast() else {return -1}
                intStack.append(b/a)
            default:
                guard let n = Int(t) else {return -1}
                intStack.append(n)
            }
        }
        return intStack.last!
    }
}


class Stack<T> {
    var arr = [T]()
    
    func insert(_ v: T) {
        arr.append(v)
    }
    
    func dequeue() -> T? {
        if arr.count == 0 { return nil }
        return arr.removeLast()
    }
}

class Solution150x2 {
    func evalRPN(_ tokens: [String]) -> Int {
        let stack = Stack<Int>()
        for item in tokens {
            if let numericItem = Int(item) {
                stack.insert(numericItem)
            } else {
                if let rhs = stack.dequeue(), let lhs = stack.dequeue() {
                    switch item {
                    case "+":
                        stack.insert(lhs + rhs)
                    case "-":
                        stack.insert(lhs - rhs)
                    case "*":
                        stack.insert(lhs * rhs)
                    case "/":
                        stack.insert(lhs / rhs)
                    default:
                        break
                    }
                } else {
                    fatalError("wrong rpn")
                }
            }
        }
        return stack.dequeue()!
    }
}


class Solution150x3 {
    private struct Stack<Type> {
        var arr = [Type]()
        mutating func push(_ e: Type) {
            arr.insert(e, at: arr.count)
        }
        mutating func pop() -> Type? {
            if arr.count > 0 {
                return arr.remove(at: arr.count-1)
            }
            return nil
        }
        
        var isEmpty: Bool {
            return arr.count <= 0
        }
    }
    
    func evalRPN(_ tokens: [String]) -> Int {
        var stack = Stack<Int>()
        for str in tokens {
            if let num = Int(str) {
                stack.push(num)
            } else {
                let op2 = stack.pop()!
                let op1 = stack.pop()!
                var ret = 0
                switch str {
                case "+":
                    ret = op1 + op2
                case "-":
                    ret = op1 - op2
                case "*":
                    ret = op1 * op2
                case "/":
                    ret = op1 / op2
                default:
                    break
                }
                stack.push(ret)
            }
        }
        return stack.pop()!
    }
}


class Solution150x4 {
    func evalRPN(_ tokens: [String]) -> Int {
        var stack = [Int]()
        
        for char in tokens {
            switch char {
            case "+":
                stack.append(stack.remove(at: stack.count - 2) + stack.removeLast())
            case "-":
                stack.append(stack.remove(at: stack.count - 2) - stack.removeLast())
            case "*":
                stack.append(stack.remove(at: stack.count - 2) * stack.removeLast())
            case "/":
                stack.append(stack.remove(at: stack.count - 2) / stack.removeLast())
            default:
                stack.append(Int(String(char))!)
            }
        }
        
        return stack.first!
    }
}
