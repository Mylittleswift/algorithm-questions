/***
 94. Binary Tree Inorder Traversal
 Medium

 Given a binary tree, return the inorder traversal of its nodes' values.
 
 Example:
 
 Input: [1,null,2,3]
 1
 \
 2
 /
 3
 
 Output: [1,3,2]
 Follow up: Recursive solution is trivial, could you do it iteratively?
 ***/




class Solution94x1 {
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return [Int]() }
        
        var ret = [Int]()
        var worklist = [TreeNode]()
        var n : TreeNode? = root
        
        while !worklist.isEmpty || n != nil {
            if n != nil {
                worklist.append(n!)
                n = n!.left
            } else {
                n = worklist.popLast()
                ret.append(n!.val)
                n = n!.right
            }
        }
        
        return ret
    }
}



class Solution94x2 {
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        return inorderTraversal_morris(root)
    }
    
    func inorderTraversal_morris(_ r: TreeNode?) -> [Int] {
        var root = r
        if root == nil {
            return []
        } else {
            var res: [Int] = []
            var pre: TreeNode? = nil
            while root != nil {
                if root?.left == nil {
                    res.append((root?.val)!)
                    root = root?.right
                } else {
                    pre = root?.left
                    while pre?.right != nil && pre?.right! !== root {
                        pre = pre?.right
                    }
                    if pre?.right == nil {
                        pre?.right = root
                        root = root?.left
                    } else {
                        pre?.right = nil
                        res.append((root?.val)!)
                        root = root?.right
                    }
                }
            }
            return res
        }
    }
    // Recursion, t = O(N), average s = O(log(N)), worst s = O(N)
    func inorderTraversal_iteration(_ root: TreeNode?) -> [Int] {
        var res: [Int] = []
        var stack: [TreeNode?] = []
        var curr: TreeNode? = root
        while curr != nil || stack.isEmpty == false {
            while let unwrapped = curr {
                stack.append(unwrapped)
                curr = curr?.left
            }
            let last: TreeNode? = stack.removeLast()
            res.append(last!.val)
            curr = last!.right
        }
        return res
    }
    func inorderTraversal_recursion_helper(root: TreeNode?, arr: inout [Int]) {
        guard let root = root else { return }
        inorderTraversal_recursion_helper(root: root.left, arr: &arr)
        arr.append(root.val)
        inorderTraversal_recursion_helper(root: root.right, arr: &arr)
    }
    // Recursion, t = O(N), average s = O(log(N)), worst s = O(N)
    func inorderTraversal_recursion(_ root: TreeNode?) -> [Int] {
        var res: [Int] = []
        inorderTraversal_recursion_helper(root: root, arr: &res)
        return res
    }
}



class Solution94x3 {
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        var arr = [Int]()
        if root != nil && root!.left != nil {
            arr.append(contentsOf:inorderTraversal(root!.left))
        }
        if root != nil {
            arr.append(root!.val)
        }
        if root != nil && root!.right != nil {
            arr.append(contentsOf:inorderTraversal(root!.right))
        }
        return arr
    }
}



class Solution94x4 {
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        var answer: [Int] = []
        inorder(root, &answer)
        return answer
    }
    
    func inorder(_ node: TreeNode?, _ answer: inout [Int]) {
        if let node = node {
            inorder(node.left, &answer)
            answer.append(node.val)
            inorder(node.right, &answer)
        }
    }
}



class Solution94x5 {
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        var result = [Int]()
        var stack = [TreeNode]()
        var pops = [TreeNode]()
        var p = root
        if p != nil {
            stack.append(p!)
        }else {
            return result
        }
        
        while (p != nil) {
            
            var isp = false
            if let lastPop = pops.last {
                if lastPop === p! {
                    pops.removeLast()
                    isp = true
                }
            }
            let l =  p!.left
            if  (l != nil) && !isp{
                stack.append(l!)
                pops.append(p!)
            }else {
                result.append(p!.val)
                stack.removeLast()
                if let r = p!.right {
                    stack.append(r)
                }
            }
            p = stack.last
        }
        
        return result
    }
}



class Solution94x6 {
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        var result = [Int]()
        var stack = [TreeNode]()
        var pops = [TreeNode]()
        var p = root
        if p != nil {
            stack.append(p!)
        }else {
            return result
        }
        
        while (p != nil) {
            
            var isp = false
            if let lastPop = pops.last {
                if lastPop === p! {
                    pops.removeLast()
                    isp = true
                }
            }
            let l =  p!.left
            if  (l != nil) && !isp{
                stack.append(l!)
                pops.append(p!)
            }else {
                result.append(p!.val)
                stack.removeLast()
                if let r = p!.right {
                    stack.append(r)
                }
            }
            p = stack.last
        }
        
        return result
    }
}
