/***
 120. Triangle
 Medium
 
 1807
 
 219
 
 Add to List
 
 Share
 Given a triangle, find the minimum path sum from top to bottom. Each step you may move to adjacent numbers on the row below.
 
 For example, given the following triangle
 
 [
 [2],
 [3,4],
 [6,5,7],
 [4,1,8,3]
 ]
 The minimum path sum from top to bottom is 11 (i.e., 2 + 3 + 5 + 1 = 11).
 
 Note:
 
 Bonus point if you are able to do this using only O(n) extra space, where n is the total number of rows in the triangle.
 ***/



class Solution120x1 {
    func minimumTotal(_ triangle: [[Int]]) -> Int {
        guard triangle.count > 0 && triangle[0].count > 0 else {
            return 0
        }
        let m = triangle.count, n = triangle[0].count
        var dp = triangle[m - 1]
        
        var j = m - 2
        while j >= 0 {
            let arr = triangle[j]
            for i in 0..<arr.count {
                dp[i] = min(dp[i], dp[i + 1]) + arr[i]
            }
            
            j -= 1
        }
        
        return dp[0]
    }
}


class Solution120x2 {
    func minimumTotal(_ triangle: [[Int]]) -> Int {
        if triangle.count == 1 {
            return triangle[0][0]
        }
        var lastLine = triangle.last!
        var sums = Array(repeating: 0, count:triangle.count-1)
        for i in stride(from: triangle.count-2, through:0, by:-1) {
            for j in 0..<triangle[i].count {
                sums[j] = min(lastLine[j], lastLine[j+1]) + triangle[i][j]
            }
            lastLine = sums
        }
        return sums[0]
    }
}


class Solution120x3 {
    func minimumTotal(_ triangle: [[Int]]) -> Int {
        guard triangle.count > 0 else {
            return 0
        }
        
        var dp = triangle.last!
        
        for i in stride(from: triangle.count - 2, through: 0, by: -1) {
            for j in 0...i {
                dp[j] = min(dp[j], dp[j + 1]) + triangle[i][j]
            }
        }
        
        return dp[0]
    }
}


