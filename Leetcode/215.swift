/***
 215. Kth Largest Element in an Array
 Medium

 Find the kth largest element in an unsorted array. Note that it is the kth largest element in the sorted order, not the kth distinct element.
 
 Example 1:
 
 Input: [3,2,1,5,6,4] and k = 2
 Output: 5
 Example 2:
 
 Input: [3,2,3,1,2,4,5,5,6] and k = 4
 Output: 4
 Note:
 You may assume k is always valid, 1 ≤ k ≤ array's length.
 ***/




class Solution215x1 {
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        return nums.sorted(by: >)[k - 1]
    }
}


class Solution215x2 {
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        var newNums = nums
        buildMaxHead(&newNums)//建最大堆
        for i in ((newNums.count - k - 1)..<newNums.count).reversed() {
            swap(&newNums, 0, i)
            if i == newNums.count - k {
                return newNums[i]
            }
            headify(&newNums, 0, i)
        }
        return 0
    }
    //MARK: 堆排序
    func headSort(_ nums:inout [Int]) {
        buildMaxHead(&nums)
        for i in (1..<nums.count).reversed() {
            swap(&nums, i, 0)
            headify(&nums, 0, i)
        }
    }
    //建最大堆
    func buildMaxHead(_ nums:inout [Int]) {
        for i in (0...nums.count/2).reversed() {
            headify(&nums, i,nums.count)
        }
    }
    //堆调整
    func headify(_ nums:inout [Int], _ index: Int, _ length: Int) {
        let leftChild = index * 2 + 1 // index节点的左孩子节点
        let rightChild = index * 2 + 2 //index节点的右孩子节点
        var largertIndex = index //节点与左右孩子的最大值
        if leftChild < length && nums[leftChild] > nums[largertIndex] {
            largertIndex = leftChild
        }
        if rightChild < length && nums[rightChild] > nums[largertIndex] {
            largertIndex = rightChild
        }
        //如果交换了
        if largertIndex != index {
            swap(&nums, largertIndex, index)//交换节点值
            headify(&nums, largertIndex,length)//调整变动的节点
        }
    }
    func swap(_ nums:inout [Int],_ i:Int,_ j: Int) {
        let temp = nums[i]
        nums[i] = nums[j]
        nums[j] = temp
    }
}


class Solution215x3 {
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        var nums = nums
        return find(&nums, 0, nums.count - 1, k)
    }
    
    func find(_ nums: inout [Int], _ start: Int, _ end: Int, _ k: Int) -> Int {
        let pivot = partition(&nums, start, end)
        let j = nums.count - pivot
        if j > k {
            return find(&nums, pivot + 1, end, k)
        }
        if j == k {
            return nums[pivot]
        }
        return find(&nums, start, pivot - 1, k)
    }
    
    func partition(_ nums: inout [Int], _ start: Int, _ end: Int) -> Int {
        guard start < end else {
            return start
        }
        let pivot = Int.random(in: start...end)
        nums.swapAt(pivot, end)
        var index = start
        for i in start..<end where nums[i] < nums[end] {
            nums.swapAt(i, index)
            index += 1
        }
        nums.swapAt(index, end)
        return index
    }
}
