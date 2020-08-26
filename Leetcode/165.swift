/***
 165. Compare Version Numbers
 Medium

 Compare two version numbers version1 and version2.
 If version1 > version2 return 1; if version1 < version2 return -1;otherwise return 0.
 
 You may assume that the version strings are non-empty and contain only digits and the . character.
 
 The . character does not represent a decimal point and is used to separate number sequences.
 
 For instance, 2.5 is not "two and a half" or "half way to version three", it is the fifth second-level revision of the second first-level revision.
 
 You may assume the default revision number for each level of a version number to be 0. For example, version number 3.4 has a revision number of 3 and 4 for its first and second level revision number. Its third and fourth level revision number are both 0.
 
 
 
 Example 1:
 
 Input: version1 = "0.1", version2 = "1.1"
 Output: -1
 Example 2:
 
 Input: version1 = "1.0.1", version2 = "1"
 Output: 1
 Example 3:
 
 Input: version1 = "7.5.2.4", version2 = "7.5.3"
 Output: -1
 Example 4:
 
 Input: version1 = "1.01", version2 = "1.001"
 Output: 0
 Explanation: Ignoring leading zeroes, both “01” and “001" represent the same number “1”
 Example 5:
 
 Input: version1 = "1.0", version2 = "1.0.0"
 Output: 0
 Explanation: The first version number does not have a third level revision number, which means its third level revision number is default to "0"
 
 
 Note:
 
 Version strings are composed of numeric strings separated by dots . and this numeric strings may have leading zeroes.
 Version strings do not start or end with dots, and they will not be two consecutive dots.
 ***/



class Solution165x1 {
    func compareVersion(_ version1: String, _ version2: String) -> Int {
        var numbers1 = version1.split(separator: ".").compactMap { Int(String($0)) }
        var numbers2 = version2.split(separator: ".").compactMap { Int(String($0)) }
        let numDiff = numbers1.count - numbers2.count
        
        if numDiff < 0 {
            numbers1.append(contentsOf: Array(repeating: 0, count: -numDiff))
        } else if numDiff > 0 {
            numbers2.append(contentsOf: Array(repeating: 0, count: numDiff))
        }
        
        for i in 0..<numbers1.count {
            let diff = numbers1[i] - numbers2[i]
            if diff != 0 {
                return diff < 0 ? -1 : 1
            }
        }
        
        return 0
    }
}




class Solution165x2 {
    func compareVersion(_ version1: String, _ version2: String) -> Int {
        let arr1 = version1.split(separator: ".")
        let arr2 = version2.split(separator: ".")
        var i = 0
        while i < arr1.count || i < arr2.count {
            if i < arr1.count && i < arr2.count {
                if Int(String(arr1[i]))! > Int(String(arr2[i]))! {
                    return 1
                } else if Int(String(arr1[i]))! < Int(String(arr2[i]))! {
                    return -1
                }
            } else if i < arr1.count {
                if Int(String(arr1[i]))! != 0 {
                    return 1
                }
            } else if i < arr2.count {
                if Int(String(arr2[i]))! != 0 {
                    return -1
                }
            }
            i += 1
        }
        return 0
    }
}


class Solution165x3 {
    func compareVersion(_ version1: String, _ version2: String) -> Int {
        let ver1 = version1.components(separatedBy:".")
        let ver2 = version2.components(separatedBy:".")
        let maxLength = max(ver1.count, ver2.count)
        for index in 0..<maxLength {
            let v1:Int = index < ver1.count ? (Int)(ver1[index])! : 0
            let v2:Int = index < ver2.count ? (Int)(ver2[index])! : 0
            if (v1 > v2) {
                return 1
            } else if (v1 < v2) {
                return -1;
            }
        }
        return 0
    }
}
