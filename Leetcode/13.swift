/***
 13. Roman to Integer
 Easy

 Roman numerals are represented by seven different symbols: I, V, X, L, C, D and M.
 
 Symbol       Value
 I             1
 V             5
 X             10
 L             50
 C             100
 D             500
 M             1000
 For example, two is written as II in Roman numeral, just two one's added together. Twelve is written as, XII, which is simply X + II. The number twenty seven is written as XXVII, which is XX + V + II.
 
 Roman numerals are usually written largest to smallest from left to right. However, the numeral for four is not IIII. Instead, the number four is written as IV. Because the one is before the five we subtract it making four. The same principle applies to the number nine, which is written as IX. There are six instances where subtraction is used:
 
 I can be placed before V (5) and X (10) to make 4 and 9.
 X can be placed before L (50) and C (100) to make 40 and 90.
 C can be placed before D (500) and M (1000) to make 400 and 900.
 Given a roman numeral, convert it to an integer. Input is guaranteed to be within the range from 1 to 3999.
 ***/

class Solution13x1 {
    func romanToInt(_ s: String) -> Int {
        //用字典存对照表,单引号字符串查找使用双引号
        var map: [Character: Int] = ["I": 1, "V": 5, "X": 10, "L": 50, "C": 100, "D": 500, "M": 1000]
        //定义局部变量
        var ret: Int = 0
        //判断字符串是否为空
        if !s.isEmpty {
            //遍历字符串,indices属性可以访问字符串中各个字符的所有索引。
            for keys in s.indices {
                //注意判断keys的范围只能到倒数第二位
                if  keys < s.index(before: s.endIndex) && map[s[keys]]! < map[s[s.index(after: keys)]]! {
                    ret -= map[s[keys]]!
                } else {
                    ret += map[s[keys]]!
                }
            }
        }
        return ret
    }
}


class Solution13x2 {
    func romanToInt(_ s: String) -> Int {
        var result = 0
        let dict: [Character : Int] = ["I" : 1, "V" : 5, "X" : 10, "L" : 50, "C" : 100, "D" : 500, "M" : 1000]
        let temp = Array(s)
        for i in 0..<temp.count {
            if i >= 1, dict[temp[i]]! > dict[temp[i - 1]]! {
                result += dict[temp[i]]! - 2 * dict[temp[i - 1]]!
            } else {
                result += dict[temp[i]]!
            }
        }
        return result
    }
}


class Solution13x3 {
    func romanToInt(_ s: String) -> Int {
        var count = 0
        var index = s.startIndex
        while index != s.endIndex {
            let c = s[index]
            if c == "I" {
                if s.index(after: index) != s.endIndex && s[s.index(after: index)] == "V" {
                    count += 4
                    index = s.index(after: index)
                } else if s.index(after: index) != s.endIndex && s[s.index(after: index)] == "X" {
                    count += 9
                    index = s.index(after: index)
                } else {
                    count += 1
                }
                index = s.index(after: index)
            } else if c == "X" {
                if s.index(after: index) != s.endIndex && s[s.index(after: index)] == "L" {
                    count += 40
                    index = s.index(after: index)
                } else if s.index(after: index) != s.endIndex && s[s.index(after: index)] == "C" {
                    count += 90
                    index = s.index(after: index)
                } else {
                    count += 10
                }
                index = s.index(after: index)
            } else if c == "C" {
                if s.index(after: index) != s.endIndex && s[s.index(after: index)] == "D" {
                    count += 400
                    index = s.index(after: index)
                } else if s.index(after: index) != s.endIndex && s[s.index(after: index)] == "M" {
                    count += 900
                    index = s.index(after: index)
                } else {
                    count += 100
                }
                index = s.index(after: index)
            } else if c == "V" {
                count += 5
                index = s.index(after: index)
            } else if c == "L" {
                count += 50
                index = s.index(after: index)
            } else if c == "D" {
                count += 500
                index = s.index(after: index)
            } else if c == "M" {
                count += 1000
                index = s.index(after: index)
            }
        }
        return count
    }
}



