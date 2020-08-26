/***
 96. Unique Binary Search Trees
 Medium

 Given n, how many structurally unique BST's (binary search trees) that store values 1 ... n?
 
 Example:
 
 Input: 3
 Output: 5
 Explanation:
 Given n = 3, there are a total of 5 unique BST's:
 
 1         3     3      2      1
 \       /     /      / \      \
 3     2     1      1   3      2
 /     /       \                 \
 2     1         2                 3
 ***/



class Solution96x1 {
    func numTrees(_ n: Int) -> Int {
        if n <= 1 {
            return 1
        }
        var dp = [Int](repeatElement(0, count: n + 1))
        
        dp[0] = 1
        dp[1] = 1
        
        for i in 2...n {
            for j in 1...i {
                dp[i] += dp[j - 1] * dp[i - j]
            }
        }
        
        return dp[n]
    }
}


class Solution96x2 {
    func numTrees(_ n: Int) -> Int {
        guard n >= 1 else {
            return 0
        }
        
        var sum = [0, 1, 2, 5]
        
        if n < sum.count {
            return sum[n]
        }
        
        for i in 4...n {
            var val = 0
            for k in 0..<i {
                if sum[k] == 0 || sum[i-1-k] == 0 {
                    val += sum[k] + sum[i-1-k]
                }
                else {
                    val += sum[k] * sum[i-1-k]
                }
            }
            sum.append(val)
        }
        
        return sum.last!
    }
}
