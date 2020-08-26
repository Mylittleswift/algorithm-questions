/***
 199. Binary Tree Right Side View
 Medium

 Given a binary tree, imagine yourself standing on the right side of it, return the values of the nodes you can see ordered from top to bottom.
 
 Example:
 
 Input: [1,2,3,null,5,null,4]
 Output: [1, 3, 4]
 Explanation:
 
 1            <---
 /   \
 2     3         <---
 \     \
 5     4       <---
 ***/




class Solution199x1 {
    func rightSideView(_ root: TreeNode?) -> [Int] {
        if let root = root {
            var result: [Int] = []
            var current: [TreeNode] = [root]
            var next: [TreeNode] = []
            
            while !current.isEmpty {
                if (current.count == 1) {
                    result.append(current[0].val)
                }
                
                let node = current.removeFirst()
                if let left = node.left {
                    next.append(left)
                }
                if let right = node.right {
                    next.append(right)
                }
                
                if (current.count == 0) {
                    current = next
                    next = []
                }
            }
            
            return result
        } else {
            return []
        }
    }
}



class Solution199x2 {
    func rightSideView(_ root: TreeNode?) -> [Int] {
        
        var res = [Int]()
        guard var cur = root else { return res }
        var q = [cur]
        while !q.isEmpty {
            var len = q.count
            for i in 0..<len {
                cur = q.removeFirst()
                if i == len-1 { res.append(cur.val) }
                if let left = cur.left { q.append(left) }
                if let right = cur.right { q.append(right) }
            }
        }
        return res
    }
}



class Solution199x3 {
    func rightSideView(_ root: TreeNode?) -> [Int] {
        
        var values = [Int].init()
        
        func getTreeNodeValue(_ node: TreeNode?, index: Int) {
            
            guard let treeNode = node else {
                return
            }
            
            if index < values.count {
                values[index] = treeNode.val
            } else {
                values.append(treeNode.val)
            }
            
            if let left = treeNode.left {
                getTreeNodeValue(left, index: index + 1)
            }
            
            if let right = treeNode.right {
                getTreeNodeValue(right, index: index + 1)
            }
        }
        
        getTreeNodeValue(root, index: 0)
        
        return values
    }
}



class Solution199x4 {
    func rightSideView(_ root: TreeNode?) -> [Int] {
        guard let root = root else { return [Int]() }
        var matrix = [[Int]]()
        var array1 = [TreeNode]()
        var array2 = [TreeNode]()
        array1.append(root)
        while array1.count > 0 {
            var temp = [Int]()
            for node in array1 {
                temp.append(node.val)
                if let left = node.left {
                    array2.append(left)
                }
                if let right = node.right {
                    array2.append(right)
                }
            }
            matrix.append(temp)
            array1 = array2
            array2.removeAll()
        }
        return matrix.map { array in
            return array.last!
        }
    }
}
