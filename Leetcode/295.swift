/***
 295. Find Median from Data Stream
 Hard

 Median is the middle value in an ordered integer list. If the size of the list is even, there is no middle value. So the median is the mean of the two middle value.
 
 For example,
 [2,3,4], the median is 3
 
 [2,3], the median is (2 + 3) / 2 = 2.5
 
 Design a data structure that supports the following two operations:
 
 void addNum(int num) - Add a integer number from the data stream to the data structure.
 double findMedian() - Return the median of all elements so far.
 
 
 Example:
 
 addNum(1)
 addNum(2)
 findMedian() -> 1.5
 addNum(3)
 findMedian() -> 2
 
 
 Follow up:
 
 If all integer numbers from the stream are between 0 and 100, how would you optimize it?
 If 99% of all integer numbers from the stream are between 0 and 100, how would you optimize it?
 ***/



class MedianFinder {
    var nums : [Int]
    
    /** initialize your data structure here. */
    init() {
        nums = [Int]()
    }
    
    func addNum(_ num: Int) {
        if nums.isEmpty {
            nums.append(num)
            return
        }
        
        var left = 0
        var right = nums.count - 1
        while left <= right {
            let mid = (left + right) / 2
            if nums[mid] < num {
                left = mid + 1
            }else if nums[mid] == num {
                left = mid
                break
            }else {
                right = mid - 1
            }
        }
        
        nums.insert(num, at: left)
    }
    
    func findMedian() -> Double {
        if nums.isEmpty {
            return 0
        }
        
        if nums.count % 2 == 1 {
            return Double(nums[nums.count / 2])
        }else {
            let r1 = nums[nums.count / 2]
            let r2 = nums[nums.count / 2 - 1]
            return Double(r1 + r2) / 2
        }
    }
}

