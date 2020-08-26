/***
 131. Palindrome Partitioning
 Medium

 Given a string s, partition s such that every substring of the partition is a palindrome.
 
 Return all possible palindrome partitioning of s.
 
 Example:
 
 Input: "aab"
 Output:
 [
 ["aa","b"],
 ["a","a","b"]
 ]
 ***/



class Solution131x1 {
    func partition(_ s: String) -> [[String]] {
        var result = [[String]]()
        var candidate = [String]()
        
        backtracking(&result, &candidate, Array(s), 0)
        
        return result
    }
    
    private func backtracking(_ result: inout [[String]], _ candidate: inout [String], _ characters: [Character], _ start: Int) {
        if start == characters.count {
            result.append(candidate)
        } else {
            for i in start..<characters.count {
                if isPalindrome(characters, start, i) {
                    let character = String(characters[start...i])
                    candidate.append(character)
                    backtracking(&result, &candidate, characters, i + 1)
                    candidate.removeLast()//clear every characters that fullfil requirement
                }
            }
        }
    }
    
    private func isPalindrome(_ characters: [Character], _ low: Int, _ high: Int) -> Bool {
        var low = low
        var high = high
        
        while low < high {
            if characters[low] != characters[high] {
                return false
            }
            low += 1
            high -= 1
        }
        
        return true
    }
}


class Solution131x2 {
    func isPartitionAfter(_ s:String, added:String) -> Bool {
        
        let newStr = added + s
        
        let tempStr = String(newStr.reversed())
        
        return newStr == tempStr
    }
    
    func partition(_ s: String) -> [[String]] {
        
        if s.isEmpty {
            
            return []
        }
        
        if s.count == 1 {
            
            return [[s]]
        }
        
        let first = String(s.first!)
        
        let startIndex = String.Index(encodedOffset: 1)
        
        let subs = partition(String(s[startIndex...]))
        
        var results:[[String]] = []
        
        for sub in subs {
            
            var temp = sub
            
            temp.insert(first, at: 0)
            
            results.append(temp)
            
            if isPartitionAfter(sub[0], added: first) {
                
                temp = sub
                
                temp[0] = first + sub[0]
                
                results.append(temp)
            }
            
            if sub.count > 1 {
                
                if !isPartitionAfter(sub[0], added: sub[1]) {
                    
                    if isPartitionAfter(sub[0] + sub[1], added: first) {
                        
                        temp = sub
                        
                        temp.removeFirst()
                        
                        temp[0] = first + sub[0] + sub[1]
                        
                        results.append(temp)
                    }
                }
            }
        }
        
        return results
    }
}
