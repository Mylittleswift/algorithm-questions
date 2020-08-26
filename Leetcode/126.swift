/***
 126. Word Ladder II
 Hard

 Given two words (beginWord and endWord), and a dictionary's word list, find all shortest transformation sequence(s) from beginWord to endWord, such that:
 
 Only one letter can be changed at a time
 Each transformed word must exist in the word list. Note that beginWord is not a transformed word.
 Note:
 
 Return an empty list if there is no such transformation sequence.
 All words have the same length.
 All words contain only lowercase alphabetic characters.
 You may assume no duplicates in the word list.
 You may assume beginWord and endWord are non-empty and are not the same.
 Example 1:
 
 Input:
 beginWord = "hit",
 endWord = "cog",
 wordList = ["hot","dot","dog","lot","log","cog"]
 
 Output:
 [
 ["hit","hot","dot","dog","cog"],
 ["hit","hot","lot","log","cog"]
 ]
 Example 2:
 
 Input:
 beginWord = "hit"
 endWord = "cog"
 wordList = ["hot","dot","dog","lot","log"]
 
 Output: []
 
 Explanation: The endWord "cog" is not in wordList, therefore no possible transformation.
 ***/



class Solution126x1 {
    let alphabet = Array("abcdefghijklmnopqrstuvwxyz")
    
    func findLadders(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> [[String]] {
        var dictionary = Set(wordList)
        var result = [[String]]()
        var distance = [String: Int]()
        var neighbors = [String: [String]]()
        
        dictionary.insert(beginWord)
        
        // Get distances and neighbors for each word
        bfs(beginWord, endWord, &dictionary, &distance, &neighbors)
        
        // Get results of word ledders
        var temp = [String]()
        dfs(beginWord, endWord, &dictionary, &distance, &neighbors, &result, &temp)
        
        return result
    }
    
    private func bfs(_ beginWord: String, _ endWord: String, _ dictionary: inout Set<String>, _ distance: inout [String: Int], _ neighbors: inout [String: [String]]) {
        for word in dictionary {
            neighbors[word] = [String]()
        }
        
        var queue = [String]()
        queue.append(beginWord)
        distance[beginWord] = 0
        
        while !queue.isEmpty {
            var newQueue = [String]()
            var foundEnd = false
            for word in queue {
                let wordDistance = distance[word]!
                let wordNeighbors = getNeighbors(&dictionary, word)
                for neighbor in wordNeighbors {
                    neighbors[word]!.append(neighbor)
                    if distance[neighbor] == nil {
                        distance[neighbor] = wordDistance + 1
                        if neighbor == endWord {
                            foundEnd = true
                        } else {
                            newQueue.append(neighbor)
                        }
                    }
                }
            }
            if foundEnd {
                break
            }
            queue = newQueue
        }
    }
    
    private func getNeighbors(_ dictionary: inout Set<String>, _ word: String) -> [String] {
        var wordChars = Array(word)
        var result = [String]()
        for i in 0..<word.count {
            let oldChar = wordChars[i]
            for letter in alphabet {
                wordChars[i] = letter
                let newWord = String(wordChars)
                if dictionary.contains(newWord) {
                    result.append(newWord)
                }
            }
            wordChars[i] = oldChar
        }
        return result
    }
    
    private func dfs(_ beginWord: String, _ endWord: String, _ dictionary: inout Set<String>, _ distance: inout [String: Int], _ neighbors: inout [String: [String]], _ result: inout [[String]], _ temp: inout [String]) {
        temp.append(beginWord)
        if beginWord == endWord {
            result.append(temp)
        } else {
            let wordDistance = distance[beginWord]!
            for neighbor in neighbors[beginWord]! {
                if distance[neighbor]! == wordDistance + 1 {
                    dfs(neighbor, endWord, &dictionary, &distance, &neighbors, &result, &temp)
                }
            }
        }
        temp.removeLast()
    }
}


class Solution126x2 {
    func findLadders(_ beginWord: String, _ endWord: String, _ wordList: [String]) -> [[String]] {
        var res:[[String]] = [[String]]()
        //加速查找
        var dict:Set<String> = Set<String>(wordList)
        //构建队列
        var p:[String] = [String]()
        //加入源顶点
        p.append(beginWord)
        var paths:[[String]] = [[String]]()
        paths.append(p)
        var level:Int = 1, minLevel:Int = Int.max
        var words:Set<String> = Set<String>()
        while (paths.count != 0)
        {
            var t = paths.removeFirst()
            if t.count > level
            {
                for w in words{dict.remove(w)}
                words = Set<String>()
                level = t.count
                if level > minLevel {break}
            }
            var last:String = t.last!
            for i in 0..<last.count
            {
                var newLast:String = last
                for ch in 97...122
                {
                    newLast[i] = ch.ASCII
                    if !dict.contains(newLast){continue}
                    words.insert(newLast)
                    var nextPath = t
                    nextPath.append(newLast)
                    if newLast == endWord
                    {
                        res.append(nextPath)
                        minLevel = level
                    }
                    else
                    {
                        paths.append(nextPath)
                    }
                }
            }
        }
        return res
    }
}

//String扩展方法
extension String {
    func toCharArray() -> [Character]
    {
        var arr:[Character] = [Character]()
        for char in self
        {
            arr.append(char)
        }
        return arr
    }
    
    //subscript函数可以检索数组中的值
    //直接按照索引方式截取指定索引的字符
//    subscript (_ i: Int) -> Character {
//        //读取字符
//        get {return self[index(startIndex, offsetBy: i)]}
//        
//        //修改字符
//        set
//        {
//            var str:String = self
//            var index = str.index(startIndex, offsetBy: i)
//            str.remove(at: index)
//            str.insert(newValue, at: index)
//            self = str
//        }
//    }
}

//Int扩展方法
extension Int
{
    //属性：ASCII值(定义大写为字符值)
    var ASCII:Character
    {
        get {return Character(UnicodeScalar(self)!)}
    }
}
