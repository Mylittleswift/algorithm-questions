/***
 38. Count and Say
 Easy

 The count-and-say sequence is the sequence of integers with the first five terms as following:
 
 1.     1
 2.     11
 3.     21
 4.     1211
 5.     111221
 1 is read off as "one 1" or 11.
 11 is read off as "two 1s" or 21.
 21 is read off as "one 2, then one 1" or 1211.
 
 Given an integer n where 1 ≤ n ≤ 30, generate the nth term of the count-and-say sequence. You can do so recursively, in other words from the previous member read off the digits, counting the number of digits in groups of the same digit.
 
 Note: Each term of the sequence of integers will be represented as a string.
 
 
 
 Example 1:
 
 Input: 1
 Output: "1"
 Explanation: This is the base case.
 Example 2:
 
 Input: 4
 Output: "1211"
 Explanation: For n = 3 the term was "21" in which we have two groups "2" and "1", "2" can be read as "12" which means frequency = 1 and value = 2, the same way "1" is read as "11", so the answer is the concatenation of "12" and "11" which is "1211".
 ***/


class Solution38x1 {
    func countAndSay(_ n: Int) -> String {
        var num = "1"
        if n == 1 {
            return "1"
        }
        for _ in 1..<n {
            var newStr = String()
            let arrayOfStr = Array(num)
            var count = 1
            for i in 0..<arrayOfStr.count {
                if i == arrayOfStr.count - 1 {
                    newStr += "\(count)\(arrayOfStr[i])"
                } else {
                    if arrayOfStr[i] == arrayOfStr[i + 1] {
                        count += 1
                    } else {
                        newStr += "\(count)\(arrayOfStr[i])"
                        count = 1
                    }
                }
            }
            num = newStr
        }
        return num
    }
}


class Solution38x2 {
    func countAndSay(_ n: Int) -> String {
        if (n == 1 || n > 30){
            return "1"
        }
        var resultString:String = ""
        let ReadStr = countAndSay(n-1)
        var characterArray = [Character](ReadStr)
        var repeatTime = 1
        for i in 0..<characterArray.count {
            if i == 0 {
                if characterArray.count == 1 {
                    resultString.append(String(repeatTime) + String(characterArray[i]))
                    repeatTime = 1
                }
                continue
            }
            if characterArray[i] == characterArray[i - 1] {
                repeatTime = repeatTime + 1
            } else {
                resultString.append(String(repeatTime) + String(characterArray[i - 1]))
                repeatTime = 1
            }
            
            if i == characterArray.count - 1 {
                resultString.append(String(repeatTime) + String(characterArray[i]))
            }
        }
        return resultString
    }
}


class Solution38x3 {
    func countAndSay(_ n: Int) -> String {
        guard n > 0 else{
            return ""
        }
        
        var result = "1"
        for _ in 1..<n{
            let resultCharArray = [Character](result)
            var count = 1
            var current = ""
            for i in 1..<resultCharArray.count{
                if resultCharArray[i] == resultCharArray[i - 1]{
                    count += 1
                }else{
                    current.append("\(count)")
                    current.append(resultCharArray[i - 1])
                    count = 1
                }
            }
            current.append(count == 0 ? "" : "\(count)")
            current.append(resultCharArray.last!)
            result = current
        }
        return result
    }
}


class Solution38x4 {
    func countAndSay(input: String) -> String {
        var lastChar: Character?
        var count = 0
        var result: String = ""
        
        input.forEach { (char) in
            if let myLastChar = lastChar {
                if char != myLastChar {
                    result = result + String(count) + String(myLastChar)
                    lastChar = char
                    count = 1
                } else {
                    count += 1
                }
            } else {
                lastChar = char
                count = 1
            }
        }
        
        if let lastChar = lastChar {
            result = result + String(count) + String(lastChar)
        }
        
        return result
    }
    
    func countAndSay(_ n: Int) -> String {
        var result = "1"
        (1..<n).forEach { (_) in
            result = countAndSay(input: result)
        }
        
        return result
    }
}


class Solution38x5 {
    func countAndSay(_ n: Int) -> String {
        var resultArray:[Int] = [1]
        var tempArray:[Int] = []
        var result = ""
        for _ in 0..<(n - 1) {
            var count = 0   //重复数字的计数
            var number = -1
            var index = 0
            let length = resultArray.count
            while index < length {
                number = resultArray[index]
                for j in index..<length {
                    if resultArray[j] == number {
                        count += 1
                        continue
                    }
                    break
                }
                tempArray.append(count)
                tempArray.append(number)
                index = index + count
                count = 0
            }
            resultArray = tempArray
            tempArray.removeAll()
        }
        for i in resultArray {
            result = result + "\(i)"
        }
        return result
    }
}


/*
 理解题意：
 n=1时输出字符串1；
 n=2时，数上次字符串中的数值个数，因为上次字符串有1个1，所以输出11；
 n=3时，由于上次字符是11，有2个1，所以输出21；
 n=4时，由于上次字符串是21，有1个2和1个1，所以输出1211。
 依次类推
 */

class Solution38x6 {
    func say(_ say: String) -> String {
        
        var chars = Array(say)
        var count = 1
        var tmpSay = ""
        
        for i in 0..<chars.count {
            if i < chars.count - 1 && chars[i] == chars[i+1]{
                count = count + 1
            }else{
                tmpSay.append("\(count)")
                tmpSay.append("\(chars[i])")
                count = 1
            }
        }
        return tmpSay
    }
    func countAndSay(_ n: Int) -> String {
        if n == 1 {
            return "1"
        }
        var sayStr = countAndSay(1)
        
        for _ in 1..<n {
            sayStr = say(sayStr)
        }
        
        return sayStr
    }
}
