/***
 32. Longest Valid Parentheses
 Hard

 Given a string containing just the characters '(' and ')', find the length of the longest valid (well-formed) parentheses substring.
 
 Example 1:
 
 Input: "(()"
 Output: 2
 Explanation: The longest valid parentheses substring is "()"
 Example 2:
 
 Input: ")()())"
 Output: 4
 Explanation: The longest valid parentheses substring is "()()"
 ***/



class Solution32x1 {
    func longestValidParentheses(_ s: String) -> Int {
        let s = Array(s)
        let len = s.count
        var max = Array(repeating: 0, count: len)
        var i = len-2
        var res = 0
        while i >= 0 {
            // find max[i]
            if s[i] == ")" {
                i -= 1
                continue
            }
            
            // s[i] = '('
            if s[i+1] == ")" {
                max[i] = 2 + (i < len-2 ? max[i+2] : 0)
            } else {
                let j = i + 1 + max[i+1];
                if j < len && s[j] == ")" {
                    max[i] = 2 + max[i+1] + (j < len-1 ? max[j+1] : 0)
                }
            }
            if max[i] > res { res = max[i] }
            
            i -= 1
        }
        
        return res
    }
}


class Solution32x2 {
    func longestValidParentheses(_ s: String) -> Int {
        guard s.count>0 else { return 0}
        var dp = Array(repeating:0,count:s.count)
        var sarr = Array(s)
        var maxLen = 0
        for i in 1..<sarr.count {
            if(sarr[i]==")") {
                if(sarr[i-1]=="(") {  //()
                    dp[i] = (i>=2 ? dp[i-2]: 0) + 2
                }
                else {  // ))
                    let prevIdx = i-dp[i-1]-1
                    
                    if(prevIdx>=0 && sarr[prevIdx] == "(") {  //We found another enclosing parantheses
                        dp[i] = dp[i-1] + 2 + (prevIdx-1>=0 ? dp[prevIdx-1] : 0)
                    }
                }
            }
            if(dp[i]>=0) {
                maxLen = max(dp[i],maxLen)
            }
        }
        return maxLen
    }
}


class Solution32x3 {
    func longestValidParentheses(_ s: String) -> Int {
        if s.count == 0 {
            return 0
        }
        var stack = [Int]()
        stack.append(-1)
        var arr = Array(s)
        var res = 0
        for i in 0..<arr.count {
            if arr[i] == ")" {
                if stack.count > 1 && arr[stack.last!] == "(" {
                    stack.removeLast()
                    res = max(res, i - stack.last!)
                } else {
                    stack.append(i)
                }
            } else {
                stack.append(i)
            }
        }
        return res
    }
}


class Solution32x4 {
    func longestValidParentheses(_ s: String) -> Int {
        typealias Element = (index: Int, isOpening: Bool)
        var stack = [Element]()
        var maxCount = 0
        for (i, char) in s.enumerated() {
            if char == "(" {
                stack.append((index: i, isOpening: true))
            } else {
                if !stack.isEmpty && stack.last!.isOpening {
                    stack.removeLast()
                    let lastIndex = stack.last?.index ?? -1
                    let currentCount = i - lastIndex
                    maxCount = max(maxCount, currentCount)
                } else {
                    stack.append((index: i, isOpening: false))
                }
            }
        }
        return maxCount
    }
}


class Solution32x5 {
    func longestValidParentheses(_ s: String) -> Int {
        var stack: [Int] = [-1]
        var array = Array(s)
        var res = 0
        for i in 0..<array.count {
            if array[i] == "(" {
                stack.append(i)
            } else if array[i] == ")" {
                stack.removeLast()
                if !stack.isEmpty {
                    res = max(res, i - stack.last!)
                } else {
                    stack.append(i)
                }
            }
        }
        return res
    }
}
