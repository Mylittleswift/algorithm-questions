/***
 101. Symmetric Tree
 Easy

 Given a binary tree, check whether it is a mirror of itself (ie, symmetric around its center).
 
 For example, this binary tree [1,2,2,3,4,4,3] is symmetric:
 
 1
 / \
 2   2
 / \ / \
 3  4 4  3
 
 
 But the following [1,2,2,null,3,null,3] is not:
 
 1
 / \
 2   2
 \   \
 3    3
 
 
 Follow up: Solve it both recursively and iteratively.
 ***/


class Solution101x1 {
    func isSymmetric(_ root: TreeNode?) -> Bool {
        return checkTree(root, root)
    }
    
    
    private func checkTree(_ left: TreeNode?, _ right: TreeNode?) -> Bool {
        if left == nil || right == nil { return left == nil && right == nil }
        
        if left?.val != right?.val { return false }
        
        return checkTree(left?.left, right?.right) && checkTree(left?.right, right?.left)
    }
}



class Solution101x2 {
    func isSymmetric(_ root: TreeNode?) -> Bool {
        return isSymmetric2(root)
        
        guard let root = root else { return true }
        
        var queue: [TreeNode] = []
        if let left = root.left {
            queue.append(left)
        }
        if let right = root.right {
            queue.append(right)
        }
        
        while !queue.isEmpty {
            if queue.count % 2 != 0 {
                return false
            }
            let left = queue.removeFirst()
            let right = queue.removeFirst()
            
            if left.val != right.val {
                return false
            }
            if left.left?.val != right.right?.val {
                return false
            }
            if left.right?.val != right.left?.val {
                return false
            }
            
            if left.left != nil {
                queue.append(left.left!)
            }
            if right.right != nil {
                queue.append(right.right!)
            }
            if left.right != nil {
                queue.append(left.right!)
            }
            if right.left != nil {
                queue.append(right.left!)
            }
        }
        return true
    }
    
    func isSymmetric2(_ root: TreeNode?) -> Bool {
        return _isSymmetric(root, root)
    }
    
    func _isSymmetric(_ left: TreeNode?, _ right: TreeNode?) -> Bool {
        if left == nil || right == nil {
            return left == nil && right == nil
        }
        if left?.val != right?.val {
            return false
        }
        return _isSymmetric(left?.left, right?.right) &&
            _isSymmetric(left?.right, right?.left)
    }
}



// create a matrix at each depth using a queue and bfs
// walk through the levels to see if they are symmetric


class Solution101x3 {
    
    func isSymmetric(_ root: TreeNode?) -> Bool {
        guard let root = root else { return true }
        var queue = [root]
        var tree: [[Int?]] = [[root.val]]
        
        while queue.count > 0 {
            
            var newL = [Int?]()
            
            for _ in 0..<queue.count {
                let next = queue.first!
                queue.remove(at: 0)
                newL.append(next.left?.val)
                newL.append(next.right?.val)
                if let l = next.left {
                    queue.append(l)
                }
                if let r = next.right {
                    queue.append(r)
                }
            }
            
            tree.append(newL)
        }
        
        for i in tree {
            var level = i
            while level.count > 1 {
                let first = level.first!
                let last = level.popLast()
                level.remove(at: 0)
                if first != last {
                    return false
                }
            }
        }
        
        return true
    }
}



class Solution101x4 {
    func isSymmetricTree(_ left: TreeNode?, _ right: TreeNode?) -> Bool {
        if left == nil && right == nil {
            return true
        }
        
        if left == nil || right == nil {
            return false
        }
        if left!.val == right!.val {
            return isSymmetricTree(left?.left,right?.right) && isSymmetricTree(left?.right,right?.left)
        }
        return false
    }
    
    func isSymmetric(_ root: TreeNode?) -> Bool {
        if root == nil {
            return true
        }
        return isSymmetricTree(root?.left, root?.right)
    }
}



class Solution101x5 {
    func isSymmetric(_ root: TreeNode?) -> Bool {
        return symmetric(root?.left, root?.right)
    }
    func symmetric(_ left : TreeNode? , _ right : TreeNode?)-> Bool{
        switch (left, right) {
        case let(left?, right?):
            return left.val == right.val && symmetric(left.left, right.right) && symmetric(left.right, right.left)
        case (nil, nil):
            return true
        default:
            return false
        }
    }
}
