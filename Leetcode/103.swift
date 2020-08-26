/***
 103. Binary Tree Zigzag Level Order Traversal
 Medium

 Given a binary tree, return the zigzag level order traversal of its nodes' values. (ie, from left to right, then right to left for the next level and alternate between).
 
 For example:
 Given binary tree [3,9,20,null,null,15,7],
 3
 / \
 9  20
 /  \
 15   7
 return its zigzag level order traversal as:
 [
 [3],
 [20,9],
 [15,7]
 ]
 ***/



class Solution103x1 {
    func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else {
            return []
        }
        
        var result = [[Int]]()
        var order = true
        var queue = [TreeNode]()
        
        queue.append(root)
        while !queue.isEmpty {
            var levelNodes = [Int]()
            let count = queue.count
            for _ in 0..<count {
                let node = queue.removeFirst()
                if order {
                    levelNodes.append(node.val)
                } else {
                    levelNodes.insert(node.val, at: 0)
                }
                if let leftNode = node.left {
                    queue.append(leftNode)
                }
                if let rightNode = node.right {
                    queue.append(rightNode)
                }
            }
            result.append(levelNodes)
            order = !order
        }
        
        return result
    }
}



class Solution103x2 {
    func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else { return [] }
        
        var queue = [root]
        var result = [[Int]]()
        var leftToRight = true
        while !queue.isEmpty {
            let levelCount = queue.count
            let levelNodes = leftToRight ? queue : queue.reversed()
            let level = levelNodes.map({ $0.val })
            result.append(level)
            leftToRight = !leftToRight
            
            for _ in 0..<levelCount {
                let node = queue.removeFirst()
                if let left = node.left {
                    queue.append(left)
                }
                
                if let right = node.right {
                    queue.append(right)
                }
            }
        }
        
        return result
    }
}



class Solution103x3 {
    func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
        var treeValArray = [[Int]]()
        guard let root = root else {
            return treeValArray
        }
        var nodeArray = [TreeNode]()
        nodeArray.append(root)
        var isleft = false
        while !nodeArray.isEmpty {
            let queueArray = nodeArray
            nodeArray.removeAll()
            var valArray = [Int]()
            for node in queueArray{
                valArray.append(node.val)
            }
            for node in queueArray.reversed(){
                if isleft{
                    if node.left != nil{
                        nodeArray.append(node.left!)
                    }
                    if node.right != nil{
                        nodeArray.append(node.right!)
                    }
                }else{
                    if node.right != nil{
                        nodeArray.append(node.right!)
                    }
                    if node.left != nil{
                        nodeArray.append(node.left!)
                    }
                }
            }
            isleft = !isleft
            treeValArray.append(valArray)
        }
        return treeValArray
    }
}



class Solution103x4 {
    func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else { return [] }
        
        var queue = [root]
        var result = [[Int]]()
        var leftToRight = true
        while !queue.isEmpty {
            let levelCount = queue.count
            let levelNodes = leftToRight ? queue : queue.reversed()
            let level = levelNodes.map({ $0.val })
            result.append(level)
            leftToRight = !leftToRight
            
            for _ in 0..<levelCount {
                let node = queue.removeFirst()
                if let left = node.left {
                    queue.append(left)
                }
                
                if let right = node.right {
                    queue.append(right)
                }
            }
        }
        
        return result
    }
}
