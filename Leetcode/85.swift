/***
 85. Maximal Rectangle
 Hard
 
 2498
 
 63
 
 Add to List
 
 Share
 Given a 2D binary matrix filled with 0's and 1's, find the largest rectangle containing only 1's and return its area.
 
 Example:
 
 Input:
 [
 ["1","0","1","0","0"],
 ["1","0","1","1","1"],
 ["1","1","1","1","1"],
 ["1","0","0","1","0"]
 ]
 Output: 6
 ***/



class Solution85x1 {
    func maximalRectangle(_ matrix: [[Character]]) -> Int {
        if matrix.count == 0 || matrix[0].count == 0{
            return 0
        }
        var ans = 0
        var rowArr = Array(repeating:0,count:matrix[0].count + 1)
        for y in stride(from:0,to:matrix.count,by:1) {
            for x in stride(from:0,to:matrix[0].count,by:1) {
                if matrix[y][x] == "1" {
                    rowArr[x] += 1
                } else {
                    rowArr[x] = 0
                }
            }
            ans = max(ans,getLargetRect(rowArr))
        }
        return ans
    }
    
    func getLargetRect(_ rowArr:[Int]) -> Int {
        var stack = [Int]()
        var maxArea = 0
        for (index,height) in rowArr.enumerated() {
            while let last = stack.last, rowArr[last] > height {
                stack.removeLast()
                var width = 0
                if stack.isEmpty {
                    width = index
                } else {
                    width = index - stack.last! - 1
                }
                maxArea = max(maxArea, width * rowArr[last] )
            }
            
            stack.append(index)
        }
        return maxArea
    }
}


class Solution85x2 {
    func maximalRectangle(_ matrix: [[Character]]) -> Int {
        let n = matrix.count
        guard n > 0 else {
            return 0
        }
        let m = matrix[0].count
        
        var mark = Array(repeatElement(Array(repeatElement(0, count: m)), count: n))
        for i in (0..<n).reversed() {
            var count = 0
            for j in (0..<m).reversed() {
                if matrix[i][j] == "1" {
                    count += 1
                } else {
                    count = 0
                }
                mark[i][j] = count
            }
        }
        
        var result = 0
        for i in 0..<n {
            for j in 0..<m {
                var minColumn = m
                var row = i
                while row < n && mark[row][j] != 0 {
                    minColumn = min(minColumn, mark[row][j])
                    result = max(result, (row - i + 1) * minColumn)
                    row += 1
                }
            }
        }
        return result
    }
}


class Solution85x3 {
    
    func maximalRectangle(_ matrix: [[Character]]) -> Int {
        
        if matrix.count == 0 || matrix[0].count == 0 {
            return 0
        }
        
        var heights = [Int](repeating: 0, count: matrix[0].count)
        var s = 0
        
        for i in 0..<matrix.count {
            
            for j in 0..<matrix[i].count {
                
                if matrix[i][j] == "1" {
                    
                    heights[j] += 1
                    
                } else {
                    heights[j] = 0
                }
            }
            
            s = max(s, largestRectangleArea(heights))
        }
        
        return s
    }
    
    func largestRectangleArea(_ heights: [Int]) -> Int {
        
        if heights.count == 0 {
            return 0
        }
        
        var myHeights: [Int] = heights
        myHeights.append(0)
        
        
        var s = 0
        //swift中没有栈,使用数组代替,永远操作最后一位
        var stack: [Int] = []
        var i = 0
        
        while i < myHeights.count {
            
            if stack.count == 0 || myHeights[stack.last!] < myHeights[i] {
                
                stack.append(i)
                i += 1
            } else {
                
                let j = stack.last!
                stack.removeLast()
                
                //如果栈为空,说明数组第一位即构成矩形的左侧边界,此时索引大小即矩形长度
                //如果不为空,用栈顶索引和当前索引计算矩形长度
                s = max(s, myHeights[j]*(stack.isEmpty ? i : i - 1 - stack.last!))
            }
        }
        return s
    }
    
}


class Solution85x4 {
    func maximalRectangle(_ matrix: [[Character]]) -> Int {
        guard matrix.count > 0 && matrix[0].count > 0 else {
            return 0
        }
        let m = matrix.count
        let n = matrix[0].count
        var left = [Int](repeating: 0, count: n)
        var right = [Int](repeating: n, count: n)
        var height = [Int](repeating: 0, count: n)
        var result = 0
        for i in 0..<m {
            var currentLeft = 0
            var currentRight = n
            for j in 0..<n {
                if (matrix[i][j] == "1") {
                    left[j] = max(left[j], currentLeft)
                    height[j] = height[j] + 1
                } else {
                    left[j] = 0
                    currentLeft = j + 1
                    height[j] = 0
                }
                if (matrix[i][n - j - 1] == "1") {
                    right[n - j - 1] = min(right[n - j - 1], currentRight)
                } else {
                    currentRight = n - j - 1
                    right[n - j - 1] = n
                }
            }
            for j in 0..<n {
                result = max(result, (right[j] - left[j]) * height[j])
            }
        }
        return result
    }
}


class Solution85x5 {
    func maximalRectangle(_ matrix: [[Character]]) -> Int {
        if matrix.count == 0 || matrix[0].count == 0 {
            return 0
        }
        
        let rLen = matrix.count
        let cLen = matrix[0].count
        var h = [Int](repeating: 0, count: cLen + 1)
        var maxValue = 0
        
        for row in 0..<rLen {
            var stack = [Int]()
            for i in 0..<(cLen + 1) {
                if i < cLen {
                    if matrix[row][i] == "1" {
                        h[i] += 1
                    } else {
                        h[i] = 0
                    }
                }
                if stack.isEmpty || h[stack.last!] <= h[i] {
                    stack.append(i)
                } else {
                    while !stack.isEmpty && h[i] < h[stack.last!] {
                        let top = stack.removeLast()
                        let area = h[top] * (stack.isEmpty ? i : (i - stack.last! - 1))
                        if area > maxValue {
                            maxValue = area
                        }
                    }
                    stack.append(i)
                }
            }
        }
        return maxValue
    }
}
