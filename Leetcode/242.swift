/***
 242. Valid Anagram
 Easy

 Given two strings s and t , write a function to determine if t is an anagram of s.
 
 Example 1:
 
 Input: s = "anagram", t = "nagaram"
 Output: true
 Example 2:
 
 Input: s = "rat", t = "car"
 Output: false
 Note:
 You may assume the string contains only lowercase alphabets.
 
 Follow up:
 What if the inputs contain unicode characters? How would you adapt your solution to such case?
 ***/



class Solution242x1 {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        
        let chars_S = s.unicodeScalars
        var counter_S = Array(repeating: 0, count: 26)
        let chars_T = t.unicodeScalars
        var counter_T = Array(repeating: 0, count: 26)
        
        for char in chars_S {
            let index = Int(char.value - 97)
            counter_S[index] += 1
        }
        
        for char in chars_T {
            let index = Int(char.value - 97)
            counter_T[index] += 1
        }
        return counter_T == counter_S
    }
}


class Solution242x2 {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        guard s.count == t.count else {
            return false
        }
        var occurances = [Int](repeating: 0, count: 26)
        let aValue: UInt8 = 97
        for char in s.utf8 {
            occurances[Int(char - aValue)] += 1
        }
        for char in t.utf8 {
            occurances[Int(char - aValue)] -= 1
        }
        for value in occurances {
            if value != 0 {
                return false
            }
        }
        return true
    }
}


