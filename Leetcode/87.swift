/***
 87. Scramble String
 Hard

 Given a string s1, we may represent it as a binary tree by partitioning it to two non-empty substrings recursively.
 
 Below is one possible representation of s1 = "great":
 
 great
 /    \
 gr    eat
 / \    /  \
 g   r  e   at
 / \
 a   t
 To scramble the string, we may choose any non-leaf node and swap its two children.
 
 For example, if we choose the node "gr" and swap its two children, it produces a scrambled string "rgeat".
 
 rgeat
 /    \
 rg    eat
 / \    /  \
 r   g  e   at
 / \
 a   t
 We say that "rgeat" is a scrambled string of "great".
 
 Similarly, if we continue to swap the children of nodes "eat" and "at", it produces a scrambled string "rgtae".
 
 rgtae
 /    \
 rg    tae
 / \    /  \
 r   g  ta  e
 / \
 t   a
 We say that "rgtae" is a scrambled string of "great".
 
 Given two strings s1 and s2 of the same length, determine if s2 is a scrambled string of s1.
 
 Example 1:
 
 Input: s1 = "great", s2 = "rgeat"
 Output: true
 Example 2:
 
 Input: s1 = "abcde", s2 = "caebd"
 Output: false
 ***/



class Solution87x1 {
    func isScramble(_ s1: String, _ s2: String) -> Bool {
        if s1 == s2 {
            return true
        }
        
        var letters = [Int](repeating: 0, count: 26)
        
        for i in 0..<s1.count {
            let aASCII = Character("a").ascii
            letters[s1[i].ascii - aASCII] += 1
            letters[s2[i].ascii - aASCII] -= 1
        }
        for i in 0..<26 {
            if letters[i] != 0 {
                return false
            }
        }
        for i in 1..<s1.count {
            if isScramble(s1[0..<i], s2[0..<i]) &&
                isScramble(s1[i..<s1.count], s2[i..<s2.count]) {
                return true
            }
            if isScramble(s1[0..<i], s2[(s2.count - i)..<s2.count]) &&
                isScramble(s1[i..<s1.count], s2[0..<(s2.count - i)]) {
                return true
            }
        }
        
        return false
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
//
//extension Character {
//    var ascii: Int {
//        get {
//            let s = String(self).unicodeScalars
//            return Int(s[s.startIndex].value)
//        }
//    }
//
//    func isDigit() -> Bool {
//        return self >= "0" && self <= "9"
//    }
//}



class Solution87x2 {
    func isScramble(_ s1: String, _ s2: String) -> Bool {
        return isScramble_recursion(s1: s1, s2: s2)
    }
    
    func isScramble_recursion(s1: String?, s2: String?) -> Bool {
        if s1 == nil || s2 == nil || s1?.count != s2?.count {
            return false
        }
        if s1 == s2 {
            return true
        }
        if (s1?.sorted())! != (s2?.sorted())! {
            return false
        }
        let count: Int = (s1?.count)!
        for i in 1 ..< count {
            if isScramble_recursion(s1: s1![0..<i], s2: s2![0..<i]) && isScramble_recursion(s1: s1![i..<Int.max], s2: s2![i..<Int.max]) {
                return true
            }
            if isScramble_recursion(s1: s1![0..<i], s2: s2![(s2?.count)! - i..<Int.max]) && isScramble_recursion(s1: s1![i..<Int.max], s2: s2![0..<(s2?.count)! - i]) {
                return true
            }
        }
        return false
    }
    static func isScramble_iteration(s1: String?, s2: String?) -> Bool {
        if s1 == nil || s2 == nil || s1?.count != s2?.count {
            return false
        }
        let len = s1?.count
        var dp: Array<Array<Array<Bool>>> = Array<Array<Array<Bool>>>(repeating: Array<Array<Bool>>(repeating: Array<Bool>(repeating: false, count: 100), count: 100), count: 100)
        for i in (0...len! - 1).reversed() {
            for j in (0...len!-1).reversed() {
                dp[i][j][1] = (s1![i] == s2![j])
                var l = 2
                while i + l <= len! && j + l <= len! {
                    for n in 1 ..< l {
                        dp[i][j][l] = dp[i][j][l] || ( dp[i][j][n] && dp[i+n][j+n][l-n] )
                        dp[i][j][l] = dp[i][j][l] || ( dp[i][j+l-n][n] && dp[i+n][j][l-n] )
                    }
                    l += 1
                }
            }
        }
        return dp[0][0][len!]
    }
}
//private extension String {
//    subscript (range: Range<Int>) -> String {
//        guard let localEndIndex = self.index(self.startIndex, offsetBy: range.upperBound, limitedBy: self.endIndex) else {
//            return String(self[self.index(self.startIndex, offsetBy: range.lowerBound)..<self.endIndex])
//        }
//        return String(self[self.index(self.startIndex, offsetBy: range.lowerBound)..<localEndIndex])
//    }
//    subscript (index: Int) -> Character {
//        return self[self.index(self.startIndex, offsetBy: index)]
//    }
//}



