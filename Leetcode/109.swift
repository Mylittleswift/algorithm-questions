/***
 109. Convert Sorted List to Binary Search Tree
 Medium

 Given a singly linked list where elements are sorted in ascending order, convert it to a height balanced BST.
 
 For this problem, a height-balanced binary tree is defined as a binary tree in which the depth of the two subtrees of every node never differ by more than 1.
 
 Example:
 
 Given the sorted linked list: [-10,-3,0,5,9],
 
 One possible answer is: [0,-3,9,-10,null,5], which represents the following height balanced BST:
 
 0
 / \
 -3   9
 /   /
 -10  5
 ***/




class Solution109x1 {
    func sortedListToBST(_ head: ListNode?) -> TreeNode? {
        // Count the length
        var l = 0
        var p = head
        while p != nil {
            l += 1
            p = p?.next
        }
        
        // Build an empty height balanced binary tree
        func buildTree(_ numNodes: Int) -> TreeNode? {
            if numNodes == 0 {
                return nil
            }
            let ret = TreeNode(0)
            let numLeft = (numNodes - 1) / 2
            let numRight = numNodes - 1 - numLeft
            ret.left = buildTree(numLeft)
            ret.right = buildTree(numRight)
            return ret
        }
        let root = buildTree(l)
        
        // Fill the tree
        p = head
        func dfs(_ n: TreeNode?) {
            guard let node = n else { return }
            dfs(node.left)
            node.val = p!.val
            p = p?.next
            dfs(node.right)
        }
        
        dfs(root)
        return root
    }
}



class Solution109x2 {
    func sortedListToBST(_ head: ListNode?) -> TreeNode? {
        guard head != nil else { return nil }
        var arr: [Int] = []
        var node = head
        while node != nil {
            arr.append(node!.val)
            node = node?.next
        }
        let mid = arr.count/2
        let root = TreeNode(arr[mid])
        appendBST(root, arr)
        return root
    }
    
    private func appendBST(_ root: TreeNode?, _ arr: [Int]) {
        guard arr.count > 1, let root = root else { return }
        let mid = arr.count/2
        let leftArr = Array(arr[0..<mid])
        let rightArr = Array(arr[mid+1..<arr.count])
        if leftArr.count > 1 {
            root.left = TreeNode(leftArr[leftArr.count/2])
            appendBST(root.left, leftArr)
        } else if leftArr.count == 1 {
            root.left = TreeNode(leftArr[0])
        }
        if rightArr.count > 1 {
            root.right = TreeNode(rightArr[rightArr.count/2])
            appendBST(root.right, rightArr)
        } else if rightArr.count == 1 {
            root.right = TreeNode(rightArr[0])
        }
    }
}



class Solution109x3 {
    func sortedListToBST(_ head: ListNode?) -> TreeNode? {
        if head == nil {
            return nil
        }
        if head?.next == nil{
            return TreeNode(head!.val)
        }
        var fast = head
        var slow = head
        var middle = head
        while fast?.next != nil && fast?.next?.next != nil {
            middle = slow
            slow = slow?.next
            fast = fast?.next?.next
        }
        fast = slow?.next
        let root = TreeNode(slow!.val)
        if head!.val != slow!.val {
            middle?.next = nil
            root.left = sortedListToBST(head)
        }
        root.right = sortedListToBST(fast)
        return root
    }
}
