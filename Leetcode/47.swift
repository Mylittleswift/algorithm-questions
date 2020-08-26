/***
 47. Permutations II
 Medium

 Given a collection of numbers that might contain duplicates, return all possible unique permutations.
 
 Example:
 
 Input: [1,1,2]
 Output:
 [
 [1,1,2],
 [1,2,1],
 [2,1,1]
 ]
 ***/


class Solution47x1 {
    func permuteUnique(_ nums: [Int]) -> [[Int]] {
        var ans = [[Int]]()
        var nums = nums
        permuteUnique(&nums, 0, &ans)
        return ans
    }
    
    func permuteUnique(_ nums: inout [Int], _ startIndex: Int, _ ans: inout [[Int]]) {
        if startIndex >= nums.count {
            ans.append(nums)
        }
        
        var visited = Set<Int>()
        for index in startIndex..<nums.count {
            if visited.insert(nums[index]).inserted {
                nums.swapAt(startIndex, index)
                permuteUnique(&nums, startIndex + 1, &ans)
                nums.swapAt(startIndex, index)
            }
        }
    }
}


class Solution47x2 {
    func permuteUnique(_ nums: [Int]) -> [[Int]] {
        let sortedNums = nums.sorted()
        
        var temp = [Int]()
        var result = [[Int]]()
        var isvisited = Array(repeating: false, count: nums.count)
        
        backTracking(sortedNums, &result, &temp, &isvisited)
        return result
    }
    
    func backTracking(_ nums: [Int], _ result: inout [[Int]], _ temp: inout [Int], _ isvisited: inout [Bool]) {
        if temp.count == nums.count {
            result.append(temp)
            return
        }
        
        for i in 0 ..< nums.count where !isvisited[i] {
            if i > 0 && nums[i] == nums[i - 1] && !isvisited[i - 1]{
                continue
            }
            temp.append(nums[i])
            isvisited[i] = true
            backTracking(nums, &result, &temp, &isvisited)
            isvisited[i] = false
            temp.removeLast()
        }
        
        
    }
}


class Solution47x3 {
    private func backtrack(_ nums: [Int], _ begin: Int,  results: inout [[Int]]) {
        if begin == nums.count - 1 {
            results.append(nums)
            return
        }
        
        var nums = nums
        
        for i in begin..<nums.count {
            if i == begin || nums[i] != nums[begin]  {
                nums.swapAt(begin, i)
                backtrack(nums, begin + 1, results: &results)
            }
        }
    }
    
    func permuteUnique(_ nums: [Int]) -> [[Int]] {
        var results = [[Int]]()
        let nums = nums.sorted()
        backtrack(nums, 0, results: &results)
        return results
    }
}


class Solution47x4 {
    func permuteUnique(_ nums: [Int]) -> [[Int]] {
        var res = [[Int]]()
        let index = 0
        var nums = nums
        helper(&res, index, &nums)
        return res
    }
    
    
    private func helper(_ res: inout [[Int]], _ index: Int, _ nums: inout [Int]) {
        if index == nums.count {
            res.append(nums)
            return
        }
        
        var usedSet = Set<Int>()
        for i in index..<nums.count {
            if usedSet.contains(nums[i]) {
                continue
            }
            
            usedSet.insert(nums[i])
            nums.swapAt(index, i)
            helper(&res, index + 1, &nums)
            nums.swapAt(index, i)
        }
    }
}
