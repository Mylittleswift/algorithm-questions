/***
 132. Palindrome Partitioning II
 Hard

 Given a string s, partition s such that every substring of the partition is a palindrome.
 
 Return the minimum cuts needed for a palindrome partitioning of s.
 
 Example:
 
 Input: "aab"
 Output: 1
 Explanation: The palindrome partitioning ["aa","b"] could be produced using 1 cut.
 ***/



class Solution132x1 {
    func minCut(_ s: String) -> Int {
        var isPalindrome = Array(repeating: Array(repeating: false, count: s.count), count: s.count)
        var res = Array(repeating: Int.max, count: s.count)
        let sArray = Array(s)
        
        for i in 0..<s.count {
            for j in 0..<i + 1 {
                if sArray[j] == sArray[i] && (i - j < 2 || isPalindrome[j + 1][i - 1]) {
                    res[i] = j == 0 ? 0 : min(res[i], res[j - 1] + 1)
                    isPalindrome[j][i] = true
                }
            }
        }
        
        return res[res.count - 1]
    }
}


class Solution132x2 {
    func minCut(_ s: String) -> Int {
        if s.isEmpty {
            return 0
        }
        
        let count = s.count
        var nums = Array(repeating: 0, count: count+1)
        for i in 0...count {
            nums[i] = count - i - 1
        }
        var p = Array(repeating: Array(repeating: false, count: count), count: count)
        let sArr = Array(s)
        
        for i in stride(from: count-1, to: -1, by: -1) {
            for j in i..<count {
                if sArr[i] == sArr[j] && (j-i<=1 || p[i+1][j-1]) {
                    p[i][j] = true
                    nums[i] = min(nums[i], nums[j+1] + 1)
                }
            }
        }
        
        
        return nums[0]
    }
}


class Solution132x3 {
    func minCut(_ s: String) -> Int {
        
        var n = s.count
        guard n > 1 else { return 0 }
        let s = Array(s)
        var p = Array(repeating: Array(repeating: false, count: n), count: n )
        var dp = [Int]()
        for i in 0...n { dp.append(n-i-1) }
        for i in (0...n-1).reversed() {
            for j in i...n-1 {
                if s[i] == s[j], (j-i <= 1 || p[i+1][j-1]) {
                    p[i][j] = true
                    dp[i] = min(dp[i], dp[j+1]+1)
                }
            }
        }
        return dp[0]
    }
}


class Solution132x4 {
    func minCut(_ s: String) -> Int {
        var res = [Int](repeating: Int.max, count: s.count)
        var isPalindrome = Array(repeating: Array(repeating: false, count: s.count), count: s.count)
        let sArray = Array(s)
        
        for i in 0..<s.count {
            for j in 0..<i + 1 {
                if sArray[i] == sArray[j] && (i - j < 2 || isPalindrome[j + 1][i - 1]) {
                    res[i] = j == 0 ? 0 : min(res[i], res[j - 1] + 1)
                    isPalindrome[j][i] = true
                }
            }
        }
        
        return res[res.count - 1]
    }
}
