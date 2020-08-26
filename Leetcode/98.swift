/***
 98. Validate Binary Search Tree
 Medium

 Given a binary tree, determine if it is a valid binary search tree (BST).
 
 Assume a BST is defined as follows:
 
 The left subtree of a node contains only nodes with keys less than the node's key.
 The right subtree of a node contains only nodes with keys greater than the node's key.
 Both the left and right subtrees must also be binary search trees.
 
 
 Example 1:
 
 2
 / \
 1   3
 
 Input: [2,1,3]
 Output: true
 Example 2:
 
 5
 / \
 1   4
 / \
 3   6
 
 Input: [5,1,4,null,null,3,6]
 Output: false
 Explanation: The root node's value is 5 but its right child's value is 4.
 ***/


class Solution98x1 {
    func isInterleave(_ s1: String, _ s2: String, _ s3: String) -> Bool {
        var cache = [[Int]](repeating: [Int](repeating: -1, count: s2.count), count: s1.count)
        return is_Interleave(s1, 0, s2, 0, s3, 0, &cache)
    }
    
    fileprivate func is_Interleave(_ s1: String, _ i: Int, _ s2: String, _ j: Int, _ s3: String, _ k: Int, _ cache: inout [[Int]]) -> Bool {
        if i == s1.count {
            return s2[j..<s2.count] == s3[k..<s3.count]
        }
        if j == s2.count {
            return s1[i..<s1.count] == s3[k..<s3.count]
        }
        if cache[i][j] >= 0 {
            return cache[i][j] == 1 ? true : false
        }
        
        var ans = false
        
        if (s3[k] == s1[i] && is_Interleave(s1, i + 1, s2, j, s3, k + 1, &cache)) ||
            (s3[k] == s2[j] && is_Interleave(s1, i, s2, j + 1, s3, k + 1, &cache)) {
            ans = true
        }
        cache[i][j] = ans ? 1 : 0
        
        return ans
    }
}

//extension String {
//    subscript (i: Int) -> Character {
//        return self[index(startIndex, offsetBy: i)]
//    }
//
//    subscript(_ range: CountableRange<Int>) -> String {
//        let idx1 = index(startIndex, offsetBy: max(0, range.lowerBound))
//        let idx2 = index(startIndex, offsetBy: min(self.count, range.upperBound))
//        return String(self[idx1..<idx2])
//    }
//}


class Solution98x2 {
    func isInterleave(_ s1: String, _ s2: String, _ s3: String) -> Bool {
        if s1.count + s2.count != s3.count {
            return false
        }
        var dp: [[Bool]] = Array<Array<Bool>>(repeating: Array<Bool>(repeating: false, count: s2.count+1), count: s1.count+1)
        for i in 0 ..< s1.count + 1{
            for j in 0 ..< s2.count + 1{
                if i == 0 && j == 0 {
                    dp[0][0] = true
                } else if i == 0 {
                    dp[0][j] = dp[0][j-1] && (s2[j-1] == s3[j-1])
                } else if j == 0 {
                    dp[i][0] = dp[i-1][0] && (s1[i-1] == s3[i-1])
                } else {
                    dp[i][j] = (dp[i][j-1] && (s2[j-1] == s3[i+j-1])) || (dp[i-1][j] && (s1[i-1] == s3[i+j-1]))
                }
            }
        }
        return dp[s1.count][s2.count]
    }
}

//extension String {
//    subscript(index: Int) -> Character {
//        return self[self.index(self.startIndex, offsetBy: index)]
//    }
//}
