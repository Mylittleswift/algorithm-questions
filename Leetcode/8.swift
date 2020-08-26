/***
 8. String to Integer (atoi)
 Medium

 Implement atoi which converts a string to an integer.
 
 The function first discards as many whitespace characters as necessary until the first non-whitespace character is found. Then, starting from this character, takes an optional initial plus or minus sign followed by as many numerical digits as possible, and interprets them as a numerical value.
 
 The string can contain additional characters after those that form the integral number, which are ignored and have no effect on the behavior of this function.
 
 If the first sequence of non-whitespace characters in str is not a valid integral number, or if no such sequence exists because either str is empty or it contains only whitespace characters, no conversion is performed.
 
 If no valid conversion could be performed, a zero value is returned.
 
 Note:
 
 Only the space character ' ' is considered as whitespace character.
 Assume we are dealing with an environment which could only store integers within the 32-bit signed integer range: [−231,  231 − 1]. If the numerical value is out of the range of representable values, INT_MAX (231 − 1) or INT_MIN (−231) is returned.
 Example 1:
 
 Input: "42"
 Output: 42
 Example 2:
 
 Input: "   -42"
 Output: -42
 Explanation: The first non-whitespace character is '-', which is the minus sign.
 Then take as many numerical digits as possible, which gets 42.
 Example 3:
 
 Input: "4193 with words"
 Output: 4193
 Explanation: Conversion stops at digit '3' as the next character is not a numerical digit.
 Example 4:
 
 Input: "words and 987"
 Output: 0
 Explanation: The first non-whitespace character is 'w', which is not a numerical
 digit or a +/- sign. Therefore no valid conversion could be performed.
 Example 5:
 
 Input: "-91283472332"
 Output: -2147483648
 Explanation: The number "-91283472332" is out of the range of a 32-bit signed integer.
 Thefore INT_MIN (−231) is returned.
 ***/


class Solution8x1 {
    func myAtoi(_ str: String) -> Int {
        let stringLength = str.count
        var index = 0
        var result = 0
        let base = 10
        var sign: Int? = nil // 1 if positive, -1 if negative, nil if not determined
        var integralPartStarted = false
        
        while index < stringLength {
            let character = str[str.index(str.startIndex, offsetBy: index)]
            let isWhitespaceCharacter = self.isWhitespace(character)
            let isNumericCharacter = self.isNumeric(character)
            let numericValue = self.numericValue(character)
            index += 1
            if integralPartStarted == false {
                if isWhitespaceCharacter {
                    continue
                } else if let _sign = self.sign(character) {
                    sign = _sign
                    integralPartStarted = true
                    continue
                } else if isNumericCharacter {
                    sign = 1
                    integralPartStarted = true
                } else {
                    return 0
                }
            }
            
            if integralPartStarted {
                if let numericValue = numericValue {
                    let nextResult = result * base + numericValue
                    if nextResult > Int32.max {
                        return (sign ?? 1 > 0) ? Int(Int32.max) : Int(Int32.min)
                    } else {
                        result = nextResult
                    }
                } else {
                    return result * (sign ?? 1)
                }
            }
        }
        return result * (sign ?? 1)
    }
    
    func isNumeric(_ character: Character) -> Bool {
        return character >= "0" && character <= "9"
    }
    
    let unicodeScalar0 = UnicodeScalar("0").value
    
    // returns the numeric value of the character, returns nil if the character is not a valid numeric character
    func numericValue(_ character: Character) -> Int? {
        guard isNumeric(character) else {
            return nil
        }
        
        return Int(character.unicodeScalars.first!.value - unicodeScalar0)
    }
    
    func isWhitespace(_ character: Character) -> Bool {
        return character == " "
    }
    
    // returns -1 if negative, +1 if positive, nil if none
    func sign(_ character: Character) -> Int? {
        if character == "+" {
            return 1
        } else if character == "-" {
            return -1
        } else {
            return nil
        }
    }
}


class Solution8x2 {
    func myAtoi(_ str: String) -> Int {
        var result: Int64 = 0
        var sign: Int64 = 1
        var strArr = Array(str)
        strArr = stripLeading(chars: strArr, toRemove: " ")
        var n = strArr.count
        if (n == 0) {
            return 0
        }
        
        if (strArr[0] == Character("-")) {
            sign = -1
            strArr.remove(at: 0)
        } else if (strArr[0] == Character("+")) {
            sign = 1
            strArr.remove(at: 0)
        }
        strArr = stripLeading(chars: strArr, toRemove: "0")
        n = strArr.count
        if (n == 0) {
            return 0
        }
        for i in 0..<n {
            let lastDigit = convertToInt(strArr[i])
            if (lastDigit == -1) {
                return Int(sign*result)
            }
            result = result*10 + Int64(lastDigit)
            if !isWithinInt32Range(sign*result) {
                return sign > 0 ? Int(Int32.max) : Int(Int32.min)
            }
        }
        return Int(sign*result)
    }
    
    private func isWithinInt32Range(_ value: Int64) -> Bool {
        return value > 0 ? value < Int32.max : value > Int32.min
    }
    
    private func convertToInt(_ c: Character) -> Int {
        switch c {
        case "0": return 0
        case "1": return 1
        case "2": return 2
        case "3": return 3
        case "4": return 4
        case "5": return 5
        case "6": return 6
        case "7": return 7
        case "8": return 8
        case "9": return 9
        default: return -1
        }
    }
    
    private func stripWhiteSpace(_ chars: [Character]) -> [Character] {
        let n: Int = chars.count
        for i in 0..<n {
            if chars[i] != " " {
                return Array(chars[i...n-1])
            }
        }
        return []
    }
    
    private func stripLeading(chars: [Character], toRemove c: Character) -> [Character] {
        let n: Int = chars.count
        for i in 0..<n {
            if chars[i] != c {
                return Array(chars[i...n-1])
            }
        }
        return []
    }
}


class Solution8x3 {
    func myAtoi(_ str: String) -> Int {
        if str.isEmpty {
            return 0
        }
        
        let ＋: Int8 = 43
        let －: Int8 = 45
        let ascii0: Int8 = 48
        let ascii9: Int8 = 57
        let space: Int8 = 32
        
        var sign: Int = 1
        
        var result: Int = 0
        
        let chars = str.utf8CString
        
        var i: Int = 0
        
        while chars[i] == space {
            i += 1
        }
        
        if chars[i] == ＋ || chars[i] == － {
            sign = chars[i] == － ? -1 : 1
            i += 1
        }
        
        while i < chars.count - 1, ascii0...ascii9 ~= chars[i] {
            if result > Int32.max / 10 || (result == Int32.max / 10 && Int(chars[i] - ascii0) > 7) {
                return sign == 1 ? Int(Int32.max) : Int(Int32.min)
            }
            result = result * 10 +  Int(chars[i] - ascii0)
            i += 1
        }
        return result * sign
    }
}



class Solution8x4 {
    func myAtoi(_ str: String) -> Int {
        var result = 0
        let arr = Array(str)
        var sign = 1
        
        var i = 0
        while i < arr.count {
            if arr[i] != " " {
                break
            }
            i += 1
        }
        
        if i >= arr.count {
            return 0
        }
        
        if arr[i] == "-" {
            sign = -1
            i += 1
        } else if arr[i] == "+" {
            i += 1
        }
        
        while i < arr.count {
            let c = arr[i]
            switch c {
            case "0"..."9":
                result = result * 10 + Int(String(c))!
                if sign == 1 && result > Int32.max {
                    return Int(Int32.max)
                }
                if sign == -1 && (sign * result) < Int32.min {
                    return Int(Int32.min)
                }
            default:
                return sign * result
            }
            i += 1
        }
        return sign * result
    }
}


class Solution8x5 {
    func myAtoi(_ str: String) -> Int {
        let chars = str.map {String($0)}
        var first = true
        var minus = false
        var result = 0
        for char in chars {
            if first {
                if char == " " {
                    continue
                } else if char == "-" {
                    minus = true
                    first = false
                }  else if char == "+" {
                    first = false
                } else if let number = getNumber(char: char) {
                    result = number
                    first = false
                } else {
                    return 0
                }
            } else {
                if let number = getNumber(char: char) {
                    result = result * 10 + number
                    if result > Int32.max {
                        return minus ? Int(Int32.min) : Int(Int32.max)
                    }
                } else {
                    break
                }
            }
        }
        if minus {
            result = -result
        }
        return result
    }
    
    func getNumber(char: String) -> Int? {
        guard let number = Int(char) else {
            return nil
        }
        return number
    }
}



class Solution8x6 {
    func myAtoi(_ str: String) -> Int {
        var foundNumber = false
        var result: Int64 = 0
        var sign: Int64 = 1
        for char in str {
            if char == Character(" ") {
                if !foundNumber { continue } else { break }
            }
            if "-+".contains(char) {
                if foundNumber { break }
                if char == Character("-") {
                    sign = -1
                }
                foundNumber = true
                continue
            }
            guard let digit = Int64(String(char)) else { break }
            foundNumber = true
            result = result * 10 + digit
            if result * sign > Int32.max { return Int(Int32.max) }
            if result * sign < Int32.min { return Int(Int32.min) }
        }
        return Int(result * sign)
    }
}



class Solution8x7 {
    func myAtoi(_ str: String) -> Int {
        // var str = str.replacingOccurrences(of:" ", with: "")
        
        var minus = 1
        var num = 0
        var isFirstcharacter = false
        
        for ch in str {
            if isFirstcharacter == true && Int(String(ch)) == nil {
                return num
            }
            if ch == "-" {
                minus = -1
                isFirstcharacter = true
                continue
            }
            if ch == "+" {
                isFirstcharacter = true
                continue
            }
            if ch == " " {
                continue
            }
            if let value = Int(String(ch)) {
                isFirstcharacter = true
                num = num * 10 + (value * minus)
            } else {
                return num
            }
            if num > Int32.max {
                return Int(Int32.max)
            }
            if num < Int32.min {
                return Int(Int32.min)
            }
        }
        return num
    }
}



class Solution8x8 {
    func myAtoi(_ str: String) -> Int {
        let chars = [Character](str)
        
        var result = 0
        var sign = 0
        var isPrefix = true
        var index = 0
        for char in chars {
            // 1. 先判断字符串前面的空格
            if char == " " && isPrefix {
                continue
            }
            
            isPrefix = false
            
            // 2. 判断正负号
            if char == "+" || char == "-" {
                if sign != 0 || index != 0 {
                    break
                }
                sign = char == "+" ? 1 : -1
                continue
            }
            
            // 3. 判断合理的值
            if char >= "0" && char <= "9" {
                let charValue = Int(String(char))!
                
                // 3.1 大于最大值
                if sign >= 0 && result > ((Int(Int32.max) - charValue) / 10) {
                    return Int(Int32.max)
                }
                
                // 3.2 小于最小值
                if sign == -1 && -result < (Int(Int32.min) + charValue) / 10  {
                    return Int(Int32.min)
                }
                
                // 3.3 正常值
                result = result * 10 + charValue
            } else {
                break
            }
            index += 1
        }
        
        sign = sign == 0 ? 1 : sign
        
        return result * sign
    }
}
