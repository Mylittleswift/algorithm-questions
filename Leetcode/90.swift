/***
 90. Subsets II
 Medium

 Given a collection of integers that might contain duplicates, nums, return all possible subsets (the power set).
 
 Note: The solution set must not contain duplicate subsets.
 
 Example:
 
 Input: [1,2,2]
 Output:
 [
 [2],
 [1],
 [1,2,2],
 [2,2],
 [1,2],
 []
 ]
 ***/
 
 
class Solution90x1 {
    func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
        
        var result = [[Int]]()
        var temp = [Int]()
        
        var sortedNums = nums.sorted()
        
        backTrack(sortedNums, &result, &temp, 0)
        return result
    }
    
    func backTrack(_ nums: [Int], _ result: inout [[Int]], _ temp: inout [Int], _ start: Int) {
        guard start <= nums.count else {return}
        result.append(temp)
        for i in start ..< nums.count {
            if i > start && nums[i] == nums[i - 1] {continue}
            temp.append(nums[i])
            backTrack(nums, &result, &temp, i + 1)
            temp.removeLast()
        }
    }
}


class Solution90x2 {
    func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
        
        let nums = nums.sorted()
        var result: [[Int]] = [[]]
        
        var index = 0
        
        while index < nums.count {
            print(index)
            
            var dupCount = 0
            
            for dupIndex in index..<nums.count {
                if nums[dupIndex] == nums[index] {
                    dupCount += 1
                } else {
                    break
                }
            }
            
            let existSubSets = result
            for existSubset in existSubSets {
                var subset = existSubset
                for _ in 0..<dupCount {
                    subset.append(nums[index])
                    result.append(subset)
                }
            }
            index += dupCount
        }
        return result
    }
}


class Solution90x3 {
    func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
        
        if nums.count == 0 {
            return []
        }
        
        var nums = nums.sorted()
        var result = [[Int]]()
        result.append([])
        var size = 1, last = nums[0]
        for i in 0..<nums.count {
            if last != nums[i] {
                last = nums[i]
                size = result.count
            }
            let newSize = result.count
            for j in newSize - size..<newSize {
                var out = result[j] + [nums[i]]
                result.append(out)
            }
        }
        return result
    }
}



class Solution90x4 {
    func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
        guard !nums.isEmpty else {
            return []
        }
        var sorted = nums
        sorted.sort(by:<)
        var result = [[Int]]()
        for num in sorted {
            for i in 0..<result.count {
                var item = result[i]
                item.append(num)
                if !result.contains(item) {
                    result.append(item)
                }
                
            }
            var newArray = [num]
            if !result.contains(newArray) {
                result.append(newArray)
            }
        }
        result.append([])
        return result
    }
}
