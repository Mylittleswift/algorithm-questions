/***
 105. Construct Binary Tree from Preorder and Inorder Traversal
 Medium

 Given preorder and inorder traversal of a tree, construct the binary tree.
 
 Note:
 You may assume that duplicates do not exist in the tree.
 
 For example, given
 
 preorder = [3,9,20,15,7]
 inorder = [9,3,15,20,7]
 Return the following binary tree:
 
 3
 / \
 9  20
 /  \
 15   7
 ***/




class Solution105x1 {
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        if preorder.count == 0 {
            return nil
        }
        
        var map = [Int: Int]()
        for i in 0..<inorder.count {
            map[inorder[i]] = i
        }
        
        var stack = [TreeNode]()
        var value = preorder[0]
        let root = TreeNode(value)
        
        stack.append(root)
        for i in 1..<preorder.count {
            value = preorder[i]
            let node = TreeNode(value)
            if map[value]! < map[stack.last!.val]! {
                stack.last!.left = node
            } else {
                var parent: TreeNode? = nil
                while !stack.isEmpty && map[value]! > map[stack.last!.val]! {
                    parent = stack.removeLast()
                }
                parent?.right = node
            }
            stack.append(node)
        }
        
        return root
    }
}



class Solution105x2 {
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        
        guard !preorder.isEmpty && !inorder.isEmpty else {
            return nil
        }
        
        return buildTree(preorder, 0, preorder.count-1, inorder, 0, inorder.count-1)
    }
    
    func buildTree(_ preorder: [Int], _ preStart: Int, _ preEnd: Int, _ inorder: [Int], _ inStart: Int, _ inEnd: Int) -> TreeNode? {
        
        guard preStart <= preEnd && inStart <= inEnd else {
            return nil
        }
        
        var rootVal = preorder[preStart]
        var root = TreeNode(rootVal)
        var mid: Int = 0
        
        for i in inStart...inEnd {
            if inorder[i] == rootVal {
                mid = i
                break
            }
        }
        
        root.left = buildTree(preorder, preStart+1, preStart + mid - inStart, inorder, inStart, mid - 1)
        root.right = buildTree(preorder, preStart + mid - inStart + 1, preEnd, inorder, mid+1, inEnd)
        return root
    }
}



class Solution105x3 {
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        let len = preorder.count
        if len == 0 { return nil }
        let root = TreeNode(preorder[0])
        
        var i = 0
        while i < len {
            if inorder[i] == root.val {
                break
            }
            i += 1
        }
        
        if i > 0 {
            root.left = buildTree(Array(preorder[1...i]), Array(inorder[..<i]))
        }
        if i < len-1 {
            root.right = buildTree(Array(preorder[(i+1)...]), Array(inorder[(i+1)...]))
        }
        
        return root
    }
}
