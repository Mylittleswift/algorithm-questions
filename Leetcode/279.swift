/***
 279. Perfect Squares
 Medium

 Given a positive integer n, find the least number of perfect square numbers (for example, 1, 4, 9, 16, ...) which sum to n.
 
 Example 1:
 
 Input: n = 12
 Output: 3
 Explanation: 12 = 4 + 4 + 4.
 Example 2:
 
 Input: n = 13
 Output: 2
 Explanation: 13 = 4 + 9.
 ***/



class Solution279x1 {
    func numSquares(_ n: Int) -> Int {
        var n = n
        while n % 4 == 0 {
            n /= 4
        }
        
        if n % 8 == 7 {
            return 4
        }
        
        var a = 0
        while a * a <= n {
            let b = Int(sqrt(Double(n - a * a)))
            if a * a + b * b == n {
                let ca =  a == 0 ? 0 : 1
                let cb = b == 0 ? 0 : 1
                return ca + cb
            }
            a += 1
        }
        
        return 3
    }
}


class Solution279x2 {
    func numSquares(_ n: Int) -> Int {
        var dp: [Int] = [Int](repeating: Int.max, count: n+1)
        dp[0] = 0
        for i in 0...n {
            var j = 1
            while i + j * j <= n {
                dp[i + j * j] = min(dp[i] + 1, dp[i + j * j])
                j += 1
            }
        }
        
        return dp[n]
    }
}
