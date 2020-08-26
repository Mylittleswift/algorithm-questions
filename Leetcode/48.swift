/***
 48. Rotate Image
 Medium

 You are given an n x n 2D matrix representing an image.
 
 Rotate the image by 90 degrees (clockwise).
 
 Note:
 
 You have to rotate the image in-place, which means you have to modify the input 2D matrix directly. DO NOT allocate another 2D matrix and do the rotation.
 
 Example 1:
 
 Given input matrix =
 [
 [1,2,3],
 [4,5,6],
 [7,8,9]
 ],
 
 rotate the input matrix in-place such that it becomes:
 [
 [7,4,1],
 [8,5,2],
 [9,6,3]
 ]
 Example 2:
 
 Given input matrix =
 [
 [ 5, 1, 9,11],
 [ 2, 4, 8,10],
 [13, 3, 6, 7],
 [15,14,12,16]
 ],
 
 rotate the input matrix in-place such that it becomes:
 [
 [15,13, 2, 5],
 [14, 3, 4, 1],
 [12, 6, 8, 9],
 [16, 7,10,11]
 ]
 ***/


class Solution48x1 {
    func rotate(_ matrix: inout [[Int]])
    {
        let temp = matrix;
        
        for i in 0..<matrix.count
        {
            for j in 0..<matrix[0].count
            {
                matrix[j][matrix[0].count - 1 - i] = temp[i][j];
            }
        }
    }
}


class Solution48x2 {
    func rotate(_ matrix: inout [[Int]]) {
        matrix.reverse()
        
        for i in 1..<matrix.count {
            for j in 0..<i {
                (matrix[i][j], matrix[j][i]) = (matrix[j][i], matrix[i][j])
            }
        }
    }
}


class Solution48x3 {
    func rotate(_ matrix: inout [[Int]]) {
        let layers:Int = matrix.count / 2 - 1
        let n = matrix.count - 1
        var currentLayerWidth = n - 1    //layer的宽度,每一层转 currentLayerWidth次
        if layers < 0 {
            return
        }
        for i in 0...layers {
            if currentLayerWidth < 0 {
                break
            }
            for j in 0...currentLayerWidth {  //每层旋转逻辑
                let x = i + j          //i 层级,x 移动点（相对整个矩阵）
                let firstPoint = matrix[i][x]
                matrix[i][x] = matrix[n - x][i]
                matrix[n - x][i] = matrix[n - i][n - x]
                matrix[n - i][n - x] = matrix[x][n - i]
                matrix[x][n - i] = firstPoint
            }
            //向内层靠近
            currentLayerWidth = currentLayerWidth - 2
        }
    }
}


class Solution48x4 {
    func rotate(_ matrix: inout [[Int]]) {
        let n = matrix.count
        
        for layer in 0..<n/2 {
            let start = layer
            let end = n - layer - 1
            
            for i in start..<end {
                let offset = i - start
                (matrix[start][i], matrix[i][end], matrix[end][end-offset], matrix[end-offset][start]) = ( matrix[end-offset][start], matrix[start][i], matrix[i][end], matrix[end][end-offset])
            }
        }
    }
}


class Solution48x5 {
    func rotate(_ matrix: inout [[Int]]) {
        let count = matrix[0].count
        for i in (0 ..< count)  {
            for t in (i ..< count) {
                let d = matrix[t][i]
                matrix[t][i] = matrix[i][t]
                matrix[i][t] = d
            }
        }
        
        for i in (0 ..< count) {
            for t in (0 ..< (count + 1)/2 ) {
                let temp = matrix[i][t]
                matrix[i][t] = matrix[i][count - t - 1]
                matrix[i][count - t - 1] = temp
            }
        }
    }
}


class Solution48x6 {
    func rotate(_ matrix: inout [[Int]]) {
        let count = matrix.count
        for i in 0..<count {
            for j in i+1..<count {
                if i == j { return }
                // swap
                matrix[i][j] = matrix[i][j] ^ matrix[j][i]
                matrix[j][i] = matrix[i][j] ^ matrix[j][i]
                matrix[i][j] = matrix[i][j] ^ matrix[j][i]
            }
            matrix[i].reverse()
        }
    }
}


class Solution48x7 {
    func rotate(_ matrix: inout [[Int]]) {
        
        for item in 0...matrix.count-1 {
            for i in item...matrix.count-1 {
                let tmpItem = matrix[item][i]
                matrix[item][i] = matrix[i][item]
                matrix[i][item] = tmpItem
            }
        }
        for item in 0...matrix.count-1 {
            matrix[item].reverse()
        }
        
    }
}
