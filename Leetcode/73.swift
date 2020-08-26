/***
 73. Set Matrix Zeroes
 Medium

 Given a m x n matrix, if an element is 0, set its entire row and column to 0. Do it in-place.
 
 Example 1:
 
 Input:
 [
 [1,1,1],
 [1,0,1],
 [1,1,1]
 ]
 Output:
 [
 [1,0,1],
 [0,0,0],
 [1,0,1]
 ]
 Example 2:
 
 Input:
 [
 [0,1,2,0],
 [3,4,5,2],
 [1,3,1,5]
 ]
 Output:
 [
 [0,0,0,0],
 [0,4,5,0],
 [0,3,1,0]
 ]
 Follow up:
 
 A straight forward solution using O(mn) space is probably a bad idea.
 A simple improvement uses O(m + n) space, but still not the best solution.
 Could you devise a constant space solution?
 ***/



class Solution73x1 {
    func setZeroes(_ matrix: inout [[Int]]) {
        var rows = [Int]()
        var cols = [Int]()
        
        for i in 0 ..< matrix.count {
            for j in 0 ..< matrix[i].count {
                if matrix[i][j] == 0 {
                    rows.append(i)
                    cols.append(j)
                }
            }
        }
        // Set rows to 0
        for col in cols {
            for i in 0 ..< matrix.count {
                matrix[i][col] = 0
            }
        }
        // Set cols to 0
        for row in rows {
            for j in 0 ..< matrix[row].count {
                matrix[row][j] = 0
            }
        }
    }
}


class Solution73x2 {
    func setZeroes(_ matrix: inout [[Int]]) {
        for i in 0..<matrix.count {
            for j in 0..<matrix[i].count {
                if matrix[i][j] == 0 {
                    matrix[i][j] = -9999
                }
            }
        }
        
        for i in 0..<matrix.count {
            for j in 0..<matrix[i].count {
                if matrix[i][j] == -9999 {
                    for c in 0..<matrix[i].count {
                        if (matrix[i][c] != -9999) {
                            matrix[i][c] = 0
                        }
                    }
                    for r in 0..<matrix.count {
                        if (matrix[r][j] != -9999) {
                            matrix[r][j] = 0
                        }
                    }
                    matrix[i][j] = 0
                }
            }
        }
    }
}


class Solution73x3 {
    func setZeroes(_ matrix: inout [[Int]]) {
        var rows = [Int]()
        var cols = [Int]()
        for i in 0..<matrix.count {
            for j in 0..<matrix[i].count {
                if matrix[i][j] == 0 {
                    rows.append(i)
                    cols.append(j)
                }
            }
        }
        for row in rows {
            matrix[row] = Array(repeating: 0, count: matrix[row].count)
        }
        for col in cols {
            for i in 0..<matrix.count {
                matrix[i][col] = 0
            }
        }
    }
}


class Solution73x4 {
    func setZeroes(_ matrix: inout [[Int]]) {
        if matrix.count == 0 {
            return
        }
        
        //查找第一行是否有0
        var row0HasZore = false
        for value in matrix[0] {
            if value == 0 {
                row0HasZore = true
                break
            }
        }
        
        if matrix.count > 1 {
            //查找每一行
            for i in 1..<matrix.count {
                var rowiHasZore = false
                //查找该行是否有0，并置第一行该列数为0
                for j in 0..<matrix[0].count {
                    if matrix[i][j] == 0 {
                        rowiHasZore = true
                        matrix[0][j] = 0
                    }
                }
                //如果该行有0，就置该行所有数为0
                if rowiHasZore {
                    matrix[i].replaceSubrange(0..<matrix[0].count, with: [Int](repeating: 0, count: matrix[0].count))
                }
            }
            //查找第一行是否有0，有则把整列赋值0
            for j in 0..<matrix[0].count {
                if matrix[0][j] == 0 {
                    for i in 0..<matrix.count {
                        matrix[i][j] = 0
                    }
                }
            }
        }
        //如果第一行有0，则把该行赋值为0
        if row0HasZore {
            matrix[0].replaceSubrange(0..<matrix[0].count, with: [Int](repeating: 0, count: matrix[0].count))
        }
    }
}
