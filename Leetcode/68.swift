/***
 68. Text Justification
 Hard

 Given an array of words and a width maxWidth, format the text such that each line has exactly maxWidth characters and is fully (left and right) justified.
 
 You should pack your words in a greedy approach; that is, pack as many words as you can in each line. Pad extra spaces ' ' when necessary so that each line has exactly maxWidth characters.
 
 Extra spaces between words should be distributed as evenly as possible. If the number of spaces on a line do not divide evenly between words, the empty slots on the left will be assigned more spaces than the slots on the right.
 
 For the last line of text, it should be left justified and no extra space is inserted between words.
 
 Note:
 
 A word is defined as a character sequence consisting of non-space characters only.
 Each word's length is guaranteed to be greater than 0 and not exceed maxWidth.
 The input array words contains at least one word.
 Example 1:
 
 Input:
 words = ["This", "is", "an", "example", "of", "text", "justification."]
 maxWidth = 16
 Output:
 [
 "This    is    an",
 "example  of text",
 "justification.  "
 ]
 Example 2:
 
 Input:
 words = ["What","must","be","acknowledgment","shall","be"]
 maxWidth = 16
 Output:
 [
 "What   must   be",
 "acknowledgment  ",
 "shall be        "
 ]
 Explanation: Note that the last line is "shall be    " instead of "shall     be",
 because the last line must be left-justified instead of fully-justified.
 Note that the second line is also left-justified becase it contains only one word.
 Example 3:
 
 Input:
 words = ["Science","is","what","we","understand","well","enough","to","explain",
 "to","a","computer.","Art","is","everything","else","we","do"]
 maxWidth = 20
 Output:
 [
 "Science  is  what we",
 "understand      well",
 "enough to explain to",
 "a  computer.  Art is",
 "everything  else  we",
 "do                  "
 ]
 ***/



class Solution68x1 {
    func fullJustify(_ words: [String], _ maxWidth: Int) -> [String] {
        var res:[String] = [String]()
        var i:Int = 0
        while(i < words.count)
        {
            var j:Int = i
            var len:Int = 0
            while(j < words.count && (len+words[j].count + j - i ) <= maxWidth)
            {
                len += words[j].count
                j += 1
            }
            var out:String = String()
            var space:Int = maxWidth - len
            for k in i..<j
            {
                out += words[k]
                if space>0
                {
                    var t:Int = 0
                    if j == words.count
                    {
                        if j - k == 1
                        {
                            t = space
                        }
                        else
                        {
                            t = 1
                        }
                    }
                        //no last row
                    else
                    {
                        //last word
                        if j - k - 1 > 0
                        {
                            if space % (j - k - 1) == 0
                            {
                                t = space / (j - k - 1)
                            }
                            else
                            {
                                t = space / (j - k - 1) + 1
                            }
                        }
                        else
                        {
                            t = space
                        }
                    }
                    space -= t
                    out += String(repeating:" ",count:t)
                }
            }
            res.append(out)
            i = j
        }
        return res
    }
}


class Solution68x2 {
    func fullJustify(_ words: [String], _ maxWidth: Int) -> [String] {
        var result = [String]()
        
        var currentLine = [String]()
        var currentCount = 0
        var currentWordCount = 0
        
        for word in words {
            
            let wordCount = word.count
            
            if maxWidth - currentCount - currentWordCount >= wordCount {
                currentLine.append(word)
                currentCount += wordCount
                currentWordCount += 1
            } else {
                let lineText = makeLine(currentLine, currentCount, currentWordCount, maxWidth)
                
                result.append(lineText)
                
                currentLine = [word]
                currentCount = wordCount
                currentWordCount = 1
            }
        }
        
        if currentWordCount > 0 {
            result.append(makeLine([currentLine.joined(separator: " ")], currentCount + currentWordCount - 1, 1, maxWidth))
        }
        
        return result
    }
    
    private func makeLine(_ line: [String], _ currentCount: Int, _ currentWordCount: Int, _ maxWidth: Int) -> String {
        
        var currentLine = line
        
        let spaceNeeded = maxWidth - currentCount
        
        if currentWordCount == 1, let text = currentLine.first {
            return text + String(repeating: " ", count: spaceNeeded)
        }
        
        let spotOpen = currentLine.count - 1
        
        let spaceToAdd = spaceNeeded / spotOpen
        var extraSpaceToAdd = spaceNeeded % spotOpen
        
        for i in 0..<extraSpaceToAdd {
            currentLine[i] += " "
        }
        
        return currentLine.joined(separator: String(repeating: " ", count: spaceToAdd))
    }
}


class Solution68x3 {
    var line: [String] = []
    
    func fullJustify(_ words: [String], _ maxWidth: Int) -> [String] {
        var words = words
        var result = [String]()
        
        while !words.isEmpty {
            line = []
            
            while let w = words.first, w.count + length() + line.count <= maxWidth {
                line.append(words.removeFirst())
            }
            
            var linestring = line.removeFirst()
            
            while !line.isEmpty {
                
                let spacer = words.isEmpty ? 1 : (maxWidth - linestring.count - length() + line.count - 1) / line.count
                linestring += String(repeating: " ", count: spacer) + line.removeFirst()
            }
            
            linestring += String(repeating: " ", count: max(0, maxWidth - linestring.count))
            result.append(linestring)
        }
        return result
    }
    
    func length() -> Int {
        return line.reduce(0) {$0 + $1.count}
    }
}
