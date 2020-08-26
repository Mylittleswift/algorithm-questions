/***
 44. Wildcard Matching
 Hard

 Given an input string (s) and a pattern (p), implement wildcard pattern matching with support for '?' and '*'.
 
 '?' Matches any single character.
 '*' Matches any sequence of characters (including the empty sequence).
 The matching should cover the entire input string (not partial).
 
 Note:
 
 s could be empty and contains only lowercase letters a-z.
 p could be empty and contains only lowercase letters a-z, and characters like ? or *.
 Example 1:
 
 Input:
 s = "aa"
 p = "a"
 Output: false
 Explanation: "a" does not match the entire string "aa".
 Example 2:
 
 Input:
 s = "aa"
 p = "*"
 Output: true
 Explanation: '*' matches any sequence.
 Example 3:
 
 Input:
 s = "cb"
 p = "?a"
 Output: false
 Explanation: '?' matches 'c', but the second letter is 'a', which does not match 'b'.
 Example 4:
 
 Input:
 s = "adceb"
 p = "*a*b"
 Output: true
 Explanation: The first '*' matches the empty sequence, while the second '*' matches the substring "dce".
 Example 5:
 
 Input:
 s = "acdcb"
 p = "a*c?b"
 Output: false
 ***/


class Solution44x1 {
    func isMatch(_ s: String, _ p: String) -> Bool {
        var sIndex = 0
        var pIndex = 0
        var match = 0
        var starIndex = -1
        
        let ss = s.utf8CString
        let pp = p.utf8CString
        let q = "?".utf8CString.first!
        let star = "*".utf8CString.first!
        
        while sIndex < ss.count - 1 {
            if pIndex < pp.count - 1 && (pp[pIndex] == q || pp[pIndex] == ss[sIndex]) {
                sIndex += 1
                pIndex += 1
            } else if pIndex < pp.count - 1 && pp[pIndex] == star {
                starIndex = pIndex
                match = sIndex
                pIndex += 1
            } else if starIndex != -1 {
                pIndex = starIndex + 1
                match += 1
                sIndex = match
            } else {
                return false
            }
        }
        while pIndex < pp.count - 1 && pp[pIndex] == star {
            pIndex += 1
        }
        return pIndex == pp.count - 1
    }
}


class Solution44x2 {
    func isMatch(_ s: String, _ p: String) -> Bool {
        if s.count == 0 && p.count == 0 {
            return true
        }
        var sc = 0
        var pc = 0
        var startIndex = -1
        var last = -1
        
        var sA = Array(s)
        var pA = Array(p)
        
        while sc < s.count {
            if pc < p.count && (sA[sc] == pA[pc] || pA[pc] == "?") {
                sc += 1
                pc += 1
            } else if pc < p.count && pA[pc] == "*" {
                startIndex = pc
                last = sc
                pc += 1
            } else if startIndex != -1 {
                pc = startIndex + 1
                last += 1
                sc = last
            } else {
                return false
            }
        }
        
        while pc < p.count && pA[pc] == "*" {
            pc += 1
        }
        
        return pc == p.count
    }
}



// dp method
class Solution44x4 {
    func isMatch(_ s: String, _ p: String) -> Bool {
        var s = ["a"] + Array(s)
        var p = ["a"] + Array(p)
        var dp = Array(repeating: Array(repeating: false, count: p.count), count: s.count)
        dp[0][0] = true //"a" == "a"
        
        for pi in 1..<p.count {
            if p[pi] == "*" {
                dp[0][pi] = true
            } else {
                break
            }
        }
        
        for si in 1..<s.count {
            for pi in 1..<p.count {
                if p[pi] == "*" {
                    dp[si][pi] = dp[si - 1][pi] || dp[si][pi - 1]
                } else {
                    dp[si][pi] = dp[si - 1][pi - 1] && (s[si] == p[pi] || p[pi] == "?")
                }
                
            }
        }
        return dp[s.count - 1][p.count - 1]
    }
}


