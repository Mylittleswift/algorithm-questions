/***
 78. Subsets
 Medium

 Given a set of distinct integers, nums, return all possible subsets (the power set).
 
 Note: The solution set must not contain duplicate subsets.
 
 Example:
 
 Input: nums = [1,2,3]
 Output:
 [
 [3],
 [1],
 [2],
 [1,2,3],
 [1,3],
 [2,3],
 [1,2],
 []
 ]
 ***/



class Solution78x1 {
    func subsets(_ nums: [Int]) -> [[Int]] {
        var res = [[Int]()]
        subset(&res, nums)
        return res
    }
    
    private func subset(_ res: inout [[Int]], _ nums: [Int]) {
        guard let n = nums.first else { return }
        res += res.map { $0 + [n] }
        subset(&res, Array(nums[1..<nums.count]))
    }
}


class Solution78x2 {
    func subsets(_ nums: [Int]) -> [[Int]] {
        if nums.count == 0 {
            return []
        }
        
        var result = [[Int]]()
        var subset = [Int]()
        //call backtracking
        backtracking(nums, &result, &subset, 0)
        return result
    }
    
    func backtracking(_ nums: [Int], _ result: inout [[Int]], _ subset: inout [Int], _ startIndex: Int) {
        result.append(subset)
        for i in startIndex..<nums.count {
            subset.append(nums[i])
            backtracking(nums, &result, &subset, i + 1)
            subset.removeLast()
        }
    }
}


class Solution78x3 {
    func subsets(_ nums: [Int]) -> [[Int]] {
        var res = [[Int]]()
        rec_subset([Int](), nums, &res)
        res.append([Int]())
        return res
    }
    
    func rec_subset(_ firstNums: [Int], _ restNum: [Int], _ res: inout [[Int]]) {
        if restNum.count == 0 {
            if firstNums.count != 0 {
                res.append(firstNums)
            }
            return
        }
        
        var tempRestNums = restNum;
        var tempFirstNums  = firstNums;
        let firstVal = tempRestNums.remove(at: 0)
        tempFirstNums.append(firstVal)
        rec_subset(tempFirstNums, tempRestNums, &res)
        
        var zeroFirstNums = firstNums;
        rec_subset(zeroFirstNums, tempRestNums, &res)
    }
}


class Solution78x4 {
    var result = [[Int]]()
    func subsets(_ nums: [Int]) -> [[Int]] {
        let count = nums.count
        for i in 0...count {
            var changeArray = Array(repeatElement(0, count: i))
            combine(&changeArray, nums, 0, i, 0, count)
        }
        return result
    }
    
    func combine(_ combineArray: inout [Int], _ nums: [Int], _ i: Int, _ total: Int, _ j: Int, _ maxJ: Int) {
        if i == total {
            result.append(combineArray)
            return ;
        }
        
        for k in j..<maxJ {
            combineArray[i] = nums[k]
            combine(&combineArray, nums, i + 1, total, k + 1, maxJ)
        }
    }
}


class Solution78x5 {
    func subsets(_ nums: [Int]) -> [[Int]] {
        guard nums.count > 0 else {return []}
        var subsets = [[Int]]()
        subsets.append([])
        
        for num in nums {
            subsets += subsets.map{$0 + [num]}
        }
        return subsets
    }
}
