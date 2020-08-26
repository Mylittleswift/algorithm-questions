/***
 107. Binary Tree Level Order Traversal II
 Easy

 Given a binary tree, return the bottom-up level order traversal of its nodes' values. (ie, from left to right, level by level from leaf to root).
 
 For example:
 Given binary tree [3,9,20,null,null,15,7],
 3
 / \
 9  20
 /  \
 15   7
 return its bottom-up level order traversal as:
 [
 [15,7],
 [9,20],
 [3]
 ]
 ***/



class Solution107x1 {
    func levelOrderBottom(_ root: TreeNode?) -> [[Int]] {
        //递归方法
        //当depth递归到上一层的个数，新建一个空层，继续往里面加数字。
        var res:[[Int]] =  [[Int]]()
        if root == nil {return res}
        var intList:[Int] = [Int]()
        levelOrder(root , 0 , &res)
        var temp:[Int] = [Int]()
        let num:Int = res.count-1
        //交换第一位和最后一位
        //交换第二位和倒数第二位......
        for i in 0...num
        {
            temp = res[i]
            res[i] = res[num-i]
            res[num-i] = temp
        }
        return res.reversed()
    }
    func levelOrder(_ root: TreeNode?, _ depth:Int,_ re: inout [[Int]] )
    {
        if root == nil {return}
        if (depth + 1) > re.count
        {
            re.append([Int]())
        }
        re[depth].append(root!.val)
        levelOrder(root!.left,depth+1,&re)
        levelOrder(root!.right,depth+1,&re)
    }
}




class Solution107x2 {
    func levelOrderBottom (_ root: TreeNode?) -> [[Int]] {
        var res = [[Int]]()
        checkValuesOnLevel(&res, node: root, level: 0)
        return res
    }
    
    func checkValuesOnLevel (_ res: inout [[Int]], node: TreeNode?, level: Int) {
        guard let node = node else { return }
        if level >= res.count {
            res.insert ([], at: 0)
        }
        checkValuesOnLevel(&res, node: node.left, level: level + 1)
        checkValuesOnLevel(&res, node: node.right, level: level + 1)
        res[res.count - level - 1].append(node.val)
    }
}



class Solution107x3 {
    func levelOrderBottom(_ root: TreeNode?) -> [[Int]] {
        if root == nil {
            return []
        }
        
        var result = [[Int]]()
        var queue = [TreeNode]()
        queue.append(root!)
        while !queue.isEmpty {
            var count = queue.count
            var temp = [Int]()
            while count != 0 {
                let node = queue.removeFirst()
                temp.append(node.val)
                if node.left != nil {
                    queue.append(node.left!)
                }
                if node.right != nil {
                    queue.append(node.right!)
                }
                count -= 1
            }
            result.append(temp)
        }
        
        return result.reversed()
    }
}
