/***
 62. Unique Paths
 Medium

 A robot is located at the top-left corner of a m x n grid (marked 'Start' in the diagram below).
 
 The robot can only move either down or right at any point in time. The robot is trying to reach the bottom-right corner of the grid (marked 'Finish' in the diagram below).
 
 How many possible unique paths are there?
 
 
 Above is a 7 x 3 grid. How many possible unique paths are there?
 
 
 
 Example 1:
 
 Input: m = 3, n = 2
 Output: 3
 Explanation:
 From the top-left corner, there are a total of 3 ways to reach the bottom-right corner:
 1. Right -> Right -> Down
 2. Right -> Down -> Right
 3. Down -> Right -> Right
 Example 2:
 
 Input: m = 7, n = 3
 Output: 28
 ***/



class Solution62x1 {
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        if m == 0 || n == 0 {
            return 0
        }
        var columns: [Int] = Array(repeating: 1, count: m)
        for _ in 1..<n { // 逐行遍历
            for i in 1..<m { // 第一位, 始终只有1种(+0)
                columns[i] += columns[i-1]
            }
        }
        return columns.last!
    }
}


class Solution62x2 {
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        var pathNums = Array(repeating: Array(repeating:0,count: n),count: m)
        return _helper(&pathNums, m - 1, n - 1)
    }
    private func _helper(_ pathNums: inout [[Int]], _ m: Int, _ n: Int) -> Int {
        if m < 0 || n < 0 {
            return 0
        }
        if m == 0 || n == 0 {
            return 1
        }
        
        if pathNums[m][n] != 0 {
            return pathNums[m][n]
        }
        pathNums[m][n] = _helper(&pathNums, m - 1, n) + _helper(&pathNums, m, n - 1)
        
        return pathNums[m][n]
    }
}


class Solution62x3 {
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        if m == 0 || n == 0 { return 0 }
        var count = Array(repeating: Array(repeating: 0, count: n), count: m)
        var col = n-1
        while col >= 0 {
            var row = m-1
            while row >= 0 {
                if row == m-1 && col == n-1 {
                    count[row][col] = 1
                } else {
                    count[row][col] = (col < n-1 ? count[row][col+1] : 0) + (row < m-1 ? count[row+1][col] : 0)
                }
                row -= 1
            }
            col -= 1
        }
        return count[0][0]
    }
}


class Solution62x4 {
    
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        guard m > 0 else {
            return 0
        }
        
        var steps = Array(repeating: Array(repeating: 1, count: n), count: m)
        for row in 1..<m {
            for column in 1..<n {
                steps[row][column] = steps[row - 1][column] + steps[row][column - 1]
            }
        }
        
        return steps[m - 1][n - 1]
    }
    
}


class Solution62x5 {
    
    func uniquePaths(_ m: Int, _ n: Int) -> Int {
        var arrs: [[Int]] = Array(repeating: Array(repeating: 0, count: n), count: m)
        for i in 0..<m{
            for j in 0..<n{
                if i == 0 && j == 0{
                    arrs[i][j] = 1
                }else if i == 0 {
                    arrs[i][j] = arrs[i][j-1]
                }else if j == 0{
                    arrs[i][j] = arrs[i-1][j]
                }else{
                    arrs[i][j] = arrs[i-1][j] + arrs[i][j-1]
                }
            }
        }
        return arrs[m-1][n-1]
    }
}
