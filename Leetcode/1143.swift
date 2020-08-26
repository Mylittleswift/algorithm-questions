/***
 1143. Longest Common Subsequence
 Medium

 Given two strings text1 and text2, return the length of their longest common subsequence.
 
 A subsequence of a string is a new string generated from the original string with some characters(can be none) deleted without changing the relative order of the remaining characters. (eg, "ace" is a subsequence of "abcde" while "aec" is not). A common subsequence of two strings is a subsequence that is common to both strings.
 
 
 
 If there is no common subsequence, return 0.
 
 
 
 Example 1:
 
 Input: text1 = "abcde", text2 = "ace"
 Output: 3
 Explanation: The longest common subsequence is "ace" and its length is 3.
 Example 2:
 
 Input: text1 = "abc", text2 = "abc"
 Output: 3
 Explanation: The longest common subsequence is "abc" and its length is 3.
 Example 3:
 
 Input: text1 = "abc", text2 = "def"
 Output: 0
 Explanation: There is no such common subsequence, so the result is 0.
 
 
 Constraints:
 
 1 <= text1.length <= 1000
 1 <= text2.length <= 1000
 The input strings consist of lowercase English characters only.
 ***/



class Solution1143x1 {
    func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
        var chars1 = Array(text1)
        var chars2 = Array(text2)
        var memo = [[Int]](repeating:[Int](repeating: 0, count:chars2.count+1), count: chars1.count+1)
        
        for i in chars1.indices {
            for j in chars2.indices {
                
                if chars1[i] == chars2[j] {
                    memo[i+1][j+1] = memo[i][j] + 1
                } else {
                    memo[i+1][j+1] = max(memo[i][j+1], memo[i+1][j])
                }
            }
        }
        return memo[chars1.count][chars2.count]
    }
}


class Solution1143X2 {
    func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
        var dp = [[Int]](repeating: [Int](repeating: 0, count: text2.count + 1), count: text1.count + 1)
        let text1 = Array(text1)
        let text2 = Array(text2)
        for i in 1..<text1.count + 1 {
            for j in 1..<text2.count + 1 {
                if text1[i-1] == text2[j-1] {
                    dp[i][j] = 1 + dp[i-1][j-1]
                } else {
                    dp[i][j] = max(dp[i-1][j], dp[i][j-1])
                }
            }
        }
        return dp.last!.last!
    }
}
