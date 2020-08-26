/***
 226. Invert Binary Tree
 Easy

 Invert a binary tree.
 
 Example:
 
 Input:
 
 4
 /   \
 2     7
 / \   / \
 1   3 6   9
 Output:
 
 4
 /   \
 7     2
 / \   / \
 9   6 3   1
 Trivia:
 This problem was inspired by this original tweet by Max Howell:
 
 Google: 90% of our engineers use the software you wrote (Homebrew), but you can’t invert a binary tree on a whiteboard so f*** off.
 ***/



class Solution226x1 {
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        guard let root = root else {return nil}
        let left = invertTree(root.left)
        let right = invertTree(root.right)
        root.left = right
        root.right = left
        return root
    }
}



class Solution226x2 {
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        if root == nil {
            return root
        }else{
            let temp = root?.left
            root?.left = invertTree(root?.right)
            root?.right = invertTree(temp)
            return root
        }
    }
}
