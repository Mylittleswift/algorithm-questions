/***
 6. ZigZag Conversion
 Medium

 The string "PAYPALISHIRING" is written in a zigzag pattern on a given number of rows like this: (you may want to display this pattern in a fixed font for better legibility)
 
 P   A   H   N
 A P L S I I G
 Y   I   R
 And then read line by line: "PAHNAPLSIIGYIR"
 
 Write the code that will take a string and make this conversion given a number of rows:
 
 string convert(string s, int numRows);
 Example 1:
 
 Input: s = "PAYPALISHIRING", numRows = 3
 Output: "PAHNAPLSIIGYIR"
 Example 2:
 
 Input: s = "PAYPALISHIRING", numRows = 4
 Output: "PINALSIGYAHRPI"
 Explanation:
 
 P     I    N
 A   L S  I G
 Y A   H R
 P     I
 ***/


class Solution6x1 {
    func convert(_ s: String, _ numRows: Int) -> String {
        guard numRows > 1 else { return s }
        let characters = Array(s)
        let interval = 2 * (numRows - 1)
        var result = [Character]()
        var i = 0, offset = 0, pos = 0
        
        while offset < numRows {
            i = 0
            while true {
                pos = interval * i + offset
                guard pos < characters.count else { break }
                result.append(characters[pos])
                if offset > 0 && offset < numRows - 1 {
                    pos = interval * (i + 1) - offset
                    guard pos < characters.count else { break }
                    result.append(characters[pos])
                }
                i += 1
            }
            offset += 1
        }
        return String(result)
    }
}


class Solution6x2 {
    func convert(_ s: String, _ numRows: Int) -> String {
        if numRows == 1 {
            return s
        }
        var stringArray: Array<Character> = Array(s)
        var answerArray: Array<String> = Array(repeating: String(), count: numRows)
        var flag: Int = 0
        var currentRow: Int = 0
        var answer: String = String()
        for i in 0..<stringArray.count {
            if (flag + i) % numRows == 0 {
                flag += 1
            }
            answerArray[currentRow].append(stringArray[i])
            if flag % 2 == 0 {
                currentRow -= 1
            } else {
                currentRow += 1
            }
        }
        for str in answerArray {
            answer += str
        }
        return answer
    }
}


class Solution6x3 {
    func convert(_ s: String, _ numRows: Int) -> String {
        if numRows == 1 || numRows >= s.count {
            return s
        }
        var stringArray: Array<Character> = Array(s)
        var answerArray: Array<String> = Array(repeating: String(), count: numRows)
        var flag: Int = 0
        var currentRow: Int = 0
        var answer: String = String()
        for i in 0..<stringArray.count {
            if (flag + i) % numRows == 0 {
                flag += 1
            }
            answerArray[currentRow].append(stringArray[i])
            currentRow = currentRow + 2 * (flag % 2) - 1
        }
        for str in answerArray {
            answer += str
        }
        return answer
    }
}


class Solution6x4 {
    func convert(_ s: String, _ numRows: Int) -> String {
        guard numRows > 1 else {
            return s
        }
        var result = ""
        let arr = s.map {$0}
        let interval = (numRows - 1) * 2
        for rowIndex in 0..<numRows {
            for index in stride(from: rowIndex, to: arr.count, by: interval) {
                result.append(arr[index])
                if rowIndex > 0 && rowIndex < numRows - 1 {
                    let next = index + (interval - 2 * rowIndex)
                    if next < arr.count {
                        result.append(arr[next])
                    }
                }
            }
        }
        return result
    }
}


class Solution6x5 {
    func convert(_ s: String, _ numRows: Int) -> String {
        if numRows == 1 {
            return s
        }
        let chars = s.utf8CString
        var result = [CChar]()
        let count = chars.count - 1
        let cycle = 2 * numRows - 2
        for i in 0..<numRows {
            var j = 0
            while i + j < count {
                defer {
                    j += cycle
                }
                result.append(chars[i + j]);
                if i != 0 && i != numRows - 1 && j + cycle - i < count {
                    result.append(chars[j + cycle - i])
                }
            }
        }
        result.append(0)
        return String(cString: result)
    }
}


class Solution6x6 {
    func convert(_ s: String, _ numRows: Int) -> String {
        var chars = Array(s)
        var result = ""
        let groupCount = max(1, (numRows - 1) * 2)

        for r in 0..<numRows {
            var current = r
            var skip = (numRows - r - 1) * 2
            if skip == 0 {
                skip = groupCount
            }
            while current < chars.count {
                result.append(chars[current])
                current += skip
                skip = groupCount - skip
                if skip == 0 {
                    skip = groupCount
                }
            }
        }
        return result
    }
}
