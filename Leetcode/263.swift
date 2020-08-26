/***
 263. Ugly Number
 Easy

 Write a program to check whether a given number is an ugly number.
 
 Ugly numbers are positive numbers whose prime factors only include 2, 3, 5.
 
 Example 1:
 
 Input: 6
 Output: true
 Explanation: 6 = 2 × 3
 Example 2:
 
 Input: 8
 Output: true
 Explanation: 8 = 2 × 2 × 2
 Example 3:
 
 Input: 14
 Output: false
 Explanation: 14 is not ugly since it includes another prime factor 7.
 Note:
 
 1 is typically treated as an ugly number.
 Input is within the 32-bit signed integer range: [−231,  231 − 1].
 ***/



class Solution263x1 {
    func isUgly(_ num: Int) -> Bool {
        if num < 1 {return false}
        var number:Int = num
        while (number % 2 == 0)
        {
            number /= 2
        }
        while (number % 3 == 0)
        {
            number /= 3
        }
        while (number % 5 == 0)
        {
            number /= 5
        }
        return number == 1
    }
}


class Solution263x2 {
    func maxDiv(_ num: inout Int, _ div: Int) {
        while (num % div == 0) {
            num = num/div
        }
    }
    
    func isUgly(_ num: Int) -> Bool {
        if(num == 0) {
            return false
        }
        var no = num
        maxDiv(&no, 2)
        maxDiv(&no, 3)
        maxDiv(&no, 5)
        
        if(no == 1){
            return true
        }
        else {
            return false
        }
        
    }
}


class Solution236x3 {
    func isUgly(_ num: Int) -> Bool {
        guard num > 0 else {return false}
        var n = num
        
        let divs = [2, 3, 5]
        for d in divs {
            while n % d == 0 {
                n /= d
            }
        }
        return n == 1
    }
}
