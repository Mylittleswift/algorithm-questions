/***
 67. Add Binary
 Easy

 Given two binary strings, return their sum (also a binary string).
 
 The input strings are both non-empty and contains only characters 1 or 0.
 
 Example 1:
 
 Input: a = "11", b = "1"
 Output: "100"
 Example 2:
 
 Input: a = "1010", b = "1011"
 Output: "10101"
 
 
 Constraints:
 
 Each string consists only of '0' or '1' characters.
 1 <= a.length, b.length <= 10^4
 Each string is either "0" or doesn't contain any leading zero.
 ***/



class Solution67x1 {
    func addBinary(_ a: String, _ b: String) -> String {
        let charsA = Array(a)
        let charsB = Array(b)
        var ans = ""
        var m = charsA.count - 1
        var n = charsB.count - 1
        var carry = false
        while m >= 0 && n >= 0 {
            if charsA[m] == "1" && charsB[n] == "1" {
                if carry {
                    ans = "1" + ans
                } else {
                    ans = "0" + ans
                }
                carry = true
            } else if charsA[m] == "1" || charsB[n] == "1" {
                if carry {
                    ans = "0"  + ans
                    carry = true
                } else {
                    ans = "1" + ans
                    carry = false
                }
            } else {
                if carry {
                    ans = "1" + ans
                } else {
                    ans = "0" + ans
                }
                carry = false
            }
            m -= 1
            n -= 1
        }
        while m >= 0 {
            if charsA[m] == "1" {
                if carry {
                    ans = "0" + ans
                } else {
                    ans = "1" + ans
                }
            } else {
                if carry {
                    ans = "1" + ans
                } else {
                    ans = "0" + ans
                }
                carry = false
            }
            m = m - 1
        }
        while n >= 0 {
            if charsB[n] == "1" {
                if carry {
                    ans = "0" + ans
                } else {
                    ans = "1" + ans
                }
            } else {
                if carry {
                    ans = "1" + ans
                } else {
                    ans = "0" + ans
                }
                carry = false
            }
            n -= 1
        }
        if carry {
            ans = "1" + ans
        }
        return ans
    }
}


class Solution67x2 {
    func addBinary(_ a: String, _ b: String) -> String {
        var lhs: [Character] = a.reversed()
        var rhs: [Character] = b.reversed()
        // zero padding
        if lhs.count < rhs.count {
            lhs.append(contentsOf: String(repeating: "0", count: rhs.count - lhs.count))
        }
        else if rhs.count < lhs.count {
            rhs.append(contentsOf: String(repeating: "0", count: lhs.count - rhs.count))
        }
        // adding
        let len = lhs.count
        var step = 0
        var result = ""
        for i in 0..<len {
            switch (lhs[i], rhs[i], step) {
            case ("0", "0", 0):
                result.append("0")
                step = 0
            case ("0", "0", 1):
                fallthrough
            case ("0", "1", 0):
                fallthrough
            case ("1", "0", 0):
                result.append("1")
                step = 0
            case ("1", "1", 0):
                fallthrough
            case ("1", "0", 1):
                fallthrough
            case ("0", "1", 1):
                result.append("0")
                step = 1
            case ("1", "1", 1):
                result.append("1")
                step = 1
            default: fatalError()
            }
        }
        if step == 1 {
            result.append("1")
        }
        while result.last == "0" {
            result.removeLast()
        }
        if result == "" {
            result = "0"
        }
        return String(result.reversed())
    }
}


class Solution67x3 {
    func addBinary(_ a: String, _ b: String) -> String {
        var sum = 0, carry = 0, res = ""
        let aChars = Array(a), bChars = Array(b)
        var i = aChars.count - 1, j = bChars.count - 1
        
        while i >= 0 || j >= 0 || carry > 0 {
            sum = carry
            if i >= 0 {
                sum += Int(String(aChars[i]))!
                i -= 1
            }
            if j >= 0 {
                sum += Int(String(bChars[j]))!
                j -= 1
            }
            carry = sum / 2
            sum = sum % 2
            res = String(sum) + res
        }
        
        return res
    }
}


class Solution67x4 {
    //从最低位加到最高位，当前位相加结果是%2，进位是/2，
    //记得处理每一次的进位和最后一次的进位，最后反向输出字符。
    func addBinary(_ a: String, _ b: String) -> String {
        //存储字符的输出变量
        var str:String = String()
        //获取a的字符数量
        var i:Int = a.count-1
        //获取b的字符数量
        var j:Int = b.count-1
        //进位标志
        var carry:Int = 0
        while(i>=0 || j>=0)
        {
            var sum:Int = carry
            if i>=0
            {
                //获取该索引的字符
                var char:Character = a[a.index(a.startIndex, offsetBy: i)]
                //将字符转换成整数
                for code in char.unicodeScalars {
                    //字符 0 的ASCII码为48
                    sum += (Int(code.value) - 48)
                }
                //自减
                i-=1
            }
            if j>=0
            {
                //获取该索引的字符
                var char:Character = b[b.index(b.startIndex, offsetBy: j)]
                //将字符转换成整数
                for code in char.unicodeScalars {
                    //字符 0 的ASCII码为48
                    sum += (Int(code.value) - 48)
                }
                //自减
                j-=1
            }
            //转换为临时字符串
            var temp = String(sum % 2)
            //追加到字符串末尾
            str.append(temp[temp.startIndex])
            carry = sum/2
        }
        if carry != 0
        {
            //转换为临时字符串
            var  temp = String(carry)
            //追加到字符串末尾
            str.append(temp[temp.startIndex])
        }
        //返回逆序字符串
        return String(str.reversed())
    }
}


class Solution67x5 {
    func addBinary(_ a: String, _ b: String) -> String {
        var arr1 = [Int]()
        for c in a {
            arr1.append(Int(String.init(c))!)
        }
        var arr2 = [Int]()
        for c in b.unicodeScalars {
            arr2.append(Int(String.init(c))!)
        }
        if arr1.count > arr2.count {
            return addBinaryWithArr(arr1, short: arr2)
        }
        return addBinaryWithArr(arr2, short: arr1)
    }
    
    func addBinaryWithArr(_ long:[Int], short:[Int]) -> String {
        
        func toString(_ array:[Int]) -> String {
            var str = ""
            for num in array {
                str += "\(num)"
            }
            return str
        }
        
        var long = long
        var target = 0
        var initIndex = long.count - short.count
        var i = short.count-1
        while i >= 0 {
            let temp = long[initIndex + i] + short[i] + target
            if temp > 1 {
                /// 有进位
                long[initIndex + i] = temp - 2
                target = 1
            }else{
                /// 无进位
                long[initIndex + i] = temp
                target = 0
            }
            i -= 1
        }
        
        if target == 0 {
            return toString(long)
        }
        
        var j = initIndex - 1
        while j >= 0 {
            if long[j] == 0 {
                long[j] = 1
                return toString(long)
            }
            long[j] -= 1
            j -= 1
        }
        return "1" + toString(long)
    }
}
