/***
 115. Distinct Subsequences
 Hard

 Given a string S and a string T, count the number of distinct subsequences of S which equals T.
 
 A subsequence of a string is a new string which is formed from the original string by deleting some (can be none) of the characters without disturbing the relative positions of the remaining characters. (ie, "ACE" is a subsequence of "ABCDE" while "AEC" is not).
 
 It's guaranteed the answer fits on a 32-bit signed integer.
 
 Example 1:
 
 Input: S = "rabbbit", T = "rabbit"
 Output: 3
 Explanation:
 As shown below, there are 3 ways you can generate "rabbit" from S.
 (The caret symbol ^ means the chosen letters)
 
 rabbbit
 ^^^^ ^^
 rabbbit
 ^^ ^^^^
 rabbbit
 ^^^ ^^^
 Example 2:
 
 Input: S = "babgbag", T = "bag"
 Output: 5
 Explanation:
 As shown below, there are 5 ways you can generate "bag" from S.
 (The caret symbol ^ means the chosen letters)
 
 babgbag
 ^^ ^
 babgbag
 ^^    ^
 babgbag
 ^    ^^
 babgbag
 ^  ^^
 babgbag
 ^^^
 ***/



class Solution115x1 {
    func numDistinct(_ s: String, _ t: String) -> Int {
        let s = Array(s)
        let t = Array(t)
        var r = Array(repeating:0, count: t.count)
        let dict = t.enumerated().reduce(into: [Character: [Int]]()) { $0[$1.1, default:[]].append($1.0) }
        for i in 0..<s.count {
            guard let indices = dict[s[i]] else { continue }
            for j in indices.reversed() {
                if j == 0 {
                    r[0] += 1
                } else {
                    r[j] += r[j-1]
                }
            }
        }
        return r[r.count-1]
    }
}


class Solution115x2 {
    func numDistinct(_ s: String, _ t: String) -> Int {
        if s.isEmpty {return 0}
        let len:Int = s.count
        var dp:[Int] = [Int](repeating:1,count:len)
        var pre:Int,temp:Int
        let arrS:[Character] = Array(s)
        let arrT:[Character] = Array(t)
        for i in 0..<t.count
        {
            pre = dp[0]
            dp[0] = (i == 0 && arrS[0] == arrT[0]) ? 1 : 0
            for k in 1..<len
            {
                temp = dp[k]
                dp[k] = dp[k - 1] + (arrS[k] == arrT[i] ? pre : 0)
                pre = temp
            }
        }
        return dp[len - 1]
    }
}


class Solution115x3 {
    func numDistinct(_ s: String, _ t: String) -> Int {
        if t.isEmpty { return 1 }
        if s.isEmpty || t.isEmpty { return 0 }
        var dp = Array(repeating: Array(repeating: 0, count: s.count + 1), count: t.count + 1)
        let arrS = Array(s)
        let arrT = Array(t)
        
        dp[0][0] = 1
        
        for i in 0...t.count {
            for j in 1...s.count {
                if i == 0 {
                    dp[0][j] = 1
                } else if arrS[j - 1] == arrT[i - 1] {
                    dp[i][j] = dp[i - 1][j - 1] + dp[i][j - 1]
                } else {
                    dp[i][j] = dp[i][j - 1]
                }
            }
        }
        
        return dp[t.count][s.count]
    }
}



class Solution115x4 {
    func numDistinct(_ s: String, _ t: String) -> Int {
        return numDistinctDP(s, t)
    }
    
    func numDistinctDP(_ s: String, _ t: String) -> Int {
        guard !s.isEmpty else { return 0 }
        
        var sArray = Array(s)
        var tArray = Array(t)
        var matrix = Array(repeating: Array(repeating: 0, count: s.count + 1),
                           count: t.count + 1)
        
        for i in 0...s.count {
            matrix[0][i] = 1
        }
        
        for i in 1...t.count {
            for j in 1...s.count {
                
                if tArray[i-1] == sArray[j-1] {
                    matrix[i][j] = matrix[i][j-1] + matrix[i-1][j-1]
                } else {
                    matrix[i][j] = matrix[i][j-1]
                }
                
            }
        }
        
        return matrix[t.count][s.count]
    }
    
    func isSubsequenceIteration(_ s: String, _ t: String) -> Bool {
        guard !s.isEmpty else { return true }
        guard !t.isEmpty else { return false }
        
        let sArray = Array(s)
        let tArray = Array(t)
        var current = 0
        
        for character in tArray {
            if sArray[current] == character {
                current += 1
                if current == sArray.count {
                    return true
                }
            }
        }
        
        return false
    }
}
