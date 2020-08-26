/***
 129. Sum Root to Leaf Numbers
 Medium

 Given a binary tree containing digits from 0-9 only, each root-to-leaf path could represent a number.
 
 An example is the root-to-leaf path 1->2->3 which represents the number 123.
 
 Find the total sum of all root-to-leaf numbers.
 
 Note: A leaf is a node with no children.
 
 Example:
 
 Input: [1,2,3]
 1
 / \
 2   3
 Output: 25
 Explanation:
 The root-to-leaf path 1->2 represents the number 12.
 The root-to-leaf path 1->3 represents the number 13.
 Therefore, sum = 12 + 13 = 25.
 Example 2:
 
 Input: [4,9,0,5,1]
 4
 / \
 9   0
 / \
 5   1
 Output: 1026
 Explanation:
 The root-to-leaf path 4->9->5 represents the number 495.
 The root-to-leaf path 4->9->1 represents the number 491.
 The root-to-leaf path 4->0 represents the number 40.
 Therefore, sum = 495 + 491 + 40 = 1026.
 ***/




class Solution129x1 {
    func sumNumbers(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        var sum = 0
        var stack: [(node: TreeNode, accum: Int)] = [(node: root, accum: 0)]
        
        while !stack.isEmpty {
            let currentVal = stack.removeLast()
            let updatedAccum = currentVal.accum * 10 + currentVal.node.val
            
            guard currentVal.node.left != nil || currentVal.node.right != nil else {
                sum += updatedAccum
                continue
            }
            
            if let leftNode = currentVal.node.left {
                stack.append((node: leftNode, accum: updatedAccum))
            }
            
            if let rightNode = currentVal.node.right {
                stack.append((node: rightNode, accum: updatedAccum))
            }
        }
        
        return sum
    }
    
}



class Solution129x2 {
    func sumNumbers(_ root: TreeNode?) -> Int {
        if root == nil { return 0 }
        else {
            let result = getNumber(root!, 0)
            return result
        }
    }
    
    func getNumber(_ node: TreeNode, _ number: Int) -> Int {
        let currentNumber = number * 10 + node.val
        var result = 0
        if node.left == nil && node.right == nil {
            return currentNumber
        } else if node.left == nil {
            result = getNumber(node.right!, currentNumber)
        } else if node.right == nil {
            result = getNumber(node.left!, currentNumber)
        } else {
            result = getNumber(node.left!, currentNumber) + getNumber(node.right!, currentNumber)
        }
        return result
    }
}


class Solution129x3 {
    func sumNumbers(_ root: TreeNode?) -> Int {
        let nums = numbers(root)
        print(nums)
        return nums.reduce(0, { $0 + Int($1)! })
    }
    
    func numbers(_ root: TreeNode?) -> [String] {
        guard let root = root else { return [] }
        
        if root.left == nil && root.right == nil {
            return [String(root.val)]
        }
        
        return (numbers(root.left) + numbers(root.right)).map { String(root.val) + $0 }
    }
}



class Solution129x4 {
    func sumNumbers(_ root: TreeNode?) -> Int {
        var sum = 0
        treeShowNodeVal(root: root, item: "", sum: &sum)
        return sum
    }
    func treeShowNodeVal(root: TreeNode?, item: String, sum: inout Int){
        if root == nil {
            return
        }
        var newItem = item
        newItem.append(String((root?.val)!))
        if root?.left == nil && root?.right == nil {
            let itemValue = Int(newItem)
            sum = sum + itemValue!
        }
        treeShowNodeVal(root: root?.left, item: newItem, sum: &sum)
        treeShowNodeVal(root: root?.right, item: newItem, sum: &sum)
    }
}
