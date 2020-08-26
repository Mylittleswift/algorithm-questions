/***
 108. Convert Sorted Array to Binary Search Tree
 Easy

 Given an array where elements are sorted in ascending order, convert it to a height balanced BST.
 
 For this problem, a height-balanced binary tree is defined as a binary tree in which the depth of the two subtrees of every node never differ by more than 1.
 
 Example:
 
 Given the sorted array: [-10,-3,0,5,9],
 
 One possible answer is: [0,-3,9,-10,null,5], which represents the following height balanced BST:
 
 0
 / \
 -3   9
 /   /
 -10  5
 ***/



class Solution108x1 {
    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        return makeTree(nums, 0, nums.count - 1)
    }
    
    func makeTree(_ nums: [Int], _ start: Int, _ end: Int) -> TreeNode? {
        guard start <= end else { return nil }
        
        let mid = (start + end) / 2
        let node = TreeNode(nums[mid])
        node.left = makeTree(nums, start, mid - 1)
        node.right = makeTree(nums, mid + 1, end)
        return node
    }
}



class Solution108x2 {
    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        guard nums.count != 0 else {
            return nil
        }
        
        let root = TreeNode(nums[nums.count / 2])
        root.left = sortedArrayToBST(Array(nums[0..<nums.count / 2]))
        root.right = sortedArrayToBST(Array(nums[nums.count / 2 + 1..<nums.count]))
        
        return root
    }
}



class Solution108x3 {
    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        guard nums.count > 0 else {
            return nil
        }
        
        guard nums.count > 1 else {
            let treeNode = TreeNode(nums[0])
            return treeNode
        }
        
        let middleIndex = nums.count/2
        let treeNode = TreeNode(nums[middleIndex])
        
        
        let leftSubarray = Array(nums[0..<middleIndex])
        let rightSubarray = ((middleIndex+1) < nums.count)
            ? Array(nums[(middleIndex+1)..<nums.count])
            : []
        
        let leftNode = sortedArrayToBST(leftSubarray)
        let rightNode = sortedArrayToBST(rightSubarray)
        
        treeNode.left = leftNode
        treeNode.right = rightNode
        return treeNode
    }
}



class Solution108x4 {
    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        return sortedArrayToBST1(nums, 0, nums.count)
    }
    
    private func sortedArrayToBST1(_ nums: [Int], _ beg: Int, _ end: Int) -> TreeNode? {
        if beg == end { return nil }
        if end - beg == 1 { return TreeNode(nums[beg]) }
        
        let mid = (beg + end) / 2
        let node = TreeNode(nums[mid])
        node.left = sortedArrayToBST1(nums, beg, mid)
        node.right = sortedArrayToBST1(nums, mid + 1, end)
        return node
    }
}
