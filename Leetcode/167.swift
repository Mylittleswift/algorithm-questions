/***
 167. Two Sum II - Input array is sorted
 Easy

 Given an array of integers that is already sorted in ascending order, find two numbers such that they add up to a specific target number.
 
 The function twoSum should return indices of the two numbers such that they add up to the target, where index1 must be less than index2.
 
 Note:
 
 Your returned answers (both index1 and index2) are not zero-based.
 You may assume that each input would have exactly one solution and you may not use the same element twice.
 Example:
 
 Input: numbers = [2,7,11,15], target = 9
 Output: [1,2]
 Explanation: The sum of 2 and 7 is 9. Therefore index1 = 1, index2 = 2.
 ***/



class Solution167x1 {
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        var leftIndex:Int = 0
        var rightIndex:Int = numbers.count - 1
        while (leftIndex < rightIndex)
        {
            var sum = numbers[leftIndex] + numbers[rightIndex]
            if sum == target
            {
                return [leftIndex + 1,rightIndex + 1]
            }
            else if sum < target
            {
                leftIndex += 1
            }
            else
            {
                rightIndex -= 1
            }
        }
        return []
    }
}


class Solution167x2 {
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        guard numbers.count >= 2 else {
            return []
        }
        var dic: [Int:Int] = [:]
        for i in 0..<numbers.count {
            let t = target - numbers[i]
            if dic.keys.contains(t) {
                return [dic[t]!+1, i+1]
            }
            dic[numbers[i]] = i
        }
        return []
    }
}


class Solution167x3 {
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        var numIndexDict = [Int : Int]()
        for (index, num) in numbers.enumerated() {
            numIndexDict[num] = index
        }
        
        for (index, num) in numbers.enumerated() {
            if let diffIndex = numIndexDict[target - num] {
                return [index + 1, diffIndex + 1]
            }
        }
        
        return [Int]()
    }
}
