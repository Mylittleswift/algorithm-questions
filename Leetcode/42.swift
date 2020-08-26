/***
 42. Trapping Rain Water
 Hard

 Given n non-negative integers representing an elevation map where the width of each bar is 1, compute how much water it is able to trap after raining.
 
 
 The above elevation map is represented by array [0,1,0,2,1,0,1,3,2,1,2,1]. In this case, 6 units of rain water (blue section) are being trapped. Thanks Marcos for contributing this image!
 
 Example:
 
 Input: [0,1,0,2,1,0,1,3,2,1,2,1]
 Output: 6
 ***/

// LC PASS
class Solution42x0 {
    func trap(_ height: [Int]) -> Int {
        var leftMax = 0
        var rightMax = 0
        var i = 0
        var j = height.count - 1
        var res = 0
        
        while i < j {
            leftMax = max(leftMax, height[i])
            rightMax = max(rightMax, height[j])
            if leftMax < rightMax {
                res += leftMax - height[i]
                i += 1
            } else {
                res += rightMax - height[j]
                j -= 1
            }
        }
        return res
    }
}

class Solution42x1 {
    func trap(_ height: [Int]) -> Int {
        var leftMax = 0
        var rightMax = 0
        var leftPointer = 0
        var rightPointer = height.count - 1
        var trappedWater = 0
        
        while leftPointer < rightPointer {
            if height[leftPointer] < height[rightPointer] {
                if height[leftPointer] > leftMax {
                    leftMax = height[leftPointer]
                } else {
                    trappedWater += leftMax - height[leftPointer]
                }
                leftPointer += 1
            } else {
                if height[rightPointer] > rightMax {
                    rightMax = height[rightPointer]
                } else {
                    trappedWater += rightMax - height[rightPointer]
                }
                rightPointer -= 1
            }
        }
        return trappedWater
    }
}


class Solution42x2 {
    func trap(_ height: [Int]) -> Int {
        var leftMax = [Int]()
        var rightMax = [Int]()
        var maxL = 0
        var maxR = 0
        for i in 0..<height.count {
            if maxL < height[i] {
                maxL = height[i]
            }
            leftMax.append(maxL)
            if maxR < height[height.count - 1 - i] {
                maxR = height[height.count - 1 - i]
            }
            rightMax.append(maxR)
        }
        rightMax.reverse()
        var result = 0
        for i in 0..<height.count {
            let wall = max(min(leftMax[i], rightMax[i]), height[i])
            result += wall - height[i]
        }
        return result
    }
}


class Solution42x3 {
    func trap(_ height: [Int]) -> Int {
        if height.count <= 0 {
            return 0
        }
        var maxL = height[0]
        var rights : Array = Array<Int>(repeating: 0, count: height.count)
        var result = 0
        var maxR = 0
        
        for i in height.enumerated().reversed() {
            if height[i.offset] > maxR {
                maxR = i.element
                rights[i.offset] = maxR
            }else {
                rights[i.offset] = maxR
            }
        }
        
        for i in 0..<height.count {
            if height[i] > maxL {
                maxL = height[i]
            }
            result += max(min(maxL, rights[i]) - height[i],0)
        }
        
        
        return result
    }
}


class Solution42x4 {
    func trap(_ height: [Int]) -> Int {
        guard height.count > 2 else { return 0 }
        var res: Int = 0
        var leftMax = Array(repeating: 0, count: height.count)
        var rightMax = Array(repeating: 0, count: height.count)
        
        leftMax[0] = height[0]
        for i in 1..<height.count {
            leftMax[i] = max(leftMax[i - 1], height[i])
        }
        
        rightMax[height.count - 1] = height[height.count - 1]
        for i in (0..<height.count - 1).reversed() {
            rightMax[i] = max(rightMax[i + 1], height[i])
        }
        
        for i in 1..<height.count - 1 {
            res += min(leftMax[i], rightMax[i]) - height[i]
        }
        
        return res
    }
}
