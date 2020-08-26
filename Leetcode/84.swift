/***
 84. Largest Rectangle in Histogram
 Hard

 Given n non-negative integers representing the histogram's bar height where the width of each bar is 1, find the area of largest rectangle in the histogram.
 
 
 
 
 Above is a histogram where width of each bar is 1, given height = [2,1,5,6,2,3].
 
 
 
 
 The largest rectangle is shown in the shaded area, which has area = 10 unit.
 
 
 
 Example:
 
 Input: [2,1,5,6,2,3]
 Output: 10
 ***/



class Solution84x1 {
    func largestRectangleArea(_ heights: [Int]) -> Int {
        
        if heights.count == 0 {
            return 0
        }
        
        if heights.count == 1 {
            return heights[0]
        }
        var leftIndexes = Array<Int>.init(repeating: 0, count: heights.count)
        var rightIndexes = Array<Int>.init(repeating: 0, count: heights.count)
        leftIndexes[0] = -1
        rightIndexes[heights.count - 1] = heights.count
        
        for i in 1..<heights.count {
            var p = i - 1
            while p >= 0, heights[p] >= heights[i] {
                p = leftIndexes[p]
            }
            leftIndexes[i] = p
        }
        
        for i in (0...heights.count - 2).reversed() {
            var p = i + 1
            while p < heights.count, heights[p] >= heights[i] {
                p = rightIndexes[p]
            }
            rightIndexes[i] = p
        }
        var maxArea = 0
        for i in 0..<heights.count {
            maxArea = max(maxArea, heights[i] * (rightIndexes[i] - leftIndexes[i] - 1))
        }
        
        return maxArea
    }
}


class Solution84x2 {
    func largestRectangleArea(_ heights: [Int]) -> Int {
        
        let heights = heights + [0]
        
        var indexStack: [Int] = []
        var maxHeight = 0
        
        for (i,height) in heights.enumerated() {
            
            while let previousIndex = indexStack.last, heights[previousIndex] > height {
                indexStack.removeLast()
                
                let lastIndex = indexStack.last ?? -1
                let width = (i-1) - lastIndex
                let height = heights[previousIndex]
                
                maxHeight = max(maxHeight, width * height)
            }
            
            indexStack.append(i)
        }
        
        return maxHeight
    }
}


class Solution84x3 {
    func largestRectangleArea(_ heights: [Int]) -> Int {
        
        var stack = [Int]()
        var bestSolution = 0
        var currentHeight = 0
        
        for i in 0..<heights.count {
            
            currentHeight = heights[i]
            if currentHeight > bestSolution {
                //bestSolution = currentHeight
            }
            
            while stack.last != nil && currentHeight <= heights[stack.last!]  {
                
                var lastIndex = stack.last!
                var lastHeight = heights[lastIndex]
                stack.removeLast()
                
                var index = stack.isEmpty ? i : (i - 1 - stack.last!)
                var rectHeight = lastHeight * (index)
                
                if rectHeight > bestSolution {
                    bestSolution = rectHeight
                }
            }
            
            stack.append(i)
        }
        
        while stack.last != nil {
            
            var lastIndex = stack.last!
            var lastHeight = heights[lastIndex]
            stack.removeLast()
            
            var index = stack.isEmpty ? (heights.count) : ((heights.count) - 1 - stack.last!)
            var rectHeight = lastHeight * (index)
            
            if rectHeight > bestSolution {
                bestSolution = rectHeight
            }
        }
        
        return bestSolution
    }
}


class Solution84x4 {
    func largestRectangleArea(_ heights: [Int]) -> Int {
        
        if heights.count == 0 {
            return 0
        }
        
        var myHeights: [Int] = heights
        myHeights.append(0)
        
        var s = 0
        var stack: [Int] = []
        var i = 0
        
        while i < myHeights.count {
            
            if stack.count == 0 || myHeights[stack.last!] < myHeights[i] {
                
                stack.append(i)
                i += 1
            } else {
                
                let j = stack.last!
                stack.removeLast()
                
                s = max(s, myHeights[j]*(stack.isEmpty ? i : i - 1 - stack.last!))
                
            }
        }
        
        return s
    }
}



class Solution84x5 {
    func largestRectangleArea(_ heights: [Int]) -> Int {
        var stack = [Int]()
        var res = 0
        for i in 0...heights.count {
            let curr = i == heights.count ? 0 : heights[i]
            while !stack.isEmpty && heights[stack[0]] > curr {
                let height = heights[stack.removeFirst()]
                let width = stack.isEmpty ? i : i - 1 - stack[0]
                res = max(res, height * width)
            }
            stack.insert(i, at: 0)
        }
        return res
    }
}
