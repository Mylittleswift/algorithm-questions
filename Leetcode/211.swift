/***
 211. Add and Search Word - Data structure design
 Medium

 Design a data structure that supports the following two operations:
 
 void addWord(word)
 bool search(word)
 search(word) can search a literal word or a regular expression string containing only letters a-z or .. A . means it can represent any one letter.
 
 Example:
 
 addWord("bad")
 addWord("dad")
 addWord("mad")
 search("pad") -> false
 search("bad") -> true
 search(".ad") -> true
 search("b..") -> true
 Note:
 You may assume that all words are consist of lowercase letters a-z.
 ***/



class TrieNode {
    var children: [Character: TrieNode]
    var isEnd: Bool
    
    init() {
        children = [:]
        isEnd = false
    }
}

class WordDictionary {
    
    private var root: TrieNode
    /** Initialize your data structure here. */
    init() {
        root = TrieNode()
    }
    
    /** Adds a word into the data structure. */
    func addWord(_ word: String) {
        var node = self.root
        
        for c in Array(word) {
            if let next = node.children[c] {
                node = next
            } else {
                let newNode = TrieNode()
                node.children[c] = newNode
                node = newNode
            }
        }
        node.isEnd = true
    }
    
    /** Returns if the word is in the data structure. A word could contain the dot character '.' to represent any one letter. */
    func search(_ word: String) -> Bool {
        return self.match(Array(word), 0, self.root)
    }
    
    private func match(_ chars: [Character], _ i :Int, _ node: TrieNode) -> Bool {
        // if we reached the end
        if i == chars.count {
            return node.isEnd
        }
        let c = chars[i]
        if c != "." {
            guard let next = node.children[c] else { return false }
            return self.match(chars, i + 1, next)
        } else {
            for next in node.children.values {
                if self.match(chars, i + 1, next) {
                    return true
                }
            }
        }
        
        return false
    }
}

