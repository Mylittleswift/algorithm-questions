/***
 46. Permutations
 Medium

 Given a collection of distinct integers, return all possible permutations.
 
 Example:
 
 Input: [1,2,3]
 Output:
 [
 [1,2,3],
 [1,3,2],
 [2,1,3],
 [2,3,1],
 [3,1,2],
 [3,2,1]
 ]
 ***/
 

class Solution46x1 {
    func permute (_ arr:[Int]) -> [[Int]] {
        var array = arr
        var result = [[Int]]()
        helper(&array, 0, &result)
        return result
    }
    
    func helper (_ arr: inout [Int], _ begin: Int, _ results: inout [[Int]]) {
        if begin >= arr.count {
            results.append(arr)
            return
        } else {
            for i in begin..<arr.count {
                arr.swapAt(begin, i)
                helper(&arr, begin + 1, &results)
                arr.swapAt(begin, i)
            }
        }
    }
}



class Solution46x2 {
        func permute(_ nums: [Int]) -> [[Int]] {
            var result = [[Int]]()
            var temp = [Int]()
            var isVisited : [Bool] = Array(repeating: false, count: nums.count)
            backTracking(nums, &result, &temp, &isVisited)
            return result
            
        }
        
        func backTracking(_ nums: [Int], _ result: inout [[Int]], _ temp: inout [Int], _ isVisited: inout [Bool]) {
            if temp.count == nums.count {
                result.append(temp)
                return
            }
            for i in 0 ..< nums.count where !isVisited[i] {
                temp.append(nums[i])
                isVisited[i] = true
                backTracking(nums, &result, &temp, &isVisited)
                isVisited[i] = false
                temp.removeLast()
            }
        }
}


class Solution46x4 {
    func permute(_ nums: [Int]) -> [[Int]] {
        var result : [[Int]] = []
        permuteNext(from: nums, to: [], result: &result)
        return result
    }
    func permuteNext(from : [Int] , to : [Int]  , result : inout [[Int]]) {
        if from.count == 0 {
            result.append(to)
            return
        }
        
        for idx in 0..<from.count {
            var newfrom = from
            newfrom.remove(at: idx)
            permuteNext(from: newfrom, to: to + [from[idx]], result: &result)
        }
    }
}


class Solution46x5 {
    func permute(_ nums: [Int]) -> [[Int]] {
        if nums.isEmpty {
            return[[]]
        } else if nums.count == 1 {
            return [nums]
        } else {
            var result = [[Int]]()
            for i in 0..<nums.count {
                var nums = nums
                let num = nums.remove(at: i)
                for j in permute(nums) {
                    result.append([num] + j)
                }
            }
            return result
        }
    }
}


class Solution46x6 {
    func permute(_ nums: [Int]) -> [[Int]] {
        var result: [[Int]] = []
        permute(nums, [], &result)
        return result
    }
    
    func permute(_ nums: [Int], _ nums2: [Int], _ result: inout [[Int]]) {
        guard nums2.count != nums.count else {
            result.append(nums2)
            return
        }
        
        nums.filter { !nums2.contains($0) }.forEach { (num) in
            var nums4 = nums2
            nums4.append(num)
            permute(nums, nums4, &result)
        }
    }
}
