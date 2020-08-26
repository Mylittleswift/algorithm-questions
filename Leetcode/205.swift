/***
 205. Isomorphic Strings
 Easy

 Given two strings s and t, determine if they are isomorphic.
 
 Two strings are isomorphic if the characters in s can be replaced to get t.
 
 All occurrences of a character must be replaced with another character while preserving the order of characters. No two characters may map to the same character but a character may map to itself.
 
 Example 1:
 
 Input: s = "egg", t = "add"
 Output: true
 Example 2:
 
 Input: s = "foo", t = "bar"
 Output: false
 Example 3:
 
 Input: s = "paper", t = "title"
 Output: true
 Note:
 You may assume both s and t have the same length.
 ***/



class Solution205x1 {
    func isIsomorphic(_ s: String, _ t: String) -> Bool {
        let s = Array(s)
        let t = Array(t)
        
        var dict: [Character: Character] = [:]
        
        for i in 0..<s.count {
            if let cache = dict[s[i]] {
                if cache != t[i] {
                    return false
                }
            } else if dict.values.contains(t[i]) {
                return false
            } else {
                dict[s[i]] = t[i]
            }
        }
        
        return true
    }
}


class Solution205x2 {
    func isIsomorphic(_ s: String, _ t: String) -> Bool {
        let s = Array(s)
        let t = Array(t)
        if s.count != t.count { return false }
        
        var isoMap1 = [Character:Character]()
        var isoMap2 = [Character:Character]()
        
        var index = 0
        
        while index < s.count {
            
            let c1 = s[index]
            let c2 = t[index]
            
            if let saved = isoMap1[c1] {
                if saved != c2 {
                    return false
                }
            } else {
                isoMap1[c1] = c2
            }
            
            if let saved = isoMap2[c2] {
                if saved != c1 {
                    return false
                }
            } else {
                isoMap2[c2] = c1
            }
            index += 1
        }
        return true
    }
}


class Solution205x3 {
    func isIsomorphic(_ s: String, _ t: String) -> Bool {
        var m1 = [Int](repeating: 0, count: 256)
        var m2 = [Int](repeating: 0, count: 256)
        var s = Array(s)
        var t = Array(t)
        
        for i in 0..<s.count {
            let sAscii = Int(s[i].unicodeScalars.first?.value ?? 0)
            let tAscii = Int(t[i].unicodeScalars.first?.value ?? 0)
            if m1[sAscii] != m2[tAscii] {
                return false
            }
            m1[sAscii] = i + 1
            m2[tAscii] = i + 1
        }
        
        return true
    }
}


class Solution205x4 {
    func isIsomorphic(_ s: String, _ t: String) -> Bool {
        var s0 = Array(s)
        var t0 = Array(t)
        var dic = [Character : Character]()
        
        
        for i in 0..<s0.count {
            let s1 = s0[i]
            let t1 = t0[i]
            if let tmp = dic[s1]  {
                if tmp == t1 {
                    continue
                }else {
                    return false
                }
            }else {
                if dic.values.contains(t1) {
                    return false
                }
                dic[s1] = t1
            }
        }
        
        return true
    }
}
