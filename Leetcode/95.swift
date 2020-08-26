/***
 95. Unique Binary Search Trees II
 Medium

 Given an integer n, generate all structurally unique BST's (binary search trees) that store values 1 ... n.
 
 Example:
 
 Input: 3
 Output:
 [
 [1,null,3,2],
 [3,2,null,1],
 [3,1,null,null,2],
 [2,1,3],
 [1,null,2,null,3]
 ]
 Explanation:
 The above output corresponds to the 5 unique BST's shown below:
 
 1         3     3      2      1
 \       /     /      / \      \
 3     2     1      1   3      2
 /     /       \                 \
 2     1         2                 3
 ***/




class Solution95x1 {
    func generateTrees(_ n: Int) -> [TreeNode?] {
        if n == 0{
            return [TreeNode?]()
        }
        
        return build(1, n)
    }
    
    func build(_ start : Int, _ end : Int) -> [TreeNode?]{
        var res = [TreeNode?]()
        if(start > end){
            res.append(nil)
            return res
        }
        if(start == end){
            var node = TreeNode(start)
            res.append(node)
            return res
        }
        
        for i in start...end {
            var left = build(start, i-1)
            var right = build(i+1, end)
            for leftNode in left{
                for rightNode in right{
                    var node = TreeNode(i)
                    node.left = leftNode
                    node.right = rightNode
                    res.append(node)
                }
            }
            
        }
        return res
    }
}



class Solution95x2 {
    func generateTrees(_ n: Int) -> [TreeNode?] {
        if n == 0 {return []}
        return genTrees(start: 1, end: n)
    }
    func genTrees (start: Int, end: Int) -> [TreeNode?] {
        var ret: [TreeNode?] = []
        if start > end {
            ret.append(nil)
            return ret
        } else if start == end {
            var node = TreeNode(start)
            ret.append(node)
            return ret
        }
        var left: [TreeNode?] = []
        var right: [TreeNode?] = []
        for i in start ... end {
            left = genTrees(start: start, end: i - 1)
            right = genTrees(start: i + 1, end: end)
            for left_node in left {
                for right_node in right {
                    let root = TreeNode(i)
                    root.left = left_node
                    root.right = right_node
                    ret.append(root)
                }
            }
        }
        return ret
    }
}



class Solution95x3 {
    func generateTrees(_ n: Int) -> [TreeNode?] {
        if n == 0 { return [TreeNode?]() }
        if n == 1 { return [TreeNode(1)] }
        var matrix = [[TreeNode?]]()
        matrix.append([nil])
        matrix.append([TreeNode(1)])
        
        func helper(array: [Int]) -> [TreeNode?] {
            if array.count == 0 {
                return [nil]
            } else if array.count == 1 {
                return [TreeNode(array[0])]
            } else {
                var result = [TreeNode?]()
                for i in 0 ..< array.count {
                    
                    var temp = i == 0 ? [Int]() : Array(array[0...i - 1])
                    let leftArray = helper(array: temp)
                    temp = i == array.count - 1 ? [Int]() : Array(array[i + 1...array.count - 1])
                    let rightArray = helper(array: temp)
                    for left in leftArray {
                        for right in rightArray {
                            let root = TreeNode(array[i])
                            root.left = left
                            root.right = right
                            result.append(root)
                        }
                    }
                    
                }
                return result
            }
        }
        
        return helper(array: Array(1 ... n))
    }
}
