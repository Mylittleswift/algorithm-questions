/***
 222. Count Complete Tree Nodes
 Medium

 Given a complete binary tree, count the number of nodes.
 
 Note:
 
 Definition of a complete binary tree from Wikipedia:
 In a complete binary tree every level, except possibly the last, is completely filled, and all nodes in the last level are as far left as possible. It can have between 1 and 2h nodes inclusive at the last level h.
 
 Example:
 
 Input:
 1
 / \
 2   3
 / \  /
 4  5 6
 
 Output: 6
 ***/



class Solution222x1 {
    func countNodes(_ root: TreeNode?) -> Int {
        guard  root != nil else{
            return 0
        }
        
        var leftCount = 0
        var rightCount = 0
        
        var leftNode = root
        var rightNode = root
        while leftNode != nil{
            leftCount += 1
            leftNode = leftNode?.left
        }
        
        while rightNode != nil{
            rightCount += 1
            rightNode = rightNode?.right
        }
        if leftCount == rightCount{
            return Int( pow(Double(2), Double(leftCount)) - 1.0)
        }
        
        return countNodes(root?.left) + countNodes(root?.right) + 1
        
    }
}



class Solution222x2 {
    func countNodes(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        
        return 1 + countNodes(root.left) + countNodes(root.right)
    }
}



class Solution222x3 {
    var nodes = 0
    
    func countNodes(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        nodes += 1
        if let left = root.left {
            countNodes(left)
        }
        if let right = root.right {
            countNodes(right)
        }
        return nodes
    }
}



class Solution222x4 {
    func countNodes(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        var count = 0
        var stack = [TreeNode?]()
        stack.append(root)
        while !stack.isEmpty {
            guard let node = stack.removeLast() else {
                return count
            }
            count += 1
            if let lNode = node.left {
                stack.append(lNode)
            }
            if let rNode = node.right {
                stack.append(rNode)
            }
        }
        return count
    }
}


