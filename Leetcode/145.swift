/***
 145. Binary Tree Postorder Traversal
 Hard
 
 1588
 
 82
 
 Add to List
 
 Share
 Given a binary tree, return the postorder traversal of its nodes' values.
 
 Example:
 
 Input: [1,null,2,3]
 1
 \
 2
 /
 3
 
 Output: [3,2,1]
 Follow up: Recursive solution is trivial, could you do it iteratively?
 ***/




struct NodeId {
    let node: TreeNode
    let id: Int
}

class Solution145x1 {
    
    func postorderTraversal(_ root: TreeNode?) -> [Int] {
        var node = root
        var stack = [TreeNode]()
        var res = [Int]()
        
        while stack.count > 0 || node != nil {
            if node != nil {
                res.insert(node!.val, at: 0)
                stack.append(node!)
                node = node!.right
                
            } else {
                node = stack.removeLast().left
            }
        }
        
        return res
    }
}



class Solution145x2 {
    func postorderTraversal(_ root: TreeNode?) -> [Int] {
        var res: [Int] = []
        
        if root?.left != nil{
            let left = postorderTraversal(root?.left)
            res.append(contentsOf: left)
        }
        
        if root?.right != nil{
            let right = postorderTraversal(root?.right)
            res.append(contentsOf: right)
        }
        
        if let rootval = root?.val{
            
            res.append(rootval)
        }
        
        return res
    }
}



class Solution145x3 {
    func postorderTraversal(_ root: TreeNode?) -> [Int] {
        guard let node = root else { return [] }
        
        var results = [Int]()
        traverse(node, &results)
        return results
    }
    
    func traverse(_ root: TreeNode?, _ results: inout [Int]) {
        guard let node = root else { return }
        
        traverse(node.left, &results)
        traverse(node.right, &results)
        results.append(node.val)
    }
}



class Solution145x4 {
    var arr = [Int]()
    func postorderTraversal(_ root: TreeNode?) -> [Int] {
        if let r = root {
            postorderTraversal(r.left)
            postorderTraversal(r.right)
            arr.append(r.val)
            return arr
        }
        else {
            return arr
        }
    }
}
