/***
 102. Binary Tree Level Order Traversal
 Medium

 Given a binary tree, return the level order traversal of its nodes' values. (ie, from left to right, level by level).
 
 For example:
 Given binary tree [3,9,20,null,null,15,7],
 3
 / \
 9  20
 /  \
 15   7
 return its level order traversal as:
 [
 [3],
 [9,20],
 [15,7]
 ]
 ***/



class Solution102x1 {
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        var resArray = [[Int]]()
        if root == nil {
            return resArray
        }
        
        if root?.left == nil && root?.right == nil {
            let array = [Int](repeating:root!.val, count:1)
            resArray.append(array)
            return resArray
        }
        
        var currentLevelNodes = [TreeNode]()
        currentLevelNodes.append(root!)
        
        helper(currentLevelNodes,&resArray)
        
        return resArray
    }
    
    fileprivate func helper(_ nodesArray:[TreeNode], _ array: inout [[Int]]) -> Void {
        
        var valArray = [Int]()
        var nextLevelArray = [TreeNode]()
        
        for i in 0 ..< nodesArray.count {
            let node = nodesArray[i]
            valArray.append(node.val)
            
            if node.left != nil {
                nextLevelArray.append(node.left!)
            }
            
            if node.right != nil {
                nextLevelArray.append(node.right!)
            }
        }
        
        array.append(valArray)
        
        if nextLevelArray.count > 0 {
            helper(nextLevelArray,&array)
        }
    }
}



class Solution102x2 {
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let temp = root else {
            return []
        }
        var result = Array<Array<Int>>()
        recursive(temp, 0, &result)
        return result
    }
    
    func recursive(_ node: TreeNode?, _ level: Int, _ result: inout Array<Array<Int>>) {
        guard let temp = node else {
            return
        }
        if result.count - 1 < level {
            let curLevels = Array<Int>()
            result.append(curLevels)
        }
        result[level].append(temp.val)
        
        recursive(temp.left, level + 1, &result)
        recursive(temp.right, level + 1, &result)
    }
}



class Solution102x3 {
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        var result = [[Int]]()
        var nodeValues = [Int]()
        var current = [TreeNode]()
        var next = [TreeNode]()
        
        guard var node = root else {
            return result
        }
        current.append(node)
        while !current.isEmpty {
            let t = current.removeFirst()
            if t.left != nil {
                next.append(t.left!)
            }
            if t.right != nil {
                next.append(t.right!)
            }
            nodeValues.append(t.val)
            if current.isEmpty {
                current = next
                next.removeAll()
                result.append(nodeValues)
                nodeValues.removeAll()
            }
        }
        return result
    }
}



class Solution102x4 {
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        var levels: [[Int]] = []
        if root == nil { return levels }
        
        var queue: [TreeNode] = [root!]
        
        
        while !queue.isEmpty {
            let levelCount = queue.count
            var level: [Int] = []
            for _ in 0..<levelCount {
                let n = queue.removeFirst()
                level.append(n.val)
                if let left = n.left {
                    queue.append(left)
                }
                if let right = n.right {
                    queue.append(right)
                }
            }
            levels.append(level)
        }
        return levels
        
    }
}



class Solution102x5 {
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        var res = [[Int]]()
        guard let _root = root else {
            return res
        }
        var nodeq = [_root]
        while(nodeq.count > 0){
            res.append(nodeq.map{ $0.val })
            
            nodeq = nodeq.flatMap{ [$0.left, $0.right].compactMap{ $0 } }
        }
        return res
    }
}
