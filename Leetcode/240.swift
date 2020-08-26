/***
 240. Search a 2D Matrix II
 Medium

 Write an efficient algorithm that searches for a value in an m x n matrix. This matrix has the following properties:
 
 Integers in each row are sorted in ascending from left to right.
 Integers in each column are sorted in ascending from top to bottom.
 Example:
 
 Consider the following matrix:
 
 [
 [1,   4,  7, 11, 15],
 [2,   5,  8, 12, 19],
 [3,   6,  9, 16, 22],
 [10, 13, 14, 17, 24],
 [18, 21, 23, 26, 30]
 ]
 Given target = 5, return true.
 
 Given target = 20, return false.
 ***/



class Solution240x1 {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        // start at top right
        if matrix.count < 1 || matrix[0].count < 1 { return false }
        
        let rows = matrix.count, cols = matrix[0].count
        var r = 0, c = cols - 1
        
        while c >= 0, r < rows {
            let num = matrix[r][c]
            if num == target {
                return true
            } else if num < target {
                r += 1
            } else {
                c -= 1
            }
        }
        
        return false
    }
}


class Solution240x2 {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        guard matrix.count > 0, matrix[0].count > 0 else {
            return false
        }
        
        let m = matrix.count
        let n = matrix[0].count
        
        if target < matrix[0][0] || target > matrix[m-1][n-1] {
            return false
        }
        
        var i = m-1, j = 0
        
        while i >= 0, j < n {
            if matrix[i][j] == target {
                return true
            } else if matrix[i][j] > target {
                i -= 1
            } else {
                j += 1
            }
        }
        
        return false
    }
}


class Solution240x3 {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        guard !matrix.isEmpty && !matrix[0].isEmpty else {
            return false
        }
        
        var row = 0
        var column = matrix[0].count - 1
        while column >= 0 && row < matrix.count {
            if matrix[row][column] > target {
                column -= 1
            } else if matrix[row][column] < target {
                row += 1
            } else {
                return true
            }
        }
        
        return false
    }
}
