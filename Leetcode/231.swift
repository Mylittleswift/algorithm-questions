/***
 231. Power of Two
 Easy

 Given an integer, write a function to determine if it is a power of two.
 
 Example 1:
 
 Input: 1
 Output: true
 Explanation: 20 = 1
 Example 2:
 
 Input: 16
 Output: true
 Explanation: 24 = 16
 Example 3:
 
 Input: 218
 Output: false
 ***/



class Solution231x1 {
    func isPowerOfTwo(_ n: Int) -> Bool {
        for i in 0..<32 {
            if n == 1 << i {
                return true
            }
        }
        
        return false
    }
}


class Solution231x2 {
    func isPowerOfTwo(_ n: Int) -> Bool {
        if n <= 0 { return false }
        if n == 1 { return true }
        var current = n
        while current > 2 {
            if current % 2 != 0 {
                return false
            } else {
                current = current / 2
            }
        }
        return true
    }
}


class Solution231x3 {
    func isPowerOfTwo(_ n: Int) -> Bool {
        guard n > 0 else { return false }
        return String(n, radix: 2).filter { $0 == "1" }.count == 1
    }
}


class Solution231x4 {
    func isPowerOfTwo(_ n: Int) -> Bool {
        if (n <= 0) {
            return false
        }
        var rencontre = false
        for digit in String(n, radix: 2) {
            if (digit == "1") {
                if rencontre {
                    return false
                } else {
                    rencontre = true
                }
            }
        }
        
        return true
    }
}
