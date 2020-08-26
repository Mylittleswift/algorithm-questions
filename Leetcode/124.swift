/***
 124. Binary Tree Maximum Path Sum
 Hard
 
 3365
 
 271
 
 Add to List
 
 Share
 Given a non-empty binary tree, find the maximum path sum.
 
 For this problem, a path is defined as any sequence of nodes from some starting node to any node in the tree along the parent-child connections. The path must contain at least one node and does not need to go through the root.
 
 Example 1:
 
 Input: [1,2,3]
 
 1
 / \
 2   3
 
 Output: 6
 Example 2:
 
 Input: [-10,9,20,null,null,15,7]
 
 -10
 / \
 9  20
 /  \
 15   7
 
 Output: 42
 ***/



class Solution124x1 {
    func maxPathSum(_ root: TreeNode?) -> Int {
        var result = Int.min
        
        DFS(root, &result)
        
        return result
    }
    
    private func DFS(_ root: TreeNode?, _ result: inout Int) -> Int {
        guard let root = root else {
            return 0
        }
        
        let left = max(0,DFS(root.left, &result))
        let right = max(0,DFS(root.right, &result))
        
        result = max(result, left + right + root.val)
        
        return max(left, right) + root.val
    }
}



class Solution124x2 {
    func maxPathSum(_ root: TreeNode?) -> Int {
        if root == nil {return 0}
        var tmpMax = root!.val
        maxChildPathSum(root, &tmpMax)
        return tmpMax
    }
    
    /**
     * 计算二叉树子树的最大路径和以及整棵二叉树的最大路径和
     * 子树路径必须以根结点开始，以树中某一结点结束
     * 二叉树的最大路径和的路径，不必以根结点为开始结点
     * @param : root 二叉树根结点
     * @param : tmpMax 暂存整棵二叉树的最路径和的变量的地址
     * @return : 子树的最大路径和
     */
    func maxChildPathSum(_ root: TreeNode?,_ tmpMax: inout Int) ->Int
    {
        if root == nil {return 0}
        /* 计算左右子树的最大路径和 */
        var leftMax:Int = maxChildPathSum(root!.left, &tmpMax)
        var rightMax:Int = maxChildPathSum(root!.right, &tmpMax);
        /* 尝试更新整棵二叉树的最大路径和 */
        var tmp:Int = root!.val
        if leftMax > 0 {tmp += leftMax}
        if rightMax > 0 {tmp += rightMax}
        if tmp > tmpMax {tmpMax = tmp}
        /* 计算并返回子树的最大路径和 */
        var maxRoot:Int = max(root!.val, max(root!.val + leftMax, root!.val + rightMax))
        return maxRoot
    }
}



class Solution124x3 {
    private var maxValue = Int.min
    
    func maxPathSum(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        
        maxValue = root.val
        getMaxValue(root)
        return maxValue
    }
    
    
    @discardableResult
    private func getMaxValue(_ root: TreeNode?) -> Int {
        guard let root = root else { return Int.min }
        
        var leftValue = Int.min, rightValue = Int.min
        if let left = root.left {
            leftValue = getMaxValue(left)
        }
        if let right = root.right {
            rightValue = getMaxValue(right)
        }
        
        leftValue = leftValue > 0 ? leftValue : 0
        rightValue = rightValue > 0 ? rightValue : 0
        
        if leftValue + root.val + rightValue > maxValue {
            maxValue = leftValue + root.val + rightValue
        }
        
        return max(leftValue, rightValue) + root.val
    }
}
