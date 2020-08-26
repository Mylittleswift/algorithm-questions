/***
 7. Reverse Integer
 Easy
 
 Given a 32-bit signed integer, reverse digits of an integer.
 
 Example 1:
 
 Input: 123
 Output: 321
 Example 2:
 
 Input: -123
 Output: -321
 Example 3:
 
 Input: 120
 Output: 21
 Note:
 Assume we are dealing with an environment which could only store integers within the 32-bit signed integer range: [−231,  231 − 1]. For the purpose of this problem, assume that your function returns 0 when the reversed integer overflows.
 ***/


class Solution7x1 {
    func reverse(_ x: Int) -> Int {
        //x为常量，赋值为变量
        var num: Int = x
        var rev: Int = 0
        while num != 0 {
            let pop: Int = num % 10
            num /= 10
            if (rev > Int32.max/10) || (rev == Int32.max/10 && pop > 7) {return 0}
            if (rev < Int32.min/10) || (rev == Int32.min/10 && pop < -8) {return 0}
            rev = rev * 10 + pop
        }
        return rev
    }
}


class Solution7x2 {
    func reverse(_ x: Int) -> Int {
        guard x != 0  && abs(x) < Int32.max else {
            return 0
        }
        var result = 0
        var num = abs(x)
        while num > 0{
            let cursor = num % 10
            if cursor == 0 && result == 0{
                num /= 10
                continue
            }else{
                result = result * 10 + cursor
                num /= 10
            }
        }
        if result >= Int32.max {
            return 0
        }
        return (x > 0) ? result : -result
    }
}



class Solution7x3 {
    func reverse(_ x: Int) -> Int {
        let str = Array(String(x))
        var rev : [Character] = []
        for i in 0..<str.count {
            let index = str.count-i-1
            if (str[index] == "-") { continue }
            rev.append(str[index])
        }
        
        // if we can convert the reverse string to a 32bit Int ... else return 0
        if let result = Int32(String(rev)) {
            // signum == 1 or -1 if x is negative
            return Int(result) * x.signum()
        } else {
            return 0
        }
    }
}


class Solution7x4 {
    func reverse(_ x: Int) -> Int {
        let tmp = x < 0 ? -1 : 1
        let returnVal = Int(String(abs(x).description.reversed())) ?? 0
        if returnVal > Int(Int32.max) || returnVal < Int(Int32.min) {
            return 0
        }
        return returnVal * tmp
    }
}


class Solution7x5 {
    func reverse(_ x: Int) -> Int {
        var temp: Int = x
        var answer: UInt = 0
        var isNegative: Bool = false
        
        // Flip negatiave to positive
        if x < 0 {
            isNegative = true
            if x == Int.min {
                temp = (temp + 1) * -1
                temp += 1
            } else {
                temp *= -1
            }
        }
        
        // Reverse the numbers
        while temp > 0 {
            // Get last digit
            answer = (answer * 10) + (UInt(temp) % 10)
            
            // Remove last digit
            temp = temp / 10
        }
        
        print("answer: \(answer)")
        print("max: \(UInt(Int.max))")
        
        if answer > UInt(Int32.max) {
            return 0
        }
        
        if (isNegative) {
            return Int(answer) * -1
        } else {
            return Int(answer)
        }
    }
}
