/***
 93. Restore IP Addresses
 Medium

 Given a string containing only digits, restore it by returning all possible valid IP address combinations.
 
 A valid IP address consists of exactly four integers (each integer is between 0 and 255) separated by single points.
 
 Example:
 
 Input: "25525511135"
 Output: ["255.255.11.135", "255.255.111.35"]
 ***/



class Solution93x1 {
    func restoreIpAddresses(_ s: String) -> [String] {
        if s.count < 4 || s.count > 12 {
            return []
        }
        
        let characters = Array(s)
        var result = [String]()
        var candidate = [String]()
        
        backtracking(characters, 0, &candidate, &result)
        
        return result
    }
    private func backtracking(_ characters: [Character], _ pos: Int, _ candidate: inout [String], _ result: inout [String]) {
        if candidate.count == 4 {
            result.append(candidate.joined(separator: "."))
            return
        }
        
        let charsLeft = characters.count - pos
        let groupsLeft = 4 - candidate.count
        let minLen = groupsLeft == 1 ? charsLeft - groupsLeft + 1 : 1
        let maxLen = characters[pos] == "0" ? 1 : min(3, charsLeft - groupsLeft + 1)
        
        if minLen > maxLen {
            return
        }
        
        for len in minLen...maxLen {
            let num = String(characters[pos..<(pos + len)])
            if Int(num)! > 255 {
                continue
            }
            candidate.append(num)
            backtracking(characters, pos + len, &candidate, &result)
            candidate.removeLast()
        }
    }
}
