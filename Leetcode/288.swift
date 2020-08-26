/***
 288 Unique Word Abbreviation
 Medium
 
 Problem：
 An abbreviation of a word follows the form . Below are some examples of word abbreviations:
 
 a) it                      --> it    (no abbreviation)
 
 1
 b) d|o|g                   --> d1g
 
 1    1  1
 1---5----0----5--8
 c) i|nternationalizatio|n  --> i18n
 
 1
 1---5----0
 d) l|ocalizatio|n          --> l10n
 Assume you have a dictionary and given a word, find whether its abbreviation is unique in the dictionary. A word's abbreviation is unique if no other word from the dictionary has the same abbreviation.
 
 Example:
 Given dictionary = [ "deer", "door", "cake", "card" ]
 
 isUnique("dear") ->
 false
 
 isUnique("cart") ->
 true
 
 isUnique("cane") ->
 false
 
 isUnique("make") ->
 true
 ***/


class Solution288 {
    var m:[String:Set<String>] = [String:Set<String>]()
    func ValidWordAbbr(_ dictionary:inout [String]) {
        for a in dictionary
        {
            let arr:[Character] = Array(a)
            let k:String = String(arr[0]) + String(a.count - 2) + String(arr.last!)
            m[k,default:Set<String>()].insert(a)
        }
    }
    
    func isUnique(_ word:String) -> Bool
    {
        let arr:[Character] = Array(word)
        let k:String = String(arr[0]) + String(word.count - 2) + String(arr.last!)
        let num:Int = m[k,default:Set<String>()].contains(word) ? 1 : 0
        return num == m[k,default:Set<String>()].count
    }
}
