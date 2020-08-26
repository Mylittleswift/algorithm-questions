/***
 22. Generate Parentheses
 Medium

 Given n pairs of parentheses, write a function to generate all combinations of well-formed parentheses.
 
 For example, given n = 3, a solution set is:
 
 [
 "((()))",
 "(()())",
 "(())()",
 "()(())",
 "()()()"
 ]
 ***/

class Solution22x1 {
    func generateParenthesis(_ n: Int) -> [String] {
        var ans:[String] = [String]()
        backtrack(&ans, "", 0, 0, n)
        return ans
    }
    
    func backtrack(_ ans: inout [String], _ cur: String, _ open: Int, _ close: Int, _ max: Int) {
        if cur.count == max * 2 {
            ans.append(cur)
            return
        }
        if open < max {
            backtrack(&ans, cur + "(", open + 1, close, max)
        }
        if close < open {
            backtrack(&ans, cur + ")", open, close + 1, max)
        }
    }
}


class Solution22x2 {
    func generateParenthesis(_ n: Int) -> [String] {
        var ans = [String]()
        if n == 0 {
            ans.append("")
        } else {
            for c in 0..<n {
                for left in generateParenthesis(c) {
                    for right in generateParenthesis(n-1-c) {
                        ans.append("(" + left + ")" + right)
                    }
                }
            }
        }
        return ans
    }
}



class Solution22x5 {
    func generateParenthesis(_ n: Int) -> [String] {
        guard n > 0 else {
            return []
        }
        var result = [String]()
        
        dfs(left: 0, right: 0, buffer: "", result: &result, n: n)
        
        return result
    }
    
    func dfs(left: Int, right: Int, buffer: String, result: inout [String], n: Int) {
        if left == n && right == n {
            result.append(buffer)
            return
        }
        
        if left < n {
            dfs(left: left + 1, right: right, buffer: buffer + "(", result: &result, n: n)
        }
        
        if left > right {
            dfs(left: left, right: right + 1, buffer: buffer + ")", result: &result, n: n)
        }
    }
}


class Solution22x6 {
    func generateParenthesis(_ n: Int) -> [String] {//闭合数
        return generateBracket(n)
    }
    
    func generateBracket(_ n: Int) -> [String] {
        if n <= 0 {
            return [""]
        }
        
        
        var bracket : [String] = []
        
        for idx in 0..<n {
            for left in generateBracket(idx) {
                for right in generateBracket(n-idx-1) {
                    bracket.append("(\(left))\(right)")
                }
            }
        }
        
        return bracket
    }
}


class Solution22x7 {
    func generateParenthesis(_ n: Int) -> [String] {
        if n == 0 {return []}
        return dfs("",  n, n)
    }
    
    //遍历叶子节点
    func dfs(_ head: String, _ left: Int, _ right: Int) -> [String] {
        if left == 0 && right == 0 {
            return [head]
        }
        var res = [String]()
        if left > 0 {
            res = res + dfs(head + "(", left-1, right)
        }
        if right > left  {
            res = res + dfs(head + ")", left, right-1)
        }
        return res
    }
}
