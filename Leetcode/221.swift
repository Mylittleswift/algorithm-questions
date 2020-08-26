/***
 221. Maximal Square
 Medium

 Given a 2D binary matrix filled with 0's and 1's, find the largest square containing only 1's and return its area.
 
 Example:
 
 Input:
 
 1 0 1 0 0
 1 0 1 1 1
 1 1 1 1 1
 1 0 0 1 0
 
 Output: 4
 ***/



class Solution221x1 {
    func maximalSquare(_ matrix: [[Character]]) -> Int {
        
        guard matrix.count > 0, matrix[0].count > 0 else { return 0 }
        var m = matrix.count, n = matrix[0].count
        var dp = Array(repeating: Array(repeating: 0, count: n+1), count: m+1)
        var res = 0
        for i in 1...m {
            for j in 1...n {
                if matrix[i-1][j-1] == "0" { continue }
                dp[i][j] = min(min(dp[i-1][j], dp[i][j-1]), dp[i-1][j-1]) + 1
                res = max(res, dp[i][j])
            }
        }
        return res * res
    }
}


class Solution221x2 {
    func maximalSquare(_ matrix: [[Character]]) -> Int {
        
        guard matrix.count > 0, matrix[0].count > 0 else { return 0 }
        var m = matrix.count, n = matrix[0].count
        var dp =  Array(repeating: 0, count: n+1)
        var res = 0
        var pre = 0
        for i in 0..<m {
            for j in 1...n {
                var t = dp[j]
                if matrix[i][j-1] == "0" { dp[j] = 0 }
                else {
                    dp[j] = min(min(dp[j], dp[j-1]), pre) + 1
                    res = max(res, dp[j])
                }
                pre = t
            }
        }
        return res * res
    }
}


class Solution221x3 {
    func maximalSquare(_ matrix: [[Character]]) -> Int {
        guard !matrix.isEmpty else { return 0 }
        
        var maxLength = 0
        var areaArray = Array(repeating: Array(repeating: 0, count: matrix[0].count), count: matrix.count)
        
        for i in 0..<matrix.count {
            for j in 0..<matrix[0].count {
                if i == 0 || j == 0{
                    areaArray[i][j] = matrix[i][j] == "0" ? 0 : 1
                }else {
                    if matrix[i - 1][j] == "0" && matrix[i][j - 1] == "0" && matrix[i - 1][j - 1] == "0" {
                        areaArray[i][j] = matrix[i][j] == "0" ? 0 : 1
                    }else if matrix[i][j] == "1" {
                        areaArray[i][j] = min(min(areaArray[i - 1][j], areaArray[i][j - 1]), areaArray[i - 1][j - 1]) + 1
                    }
                }
                maxLength = max(maxLength, areaArray[i][j])
            }
        }
        
        return maxLength * maxLength
    }
}
