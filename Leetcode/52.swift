/***
 52. N-Queens II
 Hard

 The n-queens puzzle is the problem of placing n queens on an n×n chessboard such that no two queens attack each other.
 
 
 
 Given an integer n, return the number of distinct solutions to the n-queens puzzle.
 
 Example:
 
 Input: 4
 Output: 2
 Explanation: There are two distinct solutions to the 4-queens puzzle as shown below.
 [
 [".Q..",  // Solution 1
 "...Q",
 "Q...",
 "..Q."],
 
 ["..Q.",  // Solution 2
 "Q...",
 "...Q",
 ".Q.."]
 ]
 ***/


class Solution52x1 {
    func totalNQueens(_ n: Int) -> Int {
        if n == 0 {
            return 0
        }
        var answer = 0
        var limit = (1<<n) - 1
        dfs(h: 0, r: 0, l: 0, answer: &answer, limit: &limit)
        return answer
    }
    private func dfs(h: Int, r: Int, l: Int, answer: inout Int, limit: inout Int) {
        if h == limit {
            answer += 1
            return
        }
        var position = limit & (~(h|r|l))
        while position > 0 {
            let p = position & (-position)
            position -= p
            dfs(h: h+p, r: (r+p)<<1, l: (l+p)>>1, answer: &answer, limit: &limit)
        }
    }
}


class Solution52x2 {
    var placeArr : [Int]!
    var totalN : Int = 0
    func canPlace(_ row:Int , _ col:Int) -> Bool{
        
        var colInRow : Int = 0
        var offset : Int = 0
        for idx in 0 ..< row {
            colInRow = placeArr[idx]
            
            if colInRow == col {
                return false
            }
            offset = row - idx
            if colInRow == col - offset{
                return false
            }
            if colInRow == col + offset{
                return false
            }
        }
        return true
    }
    
    var count : Int = 0
    func place(_ row:Int) -> (){
        if row == totalN {
            count += 1
        }else{
            for col in 0..<totalN {
                if canPlace(row,col) {
                    placeArr[row] = col
                    place(row + 1)
                }
            }
        }
    }
    
    func totalNQueens(_ n: Int) -> Int {
        totalN = n
        placeArr = Array(repeating : 0 , count : totalN)
        
        place(0)
        return count
    }
}



class Solution52x3 {
    func totalNQueens(_ n: Int) -> Int {
        var board = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
        var result = 0
        backtrack(&board, 0, &result)
        return result
    }
    
    private func backtrack(_ board: inout [[Bool]], _ row: Int, _ result: inout Int) {
        if row == board.count {
            result += 1
        } else {
            for col in 0..<board.count where canPlaceQueen(board, row, col) {
                board[row][col] = true
                backtrack(&board, row + 1, &result)
                board[row][col] = false
            }
        }
    }
    
    private func canPlaceQueen(_ board: [[Bool]], _ row: Int, _ col: Int) -> Bool {
        let n = board.count
        
        for i in 0..<row where board[i][col] {
            return false
        }
        
        var i = row - 1
        var j = col - 1
        while i >= 0 && j >= 0 {
            if board[i][j] {
                return false
            }
            i -= 1
            j -= 1
        }
        
        i = row - 1
        j = col + 1
        while i >= 0 && j < n {
            if board[i][j] {
                return false
            }
            i -= 1
            j += 1
        }
        
        return true
    }
}



class Solution52x4 {
    var placeArr : [Int]!
    var totalN : Int = 0
    func canPlace(_ row:Int , _ col:Int) -> Bool{
        
        var colInRow : Int = 0
        var offset : Int = 0
        for idx in 0 ..< row {
            colInRow = placeArr[idx]
            
            if colInRow == col {
                return false
            }
            offset = row - idx
            if colInRow == col - offset{
                return false
            }
            if colInRow == col + offset{
                return false
            }
        }
        return true
    }
    
    var count : Int = 0
    func place(_ row:Int) -> (){
        if row == totalN {
            count += 1
        }else{
            for col in 0..<totalN {
                if canPlace(row,col) {
                    placeArr[row] = col
                    place(row + 1)
                }
            }
        }
    }
    
    func totalNQueens(_ n: Int) -> Int {
        totalN = n
        placeArr = Array(repeating : 0 , count : totalN)
        
        place(0)
        return count
    }
}
