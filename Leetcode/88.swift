/***
 88. Merge Sorted Array
 Easy

 Given two sorted integer arrays nums1 and nums2, merge nums2 into nums1 as one sorted array.
 
 Note:
 
 The number of elements initialized in nums1 and nums2 are m and n respectively.
 You may assume that nums1 has enough space (size that is greater or equal to m + n) to hold additional elements from nums2.
 Example:
 
 Input:
 nums1 = [1,2,3,0,0,0], m = 3
 nums2 = [2,5,6],       n = 3
 
 Output: [1,2,2,3,5,6]
 ***/



class Solution88x1 {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var index1 = 0
        var index2 = 0
        
        while index2 < n {
            if nums1[index1] > nums2[index2] || index1-index2 >= m {
                nums1.insert(nums2[index2], at: index1)
                index1 += 1
                index2 += 1
            } else if nums1[index1] <= nums2[index2] {
                index1 += 1
            }
        }
    }
}


/**
 * 思路：从尾部开始合并，避免覆盖
 * 时间复杂度：O(n)，空间复杂度：O(1)
 */
class Solution88x2 {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var i = m - 1, j = n - 1
        
        while i >= 0 || j >= 0 {
            if j < 0 || (i >= 0 && nums1[i] > nums2[j]) {
                nums1[i + j + 1] = nums1[i]
                i -= 1
            } else {
                nums1[i + j + 1] = nums2[j]
                j -= 1
            }
        }
    }
}


class Solution88x3 {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var i = m - 1, j = n - 1
        while i + j + 1 >= 0 && j != -1 {
            if i >= 0 && nums1[i] >= nums2[j] {
                nums1[i + j + 1] = nums1[i]
                i = i - 1
            } else {
                nums1[i + j + 1] = nums2[j]
                j = j - 1
            }
        }
    }
}


class Solution88x4 {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var i = 0, j = 0
        
        while j < n && i < nums1.count {
            if (nums1[i] < nums2[j] && i < m + j) {
                i += 1
            } else {
                nums1.insert(nums2[j], at: i)
                i += 1
                j += 1
            }
        }
        if nums1.count > n + m {
            nums1.removeLast(nums1.count - n - m)
        }
    }
}


class Solution88x5 {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        
        for i in m..<m+n {
            nums1[i] = nums2[i-m]
        }
        nums1 = nums1.sorted()
    }
}
