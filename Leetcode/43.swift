/***
 43. Multiply Strings
 Medium

 Given two non-negative integers num1 and num2 represented as strings, return the product of num1 and num2, also represented as a string.
 
 Example 1:
 
 Input: num1 = "2", num2 = "3"
 Output: "6"
 Example 2:
 
 Input: num1 = "123", num2 = "456"
 Output: "56088"
 Note:
 
 The length of both num1 and num2 is < 110.
 Both num1 and num2 contain only digits 0-9.
 Both num1 and num2 do not contain any leading zero, except the number 0 itself.
 You must not use any built-in BigInteger library or convert the inputs to integer directly.
 ***/


class Solution43x1 {
    func integerArray(text: String) -> [Int] {
        let characterArray = Array(text)
        var integerArray = [Int]()
        for character in characterArray {
            let unitScalar = character.unicodeScalars.first!.value - Unicode.Scalar("0").value
            integerArray.append(Int(unitScalar))
        }
        return integerArray
    }
    
    
    func multiply(_ num1: String, _ num2: String) -> String {
        if num1 == "0" || num2 == "0" {
            return "0"
        }
        let num1Array = integerArray(text: num1)
        let num2Array = integerArray(text: num2)
        let maxCount = num1Array.count + num2Array.count - 1
        var productArray = [Int](repeating: 0, count: maxCount)
        var i = 0
        for number1 in num1Array {
            var j = i
            for number2 in num2Array {
                productArray[j] += number1 * number2
                j += 1
            }
            i += 1
        }
        
        var characterArray = [Character]()
        let lastIndex = productArray.count - 1
        var carry = 0
        for k in 0...lastIndex {
            let l = lastIndex - k
            var value = productArray[l] + carry
            if value >= 10 {
                carry = value / 10
                value = value % 10
            } else {
                carry = 0
            }
            
            let character: Character = Character(String(value))
            characterArray.insert(character, at: 0)
        }
        if carry > 0 {
            let character: Character = Character(String(carry))
            characterArray.insert(character, at: 0)
        }
        
        return String(characterArray)
    }
}


class Solution43x2 {
    func multiply(_ num1: String, _ num2: String) -> String {
        if num1 == "0" || num2 == "0" {
            return "0"
        }
        
        var result = String()
        
        var num1Arr = Array(num1), num2Arr = Array(num2)
        let n1 = num1.count, n2 = num2.count
        var k = n1 + n2 - 2, carry = 0
        var v = [Int](repeating: 0, count: n1 + n2)
        let zeroValue = Int("0".unicodeScalars.first!.value)
        for i in 0..<n1 {
            for j in 0..<n2 {
                let num1Value = Int(num1Arr[i].unicodeScalars.first!.value)
                let num2Value = Int(num2Arr[j].unicodeScalars.first!.value)
                v[k - i - j] += (num1Value - zeroValue) * (num2Value - zeroValue)
            }
        }
        
        for i in 0..<n1 + n2 {
            v[i] += carry
            carry = v[i] / 10
            v[i] %= 10
        }
        var i = n1 + n2 - 1
        while v[i] == 0 {
            i -= 1
        }
        if i < 0 {
            return "0"
        }
        while i >= 0 {
            let c = Character(UnicodeScalar(zeroValue + v[i])!)
            result.append(String(c))
            i -= 1
        }
        
        return result
    }
}


class Solution43x4 {
    func multiply(_ num1: String, _ num2: String) -> String {
        let left = num1.map({ Int(String($0))! })
        let right = num2.map({ Int(String($0))! })
        let m = left.count
        let n = right.count
        var result = [Int](repeating: 0, count: m + n)
        
        for i in (0..<m).reversed() {
            for j in (0..<n).reversed() {
                let mul = left[i] * right[j]
                let pos1 = i + j
                let pos2 = i + j + 1
                let sum = mul + result[pos2]
                result[pos1] += sum / 10
                result[pos2] = sum % 10
            }
        }
        
        var answer = ""
        for i in result {
            if answer.count == 0 && i == 0 {
                continue
            }
            answer += "\(i)"
        }
        if answer.count == 0 {
            return "0"
        }
        return answer
    }
}


class Solution43x5 {
    
    private let charToInt : [Character : Int] =
        [
            "0" : 0, "1" : 1, "2" : 2, "3" : 3, "4" : 4,
            "5" : 5, "6" : 6, "7" : 7, "8" : 8, "9" : 9
    ]
    
    func multiply(_ num1: String, _ num2: String) -> String {
        let chars1 = Array(num1)
        let chars2 = Array(num2)
        let num1Count = num1.count - 1
        let num2Count = num2.count - 1
        var multiply = 0
        let size = num2.count + num1.count
        var result = [Int](repeating: 0, count: size)
        
        for i in stride(from: num1Count, to: -1, by: -1) {
            for j in stride(from: num2Count, to: -1, by: -1) {
                let n1 = i >= 0 ? charToInt[chars1[i]] : 0
                let n2 = j >= 0 ? charToInt[chars2[j]] : 0
                let pos1 = i+j+1
                let pos2 = i+j
                multiply = n1! * n2! + result[pos1]
                result[pos1] =  multiply%10
                result[pos2] = result[pos2] + (multiply/10)
            }
        }
        
        var resultString = ""
        var removeZero = false
        for num in result {
            if num != 0 {
                removeZero = true
            }
            if removeZero {
                resultString = resultString + String(num)
            }
        }
        if resultString == "" {
            return "0"
        }
        return resultString
    }
}
