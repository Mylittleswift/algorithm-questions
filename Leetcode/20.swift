/***
 20. Valid Parentheses
 Easy

 Given a string containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.
 
 An input string is valid if:
 
 Open brackets must be closed by the same type of brackets.
 Open brackets must be closed in the correct order.
 Note that an empty string is also considered valid.
 
 Example 1:
 
 Input: "()"
 Output: true
 Example 2:
 
 Input: "()[]{}"
 Output: true
 Example 3:
 
 Input: "(]"
 Output: false
 Example 4:
 
 Input: "([)]"
 Output: false
 Example 5:
 
 Input: "{[]}"
 Output: true
 ***/


class Solution20x1 {
    func isValid(_ s: String) -> Bool {
        if s.isEmpty {
            return true
        }
        if s.count % 2 == 1 {
            return false
        }
        var map: [Character : Character] = [")" : "(", "}" : "{", "]" : "["]
        //偶数符串若第一个字符就是右边的符号则直接排除
        if map[s[s.startIndex]] != nil {
            return false
        }

        var stackOfString = Stack<Character>()
        //遍历字符串
        for char in s {
            //为右侧符号，且查询字典对应堆栈中最后一个元素
            if map[char] != nil && map[char] == stackOfString.GetLastElement() {
                //出栈
                stackOfString.pop()
            } else {
                //入栈
                stackOfString.push(char)
            }
        }
        return stackOfString.count() == 0
    }
    
    struct Stack<Element> {
        var items = [Element]()
        //入栈
        //mutating 关键字修饰方法是为了能在该方法中修改 struct 或是 enum 的变量
        mutating func push(_ item: Element) {
            items.append(item)
        }
        //出栈
        mutating func pop() -> Element {
            return items.removeLast()
        }
        //返回堆栈中的元素个数
        mutating func count()->Int {
            return items.count
        }
        //获取最后一个元素
        mutating func GetLastElement() -> Element {
            return items[items.count-1]
        }
    }
}


class Solution20x2 {
    func isValid(_ s: String) -> Bool {
        var opened = ""
        for char in s {
            if char == "(" {
                opened += ")"
            } else if char == "{" {
                opened += "}"
            } else if char == "[" {
                opened += "]"
            } else {
                if let prevVal = opened.last, prevVal == char {
                    opened.removeLast()
                } else {
                    return false
                }
            }
        }
        return opened.isEmpty
    }
}


class Solution20x3 {
    func isValid(_ s: String) -> Bool {
        var stack = [Character]()
        
        for char in s {
            if char == "(" || char == "[" || char == "{" {
                stack.append(char)
            } else if char == ")" {
                guard stack.count != 0 && stack.removeLast() == "(" else {
                    return false
                }
            } else if char == "]" {
                guard stack.count != 0 && stack.removeLast() == "[" else {
                    return false
                }
            } else if char == "}" {
                guard stack.count != 0 && stack.removeLast() == "{" else {
                    return false
                }
            }
        }
        return stack.count == 0
    }
}
