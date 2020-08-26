/***
 59. Spiral Matrix II
 Medium

 Given a positive integer n, generate a square matrix filled with elements from 1 to n2 in spiral order.
 
 Example:
 
 Input: 3
 Output:
 [
 [ 1, 2, 3 ],
 [ 8, 9, 4 ],
 [ 7, 6, 5 ]
 ]
 ***/



class Solution59x1 {
    func generateMatrix(_ n: Int) -> [[Int]] {
        if n == 0 {
            return [[Int]]();
        }
        var i = 0, j = 0;
        var result = [[Int]]()
        let m = n
        var minI = -1, minJ = -1, maxI = m, maxJ = n;
        
        let maxLength = m * n
        
        var tempArray = [Int]()
        for i in 0 ..< maxLength {
            if tempArray.count == n {
                result.append(tempArray)
                tempArray.removeAll()
                tempArray.append(i)
            } else {
                tempArray.append(i)
            }
        }
        result.append(tempArray)
        
        //action: 0: i+, 1: j+, 2: i-, 3: j-
        var action = 1
        var value = 1
        
        
        while value <= maxLength {
            switch action {
            case 0: do {
                while i < maxI {
                    result[i][j] = value
                    value += 1
                    i += 1
                }
                i -= 1
                maxJ -= 1
                
                action = 3
                j -= 1
            }
            break;
            case 1: do {
                while j < maxJ {
                    result[i][j] = value
                    value += 1
                    j += 1
                }
                j -= 1
                minI += 1
                
                action = 0
                i += 1
            }
            break;
            case 2: do {
                while i > minI {
                    result[i][j] = value
                    value += 1
                    i -= 1
                }
                i += 1
                minJ += 1
                
                action = 1
                j += 1
            }
            break;
            case 3: do {
                while j > minJ {
                    result[i][j] = value
                    value += 1
                    j -= 1
                }
                j += 1
                maxI -= 1
                
                action = 2
                i -= 1
            }
            break;
            default:
                break
            }
        }
        return result;
    }
}


class Solution59x2 {
    func generateMatrix(_ n: Int) -> [[Int]] {
        let iterations = n / 2 + n % 2
        var arr = Array(repeating: (Array(repeating: 0, count: n)), count: n)
        var value = 0
        var count = n
        var isIterating = false
        for index in 0..<iterations {
            var j = index
            var i = index
            
            
            
            while (j < count) {
                value += 1
                arr[i][j] = value
                j += 1
                isIterating = true
            }
            j -= 1
            
            i += 1
            while (i < count) {
                value += 1
                arr[i][j] = value
                i += 1
                isIterating = true
            }
            i -= 1
            
            j -= 1
            
            if !isIterating  { break }
            
            while(j >= index) {
                value += 1
                arr[i][j] = value
                j -= 1
            }
            j += 1
            
            i -= 1
            
            while(i > index) {
                value += 1
                arr[i][j] = value
                i -= 1
            }
            
            count -= 1
            
            isIterating = false
        }
        
        return arr
    }
}


class Solution59x3 {
    func generateMatrix(_ n: Int) -> [[Int]] {
        guard n > 0 else {
            return [[Int]]()
        }
        
        var num = 1
        var res = Array(repeating: Array(repeating: 0, count: n), count: n)
        
        for layer in 0..<n / 2 {
            let start = layer
            let end = n - layer - 1
            
            // top
            for i in start..<end {
                res[start][i] = num
                num += 1
            }
            
            // right
            for i in start..<end {
                res[i][end] = num
                num += 1
            }
            
            // bottom
            for i in stride(from: end, to: start, by: -1) {
                res[end][i] = num
                num += 1
            }
            
            // left
            for i in stride(from: end, to: start, by: -1) {
                res[i][start] = num
                num += 1
            }
        }
        
        // handle the center one
        if n % 2 != 0 {
            res[n / 2][n / 2] = n * n
        }
        
        return res
    }
}


class Solution59x4 {
    func generateMatrix(_ n: Int) -> [[Int]] {
        var n = n
        var result = Array<[Int]>(repeating: Array<Int>(repeating: 0, count: n), count: n)
        var i = 1
        let max = n * n
        var x = 0, y = 0
        while i <= max {
            while y < n && result[x][y] == 0 {  //向右
                result[x][y] = i
                i += 1
                y += 1
            }
            x += 1
            y -= 1
            while x < n && result[x][y] == 0 {  //向下
                result[x][y] = i
                i += 1
                x += 1
            }
            x -= 1
            y -= 1
            while y >= 0 && result[x][y] == 0 { //向左
                result[x][y] = i
                i += 1
                y -= 1
            }
            y += 1
            x -= 1
            while x >= 0 && result[x][y] == 0 { //向上
                result[x][y] = i
                i += 1
                x -= 1
            }
            x += 1
            y += 1
            n -= 1
        }
        return result
    }
}
