/***
 3. Longest Substring Without Repeating Characters
 Medium
 
 Given a string, find the length of the longest substring without repeating characters.
 
 Example 1:
 
 Input: "abcabcbb"
 Output: 3
 Explanation: The answer is "abc", with the length of 3.
 Example 2:
 
 Input: "bbbbb"
 Output: 1
 Explanation: The answer is "b", with the length of 1.
 Example 3:
 
 Input: "pwwkew"
 Output: 3
 Explanation: The answer is "wke", with the length of 3.
 Note that the answer must be a substring, "pwke" is a subsequence and not a substring.
***/
 
 
class Solution3x1 {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var m = [Int](repeating: -1, count: 256)
        var res = 0, left = -1
        for i in 0..<s.count {
            let num = s[s.index(s.startIndex,offsetBy: i)].toInt()
            left = max(left, m[num])
            m[num] = i
            res = max(res, i - left)
        }
        return res
    }
}
//Character扩展方法
extension Character {
    func toInt() -> Int {
        var num:Int = Int()
        for scalar in String(self).unicodeScalars {
            num = Int(scalar.value)
        }
        return num
    }
}


class Solution3x2 {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        if s.count == 0 {
            return 0
        }
        
        let chars = Array(s.utf8)
        var left = 0
        var right = 1
        var result = right - left
        var i = 0
        //Interate in a incremental window
        while right < chars.count {
            i = left
            while i < right {
                //Check if a duplicate is found
                if chars[i] == chars[right] {
                    left = i + 1
                    break
                }
                i += 1
            }
            result = max(result, right - left + 1)
            right += 1
        }
        return result
    }
}


class Solution3x3 {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var arr = [Int](repeating: -1, count: 256)
        var s = Array(s)
        var currentLength = 0
        var maxLength = 0
        for i in 0..<s.count {
            let cValue = Int(s[i].unicodeScalars.first!.value)
            let preIndex = arr[cValue]
            if arr[cValue] == -1 || i - preIndex > currentLength {
                currentLength += 1
            } else {
                maxLength = max(currentLength, maxLength)
                currentLength = i - preIndex
            }
            arr[cValue] = i
        }
        maxLength = max(currentLength, maxLength)
        return maxLength
    }
}


class Solution3x4 {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        let charArr = Array(s)
        let len = s.count
        var ans = 0
        var index = Array.init(repeating: 0, count: 128)
        var j = 0
        for i in 0..<len {
            let char = charArr[i]
            if let v = char.unicodeScalars.first?.value {
                j = max(index[Int(v)], j)
                ans = max(ans, i - j + 1)
                index[Int(v)] = i + 1
            }
        }
        return ans
    }
}


