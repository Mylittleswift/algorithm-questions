/***
 63. Unique Paths II
 Medium

 A robot is located at the top-left corner of a m x n grid (marked 'Start' in the diagram below).
 
 The robot can only move either down or right at any point in time. The robot is trying to reach the bottom-right corner of the grid (marked 'Finish' in the diagram below).
 
 Now consider if some obstacles are added to the grids. How many unique paths would there be?
 
 
 
 An obstacle and empty space is marked as 1 and 0 respectively in the grid.
 
 Note: m and n will be at most 100.
 
 Example 1:
 
 Input:
 [
 [0,0,0],
 [0,1,0],
 [0,0,0]
 ]
 Output: 2
 Explanation:
 There is one obstacle in the middle of the 3x3 grid above.
 There are two ways to reach the bottom-right corner:
 1. Right -> Right -> Down -> Down
 2. Down -> Down -> Right -> Right
 ***/



class Solution63x1 {
    func uniquePathsWithObstacles(_ obstacleGrid: [[Int]]) -> Int {
        let rowCount = obstacleGrid.count
        let colCount = obstacleGrid.first?.count ?? 0
        guard rowCount > 0, colCount > 0 else { return 0 }
        var paths = Array(repeating: Array(repeating: 0, count: colCount), count: rowCount)
        
        if obstacleGrid[0][0] != 1 {
            paths[0][0] = 1
        }
        for i in 1..<rowCount {
            if obstacleGrid[i][0] != 1 {
                paths[i][0] = paths[i-1][0]
            }
        }
        
        for i in 1..<colCount {
            if obstacleGrid[0][i] != 1 {
                paths[0][i] = paths[0][i-1]
            }
        }
        
        for r in 1..<rowCount {
            for c in 1..<colCount {
                if obstacleGrid[r][c] != 1 {
                    paths[r][c] = paths[r-1][c] + paths[r][c-1]
                } else {
                    paths[r][c] = 0
                }
            }
        }
        
        return paths[rowCount-1][colCount-1]
    }
}



class Solution63x2 {
    func uniquePathsWithObstacles(_ obstacleGrid: [[Int]]) -> Int {
        
        let m = obstacleGrid.count
        if m == 0 { return 0 }
        let n = obstacleGrid[0].count
        if n == 0 { return 0 }
        
        var f = [[Int]](repeating: [Int](repeating: 0, count: n), count: m)
        
        for i in 0..<m {
            if obstacleGrid[i][0] == 1 {
                break
            } else {
                f[i][0] = 1
            }
        }
        
        for i in 0..<n {
            if obstacleGrid[0][i] == 1 {
                break
            } else {
                f[0][i] = 1
            }
        }
        
        for i in 1..<m {
            for j in 1..<n {
                
                if obstacleGrid[i][j] == 1 {
                    f[i][j] = 0
                } else {
                    f[i][j] = f[i - 1][j] + f[i][j - 1]
                }
            }
        }
        
        return f[m - 1][n - 1]
    }
}


class Solution63x3 {
    func uniquePathsWithObstacles(_ obstacleGrid: [[Int]]) -> Int {
        guard obstacleGrid.count > 0 && obstacleGrid[0].count > 0 else {
            return 0
        }
        var m = obstacleGrid.count, n = obstacleGrid[0].count
        var dp = [[Int]](repeating: [Int](repeating: 0, count: n), count: m)
        for i in 0..<m {
            if obstacleGrid[i][0] == 1 {
                for k in i..<m {
                    dp[k][0] = 0
                }
                break
            } else {
                dp[i][0] = 1
            }
        }
        for j in 0..<n {
            if obstacleGrid[0][j] == 1 {
                for k in j..<n {
                    dp[0][k] = 0
                }
                break
            } else {
                dp[0][j] = 1
            }
            
        }
        
        for i in 1..<m {
            for j in 1..<n {
                if obstacleGrid[i][j] == 1 {
                    dp[i][j] = 0
                } else {
                    dp[i][j] = dp[i - 1][j] + dp[i][j - 1]
                }
                
            }
        }
        
        return dp[m - 1][n - 1]
    }
}


class Solution63x4 {
    func uniquePathsWithObstacles(_ obstacleGrid: [[Int]]) -> Int {
        var Result = Array(repeating: Array(repeating: 0, count:obstacleGrid[0].count)
            , count: obstacleGrid.count)
        if obstacleGrid.count == 0 || obstacleGrid[0].count == 0 || obstacleGrid[0][0] == 1 {
            return 0
        }
        // 设置边界值，碰到障碍物后都无路径
        for i in 0..<obstacleGrid.count {
            if obstacleGrid[i][0] == 1 {
                break
            }
            Result[i][0] = 1
        }
        // 设置边界值，碰到障碍物后都无路径
        for j in 0..<obstacleGrid[0].count {
            if obstacleGrid[0][j] == 1 {
                break
            }
            Result[0][j] = 1
        }
        
        // 动态规划求出路径（迭代法）
        for i in 1..<obstacleGrid.count {
            for j in 1..<obstacleGrid[0].count {
                if obstacleGrid[i][j] == 0 {
                    Result[i][j] = Result[i-1][j] + Result[i][j-1]
                } else { // 障碍物无路劲
                    Result[i][j] = 0
                }
            }
        }
        return Result[Result.count - 1][Result[0].count - 1]
    }
}


class Solution63x5 {
    func uniquePathsWithObstacles(_ obstacleGrid: [[Int]]) -> Int {
        let R = obstacleGrid.count
        let C = obstacleGrid[0].count
        var obstacleGrid = obstacleGrid
        
        // If the starting cell has an obstacle, then simply return as there would be
        // no paths to the destination.
        if obstacleGrid[0][0] == 1 {
            return 0
        }
        
        // Number of ways of reaching the starting cell = 1.
        obstacleGrid[0][0] = 1
        
        // Filling the values for the first column
        for i in 1..<R {
            obstacleGrid[i][0] = (obstacleGrid[i][0] == 0 && obstacleGrid[i - 1][0] == 1) ? 1 : 0
        }
        
        // Filling the values for the first row
        for i in 1..<C {
            obstacleGrid[0][i] = (obstacleGrid[0][i] == 0 && obstacleGrid[0][i - 1] == 1) ? 1 : 0
        }
        
        // Starting from cell(1,1) fill up the values
        // No. of ways of reaching cell[i][j] = cell[i - 1][j] + cell[i][j - 1]
        // i.e. From above and left.
        for i in 1..<R {
            for j in 1..<C {
                if obstacleGrid[i][j] == 0 {
                    obstacleGrid[i][j] = obstacleGrid[i - 1][j] + obstacleGrid[i][j - 1]
                } else {
                    obstacleGrid[i][j] = 0
                }
            }
        }
        
        // Return value stored in rightmost bottommost cell. That is the destination.
        return obstacleGrid[R - 1][C - 1]
    }
}


