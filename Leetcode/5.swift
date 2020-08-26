/***
 5. Longest Palindromic Substring
 Medium

 Given a string s, find the longest palindromic substring in s. You may assume that the maximum length of s is 1000.
 
 Example 1:
 
 Input: "babad"
 Output: "bab"
 Note: "aba" is also a valid answer.
 Example 2:
 
 Input: "cbbd"
 Output: "bb"
 ***/


class Solution5x1 {
    func longestPalindrome(_ s: String) -> String {
        guard s.count > 0 else{
            return ""
        }
        guard s.count > 1 else{
            return s
        }
        var str_arr: [Character] = ["#"]
        for ele in Array(s){
            str_arr.append(ele)
            str_arr.append("#")
        }
        // Array to record longest palindrome
        var result_arr = [Int](repeating: 0, count: str_arr.count)
        var center = 0, boundary = 0, maxLen = 0, result_center = 0
        
        //  首位的 "#" 不用管
        for i in 1..<str_arr.count-1{
            // calc mirror i = center-(i-center)
            let iMirror = 2 * center - i
            result_arr[i] = boundary > i ? min(boundary-i, result_arr[iMirror]) : 0
            // Attempt to expand palindrome centered at i
            while i-1-result_arr[i] >= 0 , i + 1 + result_arr[i] <= str_arr.count - 1, str_arr[i+1+result_arr[i]] == str_arr[i-1-result_arr[i]]{
                result_arr[i]+=1
            }
            // update center and boundary
            // 用来记录的
            if i + result_arr[i] > boundary{
                center = i
                boundary = i+result_arr[i]
            }
            // update result
            if result_arr[i] > maxLen{
                maxLen = result_arr[i]
                result_center = i
            }
        }
        let ans = String(s[s.s_index(offset: (result_center-maxLen)/2)..<s.s_index(offset: (result_center+maxLen)/2)])
        
        return ans
    }
}

extension String {
    func s_index(offset: Int) -> String.Index{
        return self.index(self.startIndex, offsetBy: offset)
    }
}



class Solution5x2 {
    func longestPalindrome(_ s: String) -> String {
        
        if s.count == 0 {
            return ""
        }
        
        if s.count == 1 {
            return s
        }
        
        // 字符串预处理
        var ss = [Character]()
        for c in s {
            ss.append("#")
            ss.append(c)
        }
        ss.append("#")
        
        var p = Array<Int>(repeating: 0, count: s.count * 2 + 1)
        var i = 1, mx = 0, center = 0, j = 0
        var maxCenter = 0
        while i < ss.count {
            // 说明以i为中心时，已有匹配的回文字符子串
            if mx - i > 0 {
                // i关于对称中心id的对称点
                j = 2 * center - i
                p[i] = min(p[j], mx - i)
            } else {
                p[i] = 1
            }
            if i - p[i] >= 0 && i + p[i] < ss.count {
                while ss[i - p[i]] == ss[i + p[i]] {
                    p[i] += 1
                    if i - p[i] < 0 || i + p[i] >= ss.count {
                        break
                    }
                }
            }
            if p[i] + i > mx {
                mx = p[i] + i
                center = i
            }
            if p[maxCenter] < p[i] {
                maxCenter = i
            }
            i += 1
        }
        let ret = ss[(maxCenter - p[maxCenter] + 1) ... (maxCenter + p[maxCenter] - 1)].filter { $0 != "#"}
        return String(ret)
    }
}



class Solution5x3 {
    func longestPalindrome(_ s: String) -> String {
        if s.count <= 1 {
            return s;
        }
        
        // 1.间隔之间先插入#
        var newString:String = "#";
        for character in s {
            newString.append(character);
            newString = newString + "#";
        }
        let characters = Array(newString);
        
        // 2.遍历找出以每个节点作为轴最长半径
        var maxId:Int = 0;
        var max:Int = 0;
        var ids:[Int] = [];
        ids.append(1);
        var maxLength:Int = 1;
        var maxLengthIndex = 0;
        
        for i in 1...characters.count - 1 {
            let j:Int = maxId - (i - maxId);
            if max > i && j >= 0 {
                ids.append(min(ids[j], max - i));
            }else{
                ids.append(1);
            }
            while i + ids[i] <= characters.count - 1 && i - ids[i] >= 0 && characters[i + ids[i]] == characters[i - ids[i]]{
                ids[i] += 1;
            }
            
            if i + ids[i] - 1 > max {
                maxId = i;
                max = i + ids[i] - 1;
            }
            
            if ids[i] > maxLength{
                maxLength = ids[i];
                maxLengthIndex = i;
            }
        }
        let leftIndex = s.index(s.startIndex, offsetBy: (maxLengthIndex - (maxLength - 1))/2);
        let rightIndex = s.index(leftIndex, offsetBy:maxLength - 1 - 1);
        return String(s[leftIndex...rightIndex]);
    }
}



class Solution5x4 {
    func longestPalindrome(_ s: String) -> String {
        let count = s.count
        if  count < 2{
            return s
        }
        
        var charArr = [Character]()
        for char in s {
            charArr.append(char)
        }
        
        var start = 0
        var end = 0
        for i in 0..<count {
            var left = i
            var right = i
            
            while left >= 0 && right < count && charArr[left] == charArr[right] {
                left -= 1
                right += 1
            }
            let len1 = right - left - 1;
            left = i
            right = i + 1
            while left >= 0 && right < count && charArr[left] == charArr[right] {
                left -= 1
                right += 1
            }
            let len2 = right - left - 1;
            let len = max(len1,len2)
            if len > end - start {
                start = i - (len - 1) / 2
                end = i + len / 2
            }
        }
        if start == end {
            return String(s[s.startIndex])
        }
        
        return String(s[s.index(s.startIndex, offsetBy: start)...s.index(s.startIndex, offsetBy: end)]);
    }
}



class Solution5x5 {
    func longestPalindrome(_ s: String) -> String {
        guard s.count > 0 else {
            return ""
        }
        var s = Array(s)
        var maxLength = 0, curLength = 0
        var minLeft = 0, maxRight = 0
        var i = 0
        let count = s.count
        while i < count {
            var left = i, right = i
            while left - 1 >= 0 && s[left - 1] == s[i] {
                left -= 1
            }
            
            while right + 1 < count && s[right + 1] == s[i] {
                right += 1
            }
            
            while left - 1 >= 0 && right + 1 < count && s[left - 1] == s[right + 1] {
                left -= 1
                right += 1
            }
            curLength = right - left + 1
            if curLength > maxLength {
                maxLength = curLength
                minLeft = left
                maxRight = right
            }
            i += 1
        }
        
        var result = ""
        for j in minLeft...maxRight {
            result += String(s[j])
        }
        
        return result
    }
}



class Solution5x6 {
    func longestPalindrome(_ s: String) -> String {
        // Base case
        guard s.count > 0 else { return "" }
        
        // Convert String to Array for simplicity of use
        let chars = Array(s)
        
        var start = 0, end = 0
        
        // Loop through
        for i in 0..<chars.count {
            let length = chars.expandFromCenter(i, i)
            let length2 = chars.expandFromCenter(i, i + 1)
            
            let resultedMax = max(length, length2)
            
            if resultedMax > (end - start) {
                start = i - (resultedMax - 1)/2
                end = i + resultedMax/2
            }
        }
        
        let result = String(chars[start...end])

        // Return string
        return result
    }
}

extension Array where Array.Element: Equatable {
    func expandFromCenter(_ lhs: Int, _ rhs: Int) -> Int {
        var left = lhs, right = rhs
        while left >= 0, right < count, self[left] == self[right] {
            left -= 1
            right += 1
        }
        return right - left - 1
    }
}



class Solution5x8 {
    func longestPalindrome(_ s: String) -> String {
        let count = s.count
        if  count < 2{
            return s
        }
        
        var charArr = [Character]()
        for char in s {
            charArr.append(char)
        }
        
        var start = 0
        var end = 0
        for i in 0..<count {
            var left = i
            var right = i
            
            while left >= 0 && right < count && charArr[left] == charArr[right] {
                left -= 1
                right += 1
            }
            let len1 = right - left - 1;
            left = i
            right = i + 1
            while left >= 0 && right < count && charArr[left] == charArr[right] {
                left -= 1
                right += 1
            }
            let len2 = right - left - 1;
            let len = max(len1,len2)
            if len > end - start {
                start = i - (len - 1) / 2
                end = i + len / 2
            }
        }
        if start == end {
            return String(s[s.startIndex])
        }
        
        return String(s[s.index(s.startIndex, offsetBy: start)...s.index(s.startIndex, offsetBy: end)]);
    }
}
