/***
 100. Same Tree
 Easy

 Given two binary trees, write a function to check if they are the same or not.
 
 Two binary trees are considered the same if they are structurally identical and the nodes have the same value.
 
 Example 1:
 
 Input:     1         1
 / \       / \
 2   3     2   3
 
 [1,2,3],   [1,2,3]
 
 Output: true
 Example 2:
 
 Input:     1         1
 /           \
 2             2
 
 [1,2],     [1,null,2]
 
 Output: false
 Example 3:
 
 Input:     1         1
 / \       / \
 2   1     1   2
 
 [1,2,1],   [1,1,2]
 
 Output: false
 ***/




class Solution100x1 {
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        return (p == nil && q == nil) || (p?.val == q?.val) && isSameTree(p?.right, q?.right) && isSameTree(p?.left, q?.left)
    }
}



class Solution100x2 {
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        if p?.val != q?.val {
            return false
        }
        if p?.left == nil && q?.left == nil && p?.right == nil && q?.right == nil {
            return true
        }else{
            return isSameTree(p?.left, q?.left) && isSameTree(p?.right, q?.right)
        }
    }
}



class Solution100x3 {
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        var queue: [(TreeNode?,TreeNode?)] = [(p,q)]
        while !queue.isEmpty {
            let (a,b) = queue.removeFirst()
            if !isEquaNode(a,b) {
                return false
            }
            if let leftA = a?.left, let leftB = b?.left {
                queue.append((leftA, leftB))
            }
            if let rightA = a?.right, let rightB = b?.right {
                queue.append((rightA, rightB))
            }
        }
        return true
    }
    
    func isEquaNode(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        if p == nil && q == nil { return true }
        if p == nil && q != nil { return false }
        if p != nil && q == nil { return false }
        return p!.val == q!.val &&
            p!.left?.val == q!.left?.val &&
            p!.right?.val == q!.right?.val
    }
}
