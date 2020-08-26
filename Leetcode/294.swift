/***
 294 Flip Game II
 Medium
 
 Problem:
 You are playing the following Flip Game with your friend: Given a string that contains only these two characters: + and -, you and your friend take turns to flip two consecutive "++" into "--". The game ends when a person can no longer make a move and therefore the other person will be the winner.
 Write a function to determine if the starting player can guarantee a win.
 For example, given s = "++++", return true. The starting player can guarantee a win by flipping the middle "++" to become "+--+".
 Follow up: Derive your algorithm's runtime complexity.
 ***/


class Solution294 {
    func canWin(_ s:String) -> Bool {
        var arrS:[Character] = Array(s)
        for i in 1..<s.count
        {
            if arrS[i] == "+" && arrS[i - 1] == "+" && !canWin(s.subString(0, i - 1) + "--" + s.subString(i + 1))
            {
                return true
            }
        }
        return false
    }
}

extension String {
    // 截取字符串：从index到结束处
    // - Parameter index: 开始索引
    // - Returns: 子字符串
    func subString(_ index: Int) -> String {
        let theIndex = self.index(self.endIndex, offsetBy: index - self.count)
        return String(self[theIndex..<endIndex])
    }
    
    // 截取字符串：指定索引和字符数
    // - begin: 开始截取处索引
    // - count: 截取的字符数量
    func subString(_ begin:Int,_ count:Int) -> String {
        let start = self.index(self.startIndex, offsetBy: max(0, begin))
        let end = self.index(self.startIndex, offsetBy:  min(self.count, begin + count))
        return String(self[start..<end])
    }
}
