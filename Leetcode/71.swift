/***
 71. Simplify Path
 Medium

 Given an absolute path for a file (Unix-style), simplify it. Or in other words, convert it to the canonical path.
 
 In a UNIX-style file system, a period . refers to the current directory. Furthermore, a double period .. moves the directory up a level.
 
 Note that the returned canonical path must always begin with a slash /, and there must be only a single slash / between two directory names. The last directory name (if it exists) must not end with a trailing /. Also, the canonical path must be the shortest string representing the absolute path.
 
 
 
 Example 1:
 
 Input: "/home/"
 Output: "/home"
 Explanation: Note that there is no trailing slash after the last directory name.
 Example 2:
 
 Input: "/../"
 Output: "/"
 Explanation: Going one level up from the root directory is a no-op, as the root level is the highest level you can go.
 Example 3:
 
 Input: "/home//foo/"
 Output: "/home/foo"
 Explanation: In the canonical path, multiple consecutive slashes are replaced by a single one.
 Example 4:
 
 Input: "/a/./b/../../c/"
 Output: "/c"
 Example 5:
 
 Input: "/a/../../b/../c//.//"
 Output: "/c"
 Example 6:
 
 Input: "/a//b////c/d//././/.."
 Output: "/a/b/c"
 ***/



class Solution71x1 {
    func simplifyPath(_ path: String) -> String {
        let paths = path.components(separatedBy:"/")
        var stack = [String]()
        for str in paths {
            if str == "." || str == ""{
                
            } else if str == ".." {
                stack.popLast()
            } else {
                stack.append(str)
            }
        }
        
        var result = "/"
        for i in 0..<stack.count {
            let str = stack[i]
            if i == stack.count - 1 {
                result += str
            } else {
                result += str + "/"
            }
        }
        
        return result
    }
}


class Solution71x2 {
    func simplifyPath(_ path: String) -> String {
        let cmpt = path.components(separatedBy: "/")
        var ret: [String] = []
        for item in cmpt {
            if item == ".." {
                if ret.count > 0 {
                    ret.removeLast()
                }
            } else if item == "." {
                continue
            } else if item == "" {
                continue
            } else {
                ret.append(item)
            }
        }
        return "/" + ret.joined(separator: "/")
    }
    
}


class Solution71x3 {
    func simplifyPath(_ path: String) -> String {
        let arr = path.split{ $0=="/" }.map(String.init)
        var stack = [String]()
        for s in arr {
            if s == "" || s == "." { continue }
            if s == ".." { _ = stack.popLast(); continue; }
            stack.append(s)
        }
        return stack.isEmpty ? "/" : "/" + stack.joined(separator:"/")
    }
}


class Solution71x4 {
    func simplifyPath(_ path: String) -> String {
        var components = path.split(separator: "/")
        var stack = [String.SubSequence]()
        
        for component in components {
            if component == "." {
                continue
            } else if component == ".." {
                stack.popLast()
            } else {
                stack.append(component)
            }
        }
        
        var output = "/"
        
        for (index, pathComponent) in stack.enumerated() {
            if index == stack.count - 1 {
                output += pathComponent
            } else {
                output += pathComponent + "/"
            }
        }
        
        return output
    }
}
