/***
 49. Group Anagrams
 Medium

 Given an array of strings, group anagrams together.
 
 Example:
 
 Input: ["eat", "tea", "tan", "ate", "nat", "bat"],
 Output:
 [
 ["ate","eat","tea"],
 ["nat","tan"],
 ["bat"]
 ]
 Note:
 
 All inputs will be in lowercase.
 The order of your output does not matter.
 ***/


class Solution49x2 {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var result = [String : [String]]()
        for item in strs {
            let newStr = String([Character](item).sorted(by: <))
            if let tempArray = result[newStr] {
                var newArray = tempArray
                newArray.append(item)
                result[newStr] = newArray
            } else {
                result[newStr] = [item]
            }
        }
        return [[String]](result.values)
    }
}


class Solution49x3 {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var res = [[String]]()
        var dict = [String: [String]]()
        strs.forEach{(string) in
            let charArray = Array(string).sorted(by: <)
            let key = String(charArray)
            if dict[key] != nil {
                dict[key]?.append(string)
            }else {
                dict[key] = [string]
            }
        }
        for key in dict.keys {
            res.append(dict[key]!)
        }
        return res
    }
}


class Solution49x4 {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var map = [String: [String]]()
        
        for str in strs {
            let key = String(str.sorted())
            map[key, default: []].append(str)
        }
        
        return Array(map.values)
    }
}


class Solution49x5 {
    func groupAnagrams(_ strs: [String]) -> [[String]] {
        var map: [String: [String]] = [:]
        for str in strs {
            let chars = str.sorted()
            let key = String(chars)
            if var list = map[key] {
                list.append(str)
                map[key] = list
            } else {
                map[key] = [str]
            }
        }
        return Array(map.values)
    }
}
