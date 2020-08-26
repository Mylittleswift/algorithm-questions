/***
 74. Search a 2D Matrix
 Medium

 Write an efficient algorithm that searches for a value in an m x n matrix. This matrix has the following properties:
 
 Integers in each row are sorted from left to right.
 The first integer of each row is greater than the last integer of the previous row.
 Example 1:
 
 Input:
 matrix = [
 [1,   3,  5,  7],
 [10, 11, 16, 20],
 [23, 30, 34, 50]
 ]
 target = 3
 Output: true
 Example 2:
 
 Input:
 matrix = [
 [1,   3,  5,  7],
 [10, 11, 16, 20],
 [23, 30, 34, 50]
 ]
 target = 13
 Output: false
 ***/



class Solution74x1 {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        guard matrix.count > 0 else {
            return false
        }
        
        let rows = matrix.count
        let columns = matrix[0].count
        
        var first = 0
        var last = rows*columns-1
        
        while first <= last {
            let mid = first + (last-first)/2
            
            if matrix[mid/columns][mid%columns] == target {
                return true
            }
            
            if matrix[mid/columns][mid%columns] > target {
                last = mid-1
            }
            else {
                first = mid+1
            }
        }
        
        return false
    }
}


class Solution74x2 {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        if matrix.count == 0 || matrix[0].count == 0 {
            return false
        }
        
        let n = matrix.count
        let m = matrix[0].count
        var left = 0
        var right = m * n - 1
        
        while left < right {
            let middle = left + (right - left - 1) / 2
            if matrix[middle / m][middle % m] < target {
                left = middle + 1
            } else {
                right = middle
            }
        }
        
        return matrix[right / m][right % m] == target
    }
}


class Solution74x3 {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        if matrix.count == 0 || matrix.first!.count <= 0 {
            return false
        }
        // 边界判断
        if target < matrix.first!.first! || target > matrix.last!.last! {
            return false
        }
        // 因为矩阵的每行都有序, 可将矩阵看作"一个数组"进行二分查找
        var low = 0
        var high = matrix.count * matrix.first!.count - 1
        var mid = 0
        while low <= high {
            mid = (low + high) / 2
            let coords = convertIndex(mid, in: matrix) // index转换为坐标
            let value = matrix[coords.row][coords.column]
            if value == target {
                return true
            } else if target < value {
                high = mid - 1
            } else {
                low = mid + 1
            }
        }
        return false
    }
    
    private func convertIndex(_ index: Int, in matix: [[Any]]) -> (row: Int, column: Int) {
        return (row: index / matix.first!.count,
                column: index % matix.first!.count)
    }
}


class Solution74x4 {
    func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
        guard !matrix.isEmpty else { return false }
        
        let lastRowIndex = matrix.count - 1
        
        for (index, row) in matrix.enumerated() {
            guard !row.isEmpty else { continue }
            guard target >= row[0] else { continue }
            
            if lastRowIndex != index && target >= matrix[index + 1][0] {
                continue
            }
            
            for n in row {
                if n == target {
                    return true
                }
            }
            
        }
        
        return false
    }
}
