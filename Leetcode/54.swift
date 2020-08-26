/***
 54. Spiral Matrix
 Medium

 Given a matrix of m x n elements (m rows, n columns), return all elements of the matrix in spiral order.
 
 Example 1:
 
 Input:
 [
 [ 1, 2, 3 ],
 [ 4, 5, 6 ],
 [ 7, 8, 9 ]
 ]
 Output: [1,2,3,6,9,8,7,4,5]
 Example 2:
 
 Input:
 [
 [1, 2, 3, 4],
 [5, 6, 7, 8],
 [9,10,11,12]
 ]
 Output: [1,2,3,4,8,12,11,10,9,5,6,7]
 ***/


class Solution54x1 {
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        var res = [Int]()
        if (matrix.count == 0) {
            return res
        }
        var startX = 0
        var endX = matrix.count - 1
        var startY = 0
        var endY = matrix[0].count - 1
        
        while(true) {
            for i in startY...endY {
                res.append(matrix[startX][i])
            }
            startX += 1
            if (startX > endX) {
                break
            }
            
            for i in startX...endX {
                res.append(matrix[i][endY])
            }
            endY -= 1
            if (endY < startY) {
                break
            }
            
            
            for i in stride(from: endY, through:startY, by:-1) {
                res.append(matrix[endX][i])
            }
            endX -= 1
            if (endX < startX) {
                break
            }
            for i in stride(from:endX, through:startX, by:-1) {
                res.append(matrix[i][startY])
            }
            startY += 1
            if (startY > endY) {
                break
            }
        }
        return res
    }
}


class Solution54x2 {
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        guard !matrix.isEmpty else {
            return []
        }
        
        var column = 0
        var row = 0
        
        let loopCount = (min(matrix.count, matrix[0].count) + 1) / 2
        
        var numbers: [Int] = []
        
        for loopIndex in 0..<loopCount {
            
            let lastColumn = matrix[0].count - loopIndex - 1
            let lastRow = matrix.count - loopIndex - 1
            
            if loopIndex == lastRow {
                for index in loopIndex...lastColumn {
                    numbers.append(matrix[loopIndex][index])
                }
            } else if loopIndex == lastColumn {
                for index in loopIndex...lastRow {
                    numbers.append(matrix[index][loopIndex])
                }
            } else {
                for index in loopIndex..<lastColumn {
                    numbers.append(matrix[loopIndex][index])
                }
                
                for index in loopIndex..<lastRow {
                    numbers.append(matrix[index][lastColumn])
                }
                
                var index = lastColumn
                while index > loopIndex {
                    numbers.append(matrix[lastRow][index])
                    index -= 1
                }
                
                index = lastRow
                while index > loopIndex {
                    numbers.append(matrix[index][loopIndex])
                    index -= 1
                }
            }
        }
        
        return numbers
    }
}


class Solution54x3 {
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        if(matrix == nil || matrix.count == 0) {
            return [];
        }
        var rows = matrix.count;
        var cols = matrix[0].count;
        var col = 0
        var row = 0
        print(cols)
        var outputArray = [Int]()
        while(row < rows && col < cols) {
            for i in col...cols-1{
                print("inside1")
                print(row,i)
                outputArray.append(matrix[row][i])
            }
            row += 1
            if(row <= rows-1) {
                for i in row...rows-1{
                    print("inside2")
                    print(i,cols-1)
                    outputArray.append(matrix[i][cols-1])
                }
            }
            cols -= 1
            //print left
            if(row <= rows-1 && col <= cols-1) {
                for i in (col...cols-1).reversed() {
                    print("inside3")
                    print(rows-1,i)
                    outputArray.append(matrix[(rows-1)][i])
                }
                rows -= 1
            }
            //print up
            if(col <= cols-1 && row <= rows-1) {
                for i in (row...rows-1).reversed() {
                    print("inside4")
                    print(i,col)
                    outputArray.append(matrix[i][col])
                }
                col += 1
            }
        }
        return outputArray
    }
}


class Solution54x4 {
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        
        if matrix.count < 1 {
            return []
        }
        
        let m = matrix.count
        let n = matrix[0].count
        
        var result: [Int] = []
        
        var a: Int = 0
        var b: Int = 0
        
        var direct: Int = 0 // 0表示向右,1表示向下,2表示向左,3表示向右
        
        // 定义边界
        var top: Int = -1
        var left: Int = -1
        var right: Int = n
        var bottom: Int = m
        
        for index in 1...m*n {
            
            if index == 1 {
                result.append(matrix[b][a])
                continue
            }
            if direct == 0{
                if a+1 >= right && b+1 < bottom {
                    b += 1
                    top += 1
                    direct = 1
                }else if a+1 >= right && b+1 >= bottom{
                    break
                }else{
                    a += 1
                }
                result.append(matrix[b][a])
                continue
                
            }else if direct == 1{
                if b+1 >= bottom && a-1 > left{
                    // 下边即将越界,转移方向向左便利
                    a -= 1
                    right -= 1 // 一行遍历完了
                    direct = 2
                }else if b+1 >= bottom && a-1 <= left{
                    break
                }else{
                    b += 1
                }
                result.append(matrix[b][a])
                continue
            }else if direct == 2{
                if a-1 <= left && b-1 > top{
                    // 右边即将越界,转移方向向下便利
                    b -= 1
                    bottom -= 1 // 一行遍历完了
                    direct = 3
                }else if a-1 <= left && b-1 <= top{
                    break
                }else{
                    a -= 1
                }
                result.append(matrix[b][a])
                continue
            }else if direct == 3{
                if b-1 <= top && a+1 < right{
                    // 右边即将越界,转移方向向下便利
                    a += 1
                    left += 1 // 一行遍历完了
                    direct = 0
                }else if b-1 <= top && a+1 >= right{
                    break
                }else{
                    b -= 1
                }
                result.append(matrix[b][a])
                continue
            }
        }
        
        return result
    }
}


class Solution54x5 {
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        
        
        var result: [Int] = []
        if let firstCol = matrix.first {
            var x = 0
            var y = 0
            var row = matrix.count - 1
            var col = firstCol.count - 1
            while x <= row && y <= col {
                
                if x <= col {
                    for i in x ... col {
                        result.append(matrix[y][i])
                    }
                }
                
                if y + 1 <= row {
                    for j in y + 1 ... row {
                        result.append(matrix[j][col])
                    }
                }
                
                if x <= col - 1 && y != row {
                    for i in (x ... col - 1).reversed() {
                        result.append(matrix[row][i])
                    }
                }
                
                if y < row - 1 && x != col {
                    for j in (y + 1 ... row - 1).reversed() {
                        result.append(matrix[j][x])
                    }
                }
                
                x += 1
                y += 1
                row -= 1
                col -= 1
                
            }
        }
        
        return result
    }
}
