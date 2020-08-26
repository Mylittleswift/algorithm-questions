/***
 230. Kth Smallest Element in a BST
 Medium

 Given a binary search tree, write a function kthSmallest to find the kth smallest element in it.
 
 
 
 Example 1:
 
 Input: root = [3,1,4,null,2], k = 1
 3
 / \
 1   4
 \
 2
 Output: 1
 Example 2:
 
 Input: root = [5,3,6,2,4,null,null,1], k = 3
 5
 / \
 3   6
 / \
 2   4
 /
 1
 Output: 3
 Follow up:
 What if the BST is modified (insert/delete operations) often and you need to find the kth smallest frequently? How would you optimize the kthSmallest routine?
 
 
 
 Constraints:
 
 The number of elements of the BST is between 1 to 10^4.
 You may assume k is always valid, 1 ≤ k ≤ BST's total elements.
 ***/



class Solution230x1 {
    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        func TreeSize(_ root: TreeNode?) -> Int {
            if root == nil {
                return 0
            }
            return 1 + TreeSize(root?.left) + TreeSize(root?.right)
        }
        if root == nil {
            return 0
        }
        let leftSize = TreeSize(root?.left)
        if leftSize + 1 == k {
            return root!.val
        } else if leftSize >= k {
            return kthSmallest(root?.left, k)
        } else if leftSize + 1 < k {
            return kthSmallest(root?.right, k - leftSize - 1)
        }
        return 0
    }
}


class Solution230x2 {
    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        var allNode = [Int]()
        findAllNode(root, &allNode)
        allNode.sort { (a, b) -> Bool in
            a < b
        }
        return allNode[k - 1];
    }
    func findAllNode(_ node: TreeNode?, _ allNode: inout [Int]) -> Void {
        if node == nil {
            return
        }
        allNode.append(node!.val);
        findAllNode(node!.left, &allNode)
        findAllNode(node!.right, &allNode)
    }
}



class Solution230x3 {
    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        var i = 1
        var result = 0
        inorderTraversal(root: root) { val in
            if i == k {
                result = val
            }
            i += 1
        }
        return result
    }
    
    private func inorderTraversal(root: TreeNode?, handler: (Int) -> Void) {
        guard let root = root else { return }
        inorderTraversal(root: root.left, handler: handler)
        handler(root.val)
        inorderTraversal(root: root.right, handler: handler)
    }
}


