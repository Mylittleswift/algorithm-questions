/***
 58. Length of Last Word
 Easy

 Given a string s consists of upper/lower-case alphabets and empty space characters ' ', return the length of last word (last word means the last appearing word if we loop from left to right) in the string.
 
 If the last word does not exist, return 0.
 
 Note: A word is defined as a maximal substring consisting of non-space characters only.
 
 Example:
 
 Input: "Hello World"
 Output: 5
 ***/


class Solution58x1 {
    func lengthOfLastWord(_ s: String) -> Int {
        var count = 0
        for c in s.reversed() {
            if count == 0 && c == " " {  continue }
            if c == " " {
                return count
            }
            count += 1
        }
        return count
    }
}


class Solution58x2 {
    func lengthOfLastWord(_ s: String) -> Int {
        
        var len = 0
        for str in s.reversed() {
            if str != " "{
                len += 1
            }
            if str == " " && len != 0 {
                break
            }
        }
        return len
    }
}


class Solution58x3 {
    func lengthOfLastWord(_ s: String) -> Int {
        let s = Array(s)
        var tail = s.count - 1
        var result = 0
        
        while tail >= 0 && s[tail] == " " {
            tail -= 1
        }
        
        while tail >= 0 && s[tail] != " " {
            tail -= 1
            result += 1
        }
        
        return result
    }
}


class Solution58x4 {
    func lengthOfLastWord(_ s: String) -> Int {
        if (s.isEmpty == false) {
            let fullNameArr = s.split{$0 == " "}.map(String.init)
            if (fullNameArr.isEmpty) {
                return 0
            }
            return fullNameArr[fullNameArr.count - 1].count
        }
        return 0
    }
}


class Solution58x5 {
    func lengthOfLastWord(_ s: String) -> Int {
        return s.split(separator: " ").last?.count ?? 0
    }
}


class Solution58x6 {
    func lengthOfLastWord(_ s: String) -> Int {
        var result: Int = 0
        let array: Array = s.components(separatedBy: "\(" ")")
        for index in stride(from:array.count-1, to:-1, by:-1) {
            if array[index].count > 0 {
                result = array[index].count
                break
            }
        }
        return result
    }
}
