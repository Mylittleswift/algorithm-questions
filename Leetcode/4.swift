/***
 4. Median of Two Sorted Arrays
 Hard

 There are two sorted arrays nums1 and nums2 of size m and n respectively.
 
 Find the median of the two sorted arrays. The overall run time complexity should be O(log (m+n)).
 
 You may assume nums1 and nums2 cannot be both empty.
 
 Example 1:
 
 nums1 = [1, 3]
 nums2 = [2]
 
 The median is 2.0
 Example 2:
 
 nums1 = [1, 2]
 nums2 = [3, 4]
 
 The median is (2 + 3)/2 = 2.5
 ***/


class Solution4x5 {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        var nums = nums1 + nums2
        nums.sort(by: <)
        
        let mid = nums.count / 2
        if nums.count % 2 == 0 {
            return Double((nums[mid - 1] + nums[mid])) / 2
        } else {
            return Double(nums[mid])
        }
    }
}


class Solution4x6 {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        let combinedNums = nums1 + nums2
        let sortedCombinedNums = combinedNums.sorted { $0 > $1 }
        if sortedCombinedNums.count % 2 == 0 { // even
            let count = sortedCombinedNums.count
            let middleIndex2 = count / 2
            let middleIndex1 = middleIndex2 - 1
            let middleSum = sortedCombinedNums[middleIndex1] + sortedCombinedNums[middleIndex2]
            let median = Double(middleSum) / 2
            return median
        } else { // odd
            let middleIndex = (sortedCombinedNums.count / 2)
            let median = Double(sortedCombinedNums[middleIndex])
            return median
        }
    }
}


class Solution4x7 {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        let merged = (nums1 + nums2).sorted(by: <)
        let count = merged.count
        guard count > 0 else { return 0 }
        if count % 2 == 0 {
            let a = Double(merged[Int(count/2)])
            let b = Double(merged[Int(count/2) - 1])
            return (a + b) / 2
            
        } else {
            return Double(merged[Int(count-1)/2])
            
        }
    }
}


class Solution4x8 {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        var nums = nums1 + nums2
        nums.sort()
        if nums.count == 0 {
            return 0
        } else {
            if nums.count % 2 == 0 {
                return (Double(nums[nums.count/2]) + Double(nums[nums.count/2-1]))/2
            } else {
                return Double(nums[nums.count/2])
            }
        }
    }
}


class Solution4x9 {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        let totalArray = nums1 + nums2
        var resultArray = totalArray.sorted()
        
        if resultArray.count % 2 == 1 {
            let midPoint = (resultArray.count - 1) / 2
            return Double(resultArray[midPoint])
            
        } else {
            let left = resultArray.count / 2 - 1
            let right = resultArray.count / 2
            print(right)
            return Double((Double(resultArray[left]) + Double(resultArray[right])) / 2)
        }
    }
}

