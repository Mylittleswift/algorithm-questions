/***
 114. Flatten Binary Tree to Linked List
 Medium

 Given a binary tree, flatten it to a linked list in-place.
 
 For example, given the following tree:
 
 1
 / \
 2   5
 / \   \
 3   4   6
 The flattened tree should look like:
 
 1
 \
 2
 \
 3
 \
 4
 \
 5
 \
 6
 ***/




class Solution114x1 {
    func flatten(_ root: TreeNode?) {
        guard let root = root else { return }
        let l = root.left != nil;
        let r = root.right != nil;
        flatten(root.left)
        flatten(root.right)
        if (l && r) {
            var left = root.left!;
            let right = root.right;
            root.right = left;
            root.left = nil;
            while (left.right != nil) {
                left = left.right!;
            }
            left.right = right;
        } else if (l) {
            root.right = root.left;
            root.left = nil;
        }
    }
}



class Solution114x2 {
    func flatten(_ root: TreeNode?) {
        if root == nil {
            return
        } else {
            flatten(root!.left)
            flatten(root!.right)
            if var node = root!.left {
                while node.right != nil {
                    node.left = nil
                    node = node.right!
                }
                node.right = root!.right
                root!.right = root!.left
                root!.left = nil
            }
        }
    }
}



class Solution114x3 {
    var pre : TreeNode?
    func flatten(_ root: TreeNode?) {
        if root == nil{
            return
        }
        flatten(root?.right)
        flatten(root?.left)
        root?.right = pre
        root?.left = nil
        pre = root
    }
}
