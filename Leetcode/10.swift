/***
 10. Regular Expression Matching
 Hard

 Given an input string (s) and a pattern (p), implement regular expression matching with support for '.' and '*'.
 
 '.' Matches any single character.
 '*' Matches zero or more of the preceding element.
 The matching should cover the entire input string (not partial).
 
 Note:
 
 s could be empty and contains only lowercase letters a-z.
 p could be empty and contains only lowercase letters a-z, and characters like . or *.
 Example 1:
 
 Input:
 s = "aa"
 p = "a"
 Output: false
 Explanation: "a" does not match the entire string "aa".
 Example 2:
 
 Input:
 s = "aa"
 p = "a*"
 Output: true
 Explanation: '*' means zero or more of the preceding element, 'a'. Therefore, by repeating 'a' once, it becomes "aa".
 Example 3:
 
 Input:
 s = "ab"
 p = ".*"
 Output: true
 Explanation: ".*" means "zero or more (*) of any character (.)".
 Example 4:
 
 Input:
 s = "aab"
 p = "c*a*b"
 Output: true
 Explanation: c can be repeated 0 times, a can be repeated 1 time. Therefore, it matches "aab".
 Example 5:
 
 Input:
 s = "mississippi"
 p = "mis*is*p*."
 Output: false
 ***/


enum Result {
    case TRUE,FALSE
}
class Solution10x1 {
    var memo: [[Result?]] = [[Result?]]()
    func isMatch(_ s: String, _ p: String) -> Bool {
        let col: Int = p.count + 1
        let row: Int = s.count + 1
        memo = [[Result?]](repeating: [Result?](repeating: nil, count: col), count: row)
        return dp(0, 0, s, p)
    }
    
    func dp(_ i: Int, _ j: Int, _ text: String, _ pattern: String) -> Bool {
        if memo[i][j] != nil {
            return memo[i][j] == Result.TRUE
        }
        var ans:Bool
        if j == pattern.count {
            ans = i == text.count
        } else {
            let first_match: Bool = i < text.count && (pattern.charAt(j) == text.charAt(i) || pattern.charAt(j) == ".")
            if j + 1 < pattern.count && pattern.charAt(j + 1) == "*" {
                ans = dp(i, j + 2, text, pattern) || first_match && dp(i + 1, j, text, pattern)
            } else {
                ans = first_match && dp(i + 1, j + 1, text, pattern)
            }
        }
        memo[i][j] = ans ? Result.TRUE : Result.FALSE
        return ans
    }
}


class Solution10x2 {
    func isMatch(_ s: String, _ p: String) -> Bool {
        let s = Array(s), p = Array(p)
        var rec: [[Bool]] = Array(repeating: Array(repeating: false, count: p.count + 1), count: s.count + 1)
        
        rec[0][0] = true
        for i in 0..<p.count {
            if p[i] == "*" {
                rec[0][i + 1] = rec[0][i - 1]
            }
        }
        
        for i in 0..<s.count {
            for j in 0..<p.count {
                if p[j] != "*" {
                    if rec[i][j] {
                        if p[j] == "." || p[j] == s[i] {
                            rec[i + 1][j + 1] = true
                        }
                    }
                } else {
                    if rec[i + 1][j - 1] {
                        rec[i + 1][j + 1] = true
                    } else if rec[i][j - 1] || rec[i][j + 1] {
                        if p[j - 1] == s[i] || p[j - 1] == "." {
                            rec[i + 1][j + 1] = true
                        }
                    }
                }
            }
        }
        return rec[s.count][p.count]
    }
}


class Solution10x3 {
    func isMatch(_ s: String, _ p: String) -> Bool {
        let arrayS = Array(s),
        lenS = arrayS.count,
        arrayP = Array(p),
        lenP = arrayP.count
        var dp = [[Bool]](repeating: [Bool](repeating: false, count: lenP + 1), count: lenS + 1)
        dp[0][0] = true
        for i in 0..<lenP {
            if arrayP[i] == "*" && dp[0][i - 1] {
                dp[0][i+1] = true
            }
        }
        for i in 0..<lenS {
            for j in 0..<lenP {
                if arrayP[j] == "." {
                    dp[i+1][j+1] = dp[i][j]
                }
                if arrayP[j] == arrayS[i] {
                    dp[i+1][j+1] = dp[i][j]
                }
                if arrayP[j] == "*" {
                    if arrayP[j-1] != arrayS[i] &&
                        arrayP[j-1] != "." {
                        dp[i+1][j+1] = dp[i+1][j-1]
                    } else {
                        dp[i+1][j+1] = (dp[i+1][j] || dp[i][j+1] || dp[i+1][j-1])
                    }
                }
            }
        }
        return dp[lenS][lenP]
}



    class Solution10x4 {
        func isMatch(_ s: String, _ p: String) -> Bool {
            let sChars = s.utf8CString
            let pChars = p.utf8CString
            var dp = Array(repeating: Array(repeating: false, count: pChars.count), count: sChars.count)
            dp[0][0] = true
            
            for i in 0...pChars.count-1 {
                dp[0][i] = i == 0 || i > 1 && dp[0][i-2] && pChars[i-1] == 42
            }
            
            for i in 0...sChars.count-1 {
                for j in 0...pChars.count-1 {
                    guard j > 0 else {
                        continue
                    }
                    
                    let pCurrent = pChars[j - 1]
                    
                    if pCurrent != 42 {
                        dp[i][j] = i > 0 && dp[i-1][j-1] && (pCurrent == 46 || pCurrent == sChars[i - 1])
                    } else {
                        dp[i][j] = dp[i][j-2] || i > 0 && j > 1 && (sChars[i-1] == pChars[j-2] || pChars[j-2] == 46) && dp[i-1][j]
                    }
                }
            }
            return dp[sChars.count-1][pChars.count-1]
        }
}


    class Solution10x5 {
        func isMatch(_ s: String, _ p: String) -> Bool {
            let text = Array(s)
            let patter = Array(p)
            var dp = [[Bool]](repeating: [Bool](repeating: false, count: patter.count+1), count: text.count+1)
            dp[text.count][patter.count] = true
            for i in stride(from: text.count, to: -1, by: -1) {
                for j in stride(from: patter.count-1, to: -1, by: -1) {
                    let first_match = (i < text.count && (patter[j] == text[i] || patter[j] == "."));
                    if j + 1 < patter.count && patter[j+1] == "*" {
                        dp[i][j] = dp[i][j+2] || first_match && dp[i+1][j];
                    } else {
                        dp[i][j] = first_match && dp[i+1][j+1];
                    }
                }
            }
            return dp[0][0];
        }
}


    class Solution10x6 {
        func isMatch(_ s: String, _ p: String) -> Bool {
            guard !p.isEmpty else {
                guard s.isEmpty else { return false }
                return true
            }
            
            let s = Array(s)
            let p = Array(p)
            
            // matchMatrix[i][j] first i chars in s match p[0...j]
            var match = Array(repeating: Array(repeating: false, count: p.count), count: s.count + 1)
            
            // init for i = 0
            for j in 1..<p.count {
                if p[j] == "*" {
                    match[0][j] = j > 1 ? match[0][j-2] : true
                }
            }
            
            guard !s.isEmpty else { return match[0][p.count - 1] }
            for i in 1...s.count {
                if i == 1 {
                    match[1][0] = p[0] == "." ? true : s[0] == p[0]
                }
                for j in 1..<p.count {
                    switch p[j] {
                    case ".":
                        match[i][j] = match[i - 1][j - 1]
                    case "*":
                        if p[j - 1] == "." || s[i - 1] == p[j - 1] { // match preceding element
                            match[i][j] = match[i - 1][j] || match[i - 1][j - 1]
                        }
                        
                        guard !match[i][j] else { continue }
                        if j > 1 { // match zero element
                            match[i][j] = match[i][j - 2]
                        }
                    case s[i - 1]:
                        match[i][j] = match[i - 1][j - 1]
                    default:
                        continue
                    }
                }
            }
            return match[s.count][p.count - 1]
        }
        
}


    struct Token {
        var char:Character
        var isStar:Bool
    }
    
    class Solution10x7 {
        func isMatch(_ s: String, _ p: String) -> Bool{
            let sChars = Array(s), pChars = Array(p)
            var dp = Array(repeating: Array(repeating: false, count: pChars.count + 1), count: sChars.count + 1)
            dp[0][0] = true
            
            for i in 0...pChars.count {
                // jump over "" vs. "x*" case
                dp[0][i] = i == 0 || i > 1 && dp[0][i - 2] && pChars[i - 1] == "*"
            }
            
            for i in 0...sChars.count {
                for j in 0...pChars.count {
                    guard j > 0 else {
                        continue
                    }
                    
                    let pCurrent = pChars[j - 1]
                    
                    if pCurrent != "*" {
                        dp[i][j] = i > 0 && dp[i - 1][j - 1] && (pCurrent == "." || pCurrent == sChars[i - 1])
                    } else {
                        dp[i][j] = dp[i][j - 2] || i > 0 && j > 1 && (sChars[i - 1] == pChars[j - 2] || pChars[j - 2] == ".") && dp[i - 1][j]
                    }
                }
            }
            
            return dp[sChars.count][pChars.count]
        }
}


    class Solution10x8 {
        
        var visited = [[Bool]]()
        
        func isMatch(_ s: String, _ p: String) -> Bool {
            for _ in 0..<s.count {
                var line = [Bool]()
                for _ in 0..<p.count {
                    line.append(false)
                }
                visited.append(line)
            }
            return rec(s, p, 0, 0)
        }
        
        func rec(_ sStr: String, _ pStr: String, _ sindex: Int, _ pindex:Int) -> Bool {
            let s = Array(sStr)
            let p = Array(pStr)
            
            if s.count>sindex && p.count>pindex {
                if visited[sindex][pindex] {
                    return false
                } else {
                    visited[sindex][pindex] = true
                }
            }
            
            if sindex >= s.count && pindex >= p.count {
                return true
            }
            
            if pindex < p.count-1 && p[pindex+1] == "*" {
                if p[pindex] == "." {
                    for i in 0..<s.count-sindex {
                        if rec(sStr,pStr,sindex+i,pindex+2) {
                            return true
                        }
                    }
                    if rec(sStr, pStr, s.count, pindex+2) {
                        return true
                    }
                } else {
                    var i = 0
                    while sindex+i < s.count && s[sindex+i] == p[pindex] {
                        if rec(sStr, pStr, sindex+i, pindex+2) {
                            return true
                        }
                        i += 1
                    }
                    if rec(sStr, pStr, sindex+i, pindex+2) {
                        return true
                    }
                }
            } else {
                if pindex<p.count && sindex<s.count && (p[pindex] == s[sindex] || p[pindex] == ".") {
                    return rec(sStr, pStr , sindex+1, pindex+1)
                } else {
                    return false
                }
            }
            return false
        }
    }
}

