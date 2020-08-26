/***
 31. Next Permutation
 Medium

 Implement next permutation, which rearranges numbers into the lexicographically next greater permutation of numbers.
 
 If such arrangement is not possible, it must rearrange it as the lowest possible order (ie, sorted in ascending order).
 
 The replacement must be in-place and use only constant extra memory.
 
 Here are some examples. Inputs are in the left-hand column and its corresponding outputs are in the right-hand column.
 
 1,2,3 → 1,3,2
 3,2,1 → 1,2,3
 1,1,5 → 1,5,1
 ***/


class Solution31x1 {
    func nextPermutation(_ nums: inout [Int]) {
        let len = nums.count
        var i = len - 2
        while i >= 0 && nums[i + 1] <= nums[i] {
            i -= 1
        }
        if i >= 0 {
            var j = len - 1
            while j >= 0 && nums[j] <= nums[i] {
                j -= 1
            }
            nums.swapAt(i, j)
        }
        reverse(&nums, i + 1)
    }
    
    func reverse(_ nums: inout [Int], _ start: Int) {
        var i = start, j = nums.count - 1
        while i < j {
            nums.swapAt(i, j)
            i += 1
            j -= 1
        }
    }
}


class Solution31x2 {
    func nextPermutation(_ nums: inout [Int]) {
        if nums.count <= 1 { return }
        var ind = -1
        for i in (0..<(nums.count-1)).reversed() {
            if nums[i] < nums[i+1] {
                ind = i
                break
            }
        }
        if ind == -1 {
            nums = nums.reversed()
            return
        }
        let ind1 = ind
        var temp = nums[ind+1]
        var ind2 = ind+1
        while ind < nums.count {
            if nums[ind] > nums[ind1] && nums[ind] <= temp {
                ind2 = ind
                temp = nums[ind]
            }
            ind += 1
        }
        (nums[ind1], nums[ind2]) = (nums[ind2], nums[ind1])
        nums = Array(nums[0...ind1]) + Array(nums[(ind1+1)..<nums.count]).reversed()
    }
}


class Solution31x4 {
    func nextPermutation(_ nums: inout [Int]) {
        guard nums.count > 1 else {
            return
        }
        for i in (0 ..< nums.count - 1).reversed() {
            var lowestDiff = -1
            var lowestIndex = -1
            for j in i+1 ..< nums.count {
                let diff = nums[j] - nums[i]
                if diff > 0 && (diff < lowestDiff || lowestDiff == -1) {
                    lowestDiff = diff
                    lowestIndex = j
                }
            }
            if lowestIndex >= 0 {
                nums.swapAt(i, lowestIndex)
                nums[i+1..<nums.count].sort()
                return
            }
        }
        for i in 0 ..< nums.count / 2 {
            nums.swapAt(i, nums.count - 1 - i)
        }
    }
}


class Solution31x5 {
    func nextPermutation(_ nums: inout [Int]) {
        var end = nums.count - 1
        while end > 0 {
            if nums[end - 1] < nums[end] {
                break
            }
            end -= 1
        }
        
        if end == 0 {
            for i in 0..<nums.count / 2 {
                nums.swapAt(i, nums.count - 1 - i)
            }
        } else {
            end -= 1
            var i = nums.count - 1
            while i > end {
                if nums[i] > nums[end] {
                    break
                }
                i -= 1
            }
            nums.swapAt(i, end)
            for i in 0..<(nums.count - end) / 2 {
                nums.swapAt(end + 1 + i, nums.count - 1 - i)
            }
        }
    }
}
