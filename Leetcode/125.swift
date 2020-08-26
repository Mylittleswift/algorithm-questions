/***
 125. Valid Palindrome
 Easy
 
 1102
 
 2782
 
 Add to List
 
 Share
 Given a string, determine if it is a palindrome, considering only alphanumeric characters and ignoring cases.
 
 Note: For the purpose of this problem, we define empty string as valid palindrome.
 
 Example 1:
 
 Input: "A man, a plan, a canal: Panama"
 Output: true
 Example 2:
 
 Input: "race a car"
 Output: false
 ***/



class Solution125x1 {
    func isPalindrome(_ s: String) -> Bool {
        
        let lowerS = s.lowercased()
        var ints = [UInt32]()
        for scalars in lowerS.unicodeScalars {
            ints.append(scalars.value)
        }
        var i = 0
        var j = ints.count - 1
        
        while i < j {
            if !isCharOrNumber(ints[i]) {
                i += 1
            }else if !isCharOrNumber(ints[j]) {
                j -= 1
            }else if ints[i] != ints[j] {
                return false
            }else {
                i += 1
                j -= 1
            }
        }
        return true
        
    }
    
    func isCharOrNumber(_ character: UInt32) -> Bool {
        if character >= 97 && character <= 122 {
            return true
        }
        
        if character >= 48 && character <= 57 {
            return true
        }
        return false
    }
}


class Solution125x2 {
    func isPalindrome(_ s: String) -> Bool {
        if s.count == 0 {
            return true
        }
        
        var chas = s.cString(using:.ascii)!
        
        var left = 0
        var right = s.count - 1
        
        var loop = true
        
        while loop {
            if left > right {
                loop = false
                continue
            }
            
            let leftChar = chas[left]
            
            if !checkIsNormalChar(leftChar) {
                left = left + 1
                continue
            }
            
            let rightChar = chas[right]
            
            if !checkIsNormalChar(rightChar) {
                right = right - 1
                continue
            }
            
            if isEqual(leftChar,rightChar) {
                left = left + 1
                right = right - 1
            } else {
                return false
            }
            
        }
        return true
    }
    
    func isEqual(_ c:CChar, _ other:CChar) -> Bool {
        if c == other {
            return true
        }
        var newC = c
        if c >= 97 {
            newC = c - 32;
        }
        
        var newOther = other
        
        if other >= 97 {
            newOther = other - 32
        }
        
        return newC == newOther
    }
    
    func checkIsNormalChar(_ c: CChar) -> Bool {
        if c < 48 {
            return false
        }
        
        if c > 122 {
            return false
        }
        
        if c > 57 && c < 65 {
            return false
        }
        
        if c > 90 && c < 97 {
            return false
        }
        
        return true
    }
}
