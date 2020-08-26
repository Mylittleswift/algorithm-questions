/***
 113. Path Sum II
 Medium

 Given a binary tree and a sum, find all root-to-leaf paths where each path's sum equals the given sum.
 
 Note: A leaf is a node with no children.
 
 Example:
 
 Given the below binary tree and sum = 22,
 
 5
 / \
 4   8
 /   / \
 11  13  4
 /  \    / \
 7    2  5   1
 Return:
 
 [
 [5,4,11,2],
 [5,8,4,5]
 ]
 ***/




class Solution113x1 {
    func pathSum(_ root: TreeNode?, _ sum: Int) -> [[Int]] {
        var resArray =  [[Int]]()
        if root == nil {
            return resArray
        }
        
        if root?.left == nil && root?.right == nil {
            if root!.val == sum {
                let nodeArray = [Int](repeating:root!.val,count:1)
                resArray.append(nodeArray)
            }
            return resArray
        }
        
        var nodeArray =  [Int]()
        helper(root,sum,&resArray,&nodeArray)
        return resArray
    }
    
    func helper(_ root: TreeNode?, _ sum: Int, _ array: inout [[Int]], _ nodeArray: inout [Int]) {
        if root == nil {
            return
        }
        
        if root?.left == nil && root?.right == nil {
            if sum-root!.val == 0 {
                nodeArray.append(root!.val)
                array.append(nodeArray)
                nodeArray.remove(at:nodeArray.count-1)
            }
            return
        }
        
        nodeArray.append(root!.val)
        helper(root?.left,sum-root!.val,&array,&nodeArray)
        helper(root?.right,sum-root!.val,&array,&nodeArray)
        let index = nodeArray.count - 1
        nodeArray.remove(at:index)
    }
}



class Solution113x2 {
    func pathSum(_ root: TreeNode?, _ sum: Int) -> [[Int]] {
        var ans = [[Int]]()
        var combination = [Int]()
        pathSum(root, sum, &combination, &ans)
        return ans
    }
    
    func pathSum(_ node: TreeNode?, _ sum: Int, _ combination: inout [Int], _ ans: inout [[Int]]) {
        guard let node = node else { return }
        
        combination.append(node.val)
        
        if node.left == nil && node.right == nil && (sum - node.val) == 0 {
            ans.append(combination)
        }
        
        pathSum(node.left, sum - node.val, &combination, &ans)
        pathSum(node.right, sum - node.val, &combination, &ans)
        
        combination.removeLast()
    }
}



class Solution113x3 {
    func pathSum(_ root: TreeNode?, _ sum: Int) -> [[Int]] {
        if root == nil { return []}
        var result = [[Int]]()
        var currentRun = [Int]()
        checkSum(root, sum, &result, &currentRun)
        return result
        
    }
    func checkSum(_ root: TreeNode?, _ sum: Int,_ result: inout [[Int]],_ currentRun: inout [Int] ) {
        if root == nil { return }
        var current = currentRun
        current.append(root!.val)
        if sum - root!.val == 0 && root!.left == nil && root!.right == nil {
            result.append(current)
            return
        }
        checkSum(root!.left, sum - root!.val, &result, &current)
        checkSum(root!.right, sum - root!.val, &result, &current)
    }
}



class Solution113x4 {
    func pathSum(_ root: TreeNode?, _ sum: Int) -> [[Int]] {
        var paths: [[Int]] = []
        BFS(root, sum: sum, paths: &paths)
        return paths
    }
    
    func BFS(_ root: TreeNode?, sum: Int, paths: inout [[Int]], path: [Int]? = nil) {
        guard let root = root else { return }
        var path: [Int] = path ?? []
        path.append(root.val)
        if root.left == nil && root.right == nil {
            if sum == path.reduce(0) { $0 + $1 } {
                paths.append(path)
            }
            return
        }
        BFS(root.left, sum: sum, paths: &paths, path: path)
        BFS(root.right, sum: sum, paths: &paths, path: path)
    }
}
