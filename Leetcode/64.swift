/***
 64. Minimum Path Sum
 Medium

 Given a m x n grid filled with non-negative numbers, find a path from top left to bottom right which minimizes the sum of all numbers along its path.
 
 Note: You can only move either down or right at any point in time.
 
 Example:
 
 Input:
 [
 [1,3,1],
 [1,5,1],
 [4,2,1]
 ]
 Output: 7
 Explanation: Because the path 1→3→1→1→1 minimizes the sum.
 ***/



class Solution64x1 {
    func minPathSum(_ grid: [[Int]]) -> Int {
        guard grid.count > 0 else {
            return 0
        }
        let m = grid.count
        let n = grid[0].count
        var dp = Array(repeating:0, count: n)
        dp[0] = grid[0][0]
        for i in 1..<n {
            dp[i] = dp[i - 1] + grid[0][i]
        }
        for i in 1..<m {
            for j in 0..<n {
                if j == 0 {
                    dp[j] += grid[i][0]
                } else {
                    dp[j] = min(dp[j], dp[j - 1]) + grid[i][j]
                }
            }
        }
        return dp[n - 1]
    }
}


class Solution64x2 {
    func minPathSum(_ grid: [[Int]]) -> Int {
        guard grid.count>0 else { return 0}
        var rows = grid.count
        var cols = grid[0].count
        var dp = Array(repeating:Array(repeating:0,count:cols),count:rows)
        
        
        dp[0][0] = grid[0][0]
        var row = 0, col = 0
        for row in 1..<rows {
            dp[row][0] = dp[row-1][0] + grid[row][0]
        }
        
        for col in 1..<cols {
            dp[0][col] = dp[0][col-1] + grid[0][col]
        }
        
        for row in 1..<rows {
            for col in 1..<cols {
                dp[row][col] = min(dp[row-1][col],dp[row][col-1]) + grid[row][col]
            }
        }
        
        
        return dp[rows-1][cols-1]
        
    }
}


class Solution64x3 {
    func minPathSum(_ grid: [[Int]]) -> Int {
        guard grid.count > 0 else {
            return 0
        }
        var row = [Int].init(repeating: 0, count: grid[0].count+1)
        for i in 1..<row.count {
            row[i] = row[i-1] + grid[0][i-1]
        }
        
        for i in 1..<grid.count {
            row[1] = row[1] + grid[i][0]
            for j in 1..<grid[0].count {
                row[j+1] = row[j] > row[j+1] ? row[j+1] + grid[i][j] : row[j] + grid[i][j]
            }
        }
        let resultIndex = grid[0].count
        return row[resultIndex]
    }
}


class Solution64x4 {
    func minPathSum(_ grid: [[Int]]) -> Int {
        var grid = grid
        let m = grid.count
        let n = grid.first!.count
        func top(_ row: Int, _ column: Int) -> Int {
            return row-1 >= 0 ? grid[row-1][column] : 100500
        }
        func left(_ row: Int, _ column: Int) -> Int {
            return column-1 >= 0 ? grid[row][column-1] : 100500
        }
        for row in 0..<m {
            for column in 0..<n {
                if row == 0 && column == 0 { continue }
                grid[row][column] += min(top(row, column), left(row, column))
            }
        }
        return grid.last!.last!
    }
}
