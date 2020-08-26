/***
 112. Path Sum
 Easy

 Given a binary tree and a sum, determine if the tree has a root-to-leaf path such that adding up all the values along the path equals the given sum.
 
 Note: A leaf is a node with no children.
 
 Example:
 
 Given the below binary tree and sum = 22,
 
 5
 / \
 4   8
 /   / \
 11  13  4
 /  \      \
 7    2      1
 return true, as there exist a root-to-leaf path 5->4->11->2 which sum is 22.
 ***/





class Solution112x2 {
    func hasPathSum(_ root: TreeNode?, _ sum: Int) -> Bool {
        if root == nil {return false}
        return check(root,0,sum)
    }
    func check(_ node:TreeNode?,_ sum:Int,_ cur:Int)->Bool
    {
        if node == nil && sum == cur
        {
            return true
        }
        if node == nil
        {
            return false
        }
        if node!.left == nil && node!.right != nil
        {
            return check(node!.right,sum+node!.val,cur)
        }
        if node!.left != nil && node!.right == nil
        {
            return check(node!.left,sum+node!.val,cur)
        }
        return check(node!.left,sum + node!.val, cur)
            ||  check(node!.right,sum + node!.val, cur)
    }
}




class Solution112x3 {
    func hasPathSum(_ root: TreeNode?, _ sum: Int) -> Bool {
        if root?.left == nil, root?.right == nil { // 叶节点或空节点
            guard root != nil else {
                return false
            }
            return sum == root!.val ? true : false
        }
        return hasPathSum(root?.left, sum - root!.val) || hasPathSum(root?.right, sum - root!.val)
    }
}



class Solution112x4 {
    func hasPathSum(_ root: TreeNode?, _ sum: Int) -> Bool {
        
        guard let root = root else { return false }
        
        let difference = sum - root.val
        if difference == 0 && root.left == nil && root.right == nil {
            return true
        } else {
            return hasPathSum(root.left, difference) || hasPathSum(root.right, difference)
        }
        
        return false
    }
}
