/***
 41. First Missing Positive
 Hard

 Given an unsorted integer array, find the smallest missing positive integer.
 
 Example 1:
 
 Input: [1,2,0]
 Output: 3
 Example 2:
 
 Input: [3,4,-1,1]
 Output: 2
 Example 3:
 
 Input: [7,8,9,11,12]
 Output: 1
 ***/


class Solution41x1 {
    func firstMissingPositive(_ nums: [Int]) -> Int {
        for i in 1 ..< Int.max {
            if !nums.contains(i) {
                return i
            }
        }
        return Int.max
    }
}

class Solution41x2 {
    func firstMissingPositive(_ nums: [Int]) -> Int {
        guard nums.count > 0 else {
            return 1
        }
        var numsCopy = nums
        for  i in 0..<nums.count {
            while numsCopy[i] > 0 && numsCopy[i] < nums.count && numsCopy[numsCopy[i]-1] != numsCopy[i] {
                numsCopy.swapAt(i, numsCopy[i]-1)
            }
        }
        for i in 0..<nums.count {
            if numsCopy[i] != i + 1 {
                return i + 1
            }
        }
        return nums.count + 1
    }
}


class Solution41x3 {
    func firstMissingPositive(_ nums: [Int]) -> Int {
        var set = Set<Int>()
        nums.forEach { set.insert($0) }
        for i in 0..<nums.count {
            if !set.contains(i + 1) {
                return i + 1
            }
        }
        return nums.count + 1
    }
}


class Solution41x4 {
    func firstMissingPositive(_ nums: [Int]) -> Int {
        if nums.count == 0 {
            return 1
        }
        let maximum = nums.max()!
        if maximum > 0 {
            for i in 1...maximum {
                if !nums.contains(i) {
                    return i
                }
            }
        }
        return maximum + 1
    }
}



