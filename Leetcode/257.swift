/***
 257. Binary Tree Paths
 Easy

 Given a binary tree, return all root-to-leaf paths.
 
 Note: A leaf is a node with no children.
 
 Example:
 
 Input:
 
 1
 /   \
 2     3
 \
 5
 
 Output: ["1->2->5", "1->3"]
 
 Explanation: All root-to-leaf paths are: 1->2->5, 1->3
 ***/



class Solution257x1 {
    func binaryTreePaths(_ root: TreeNode?) -> [String] {
        var list:[String] = [String]()
        recuesive(root,&list,String())
        return list
    }
    func recuesive(_ root:TreeNode?,_ list:inout [String],_ str:String)
    {
        if root == nil {return}
        var strNew:String = str
        var strRoot:String = String(root!.val)
        if root?.left == nil && root?.right == nil
        {
            strNew = strNew + strRoot
            list.append(strNew)
            return
        }
        strRoot = strNew + strRoot + "->"
        recuesive(root?.left,&list,strRoot)
        recuesive(root?.right,&list,strRoot)
    }
}



class Solution257x2 {
    func binaryTreePaths(_ root: TreeNode?) -> [String] {
        guard let root = root else {
            return []
        }
        var result = [String]()
        binaryTreePathsDFS(root, "", &result)
        return result
    }
    
    func binaryTreePathsDFS(_ root: TreeNode, _ out: String, _ result: inout [String]) {
        if root.left == nil && root.right == nil {
            result.append(out + String(root.val))
        }
        
        if root.left != nil {
            binaryTreePathsDFS(root.left!, out + String(root.val) + "->", &result)
        }
        if root.right != nil {
            binaryTreePathsDFS(root.right!, out + String(root.val) + "->", &result)
        }
        
    }
}



class Solution257x3 {
    func binaryTreePaths(_ root: TreeNode?) -> [String] {
        var ans = [String]()
        binaryTreePaths(root, "", &ans)
        return ans
    }
    
    func binaryTreePaths(_ node: TreeNode?, _ path: String, _ ans: inout [String]) {
        guard let node = node else { return }
        
        let path = path + String(node.val)
        
        if node.left == nil && node.right == nil {
            ans.append(path)
            return
        }
        
        binaryTreePaths(node.left, path + "->", &ans)
        binaryTreePaths(node.right, path + "->", &ans)
    }
}
