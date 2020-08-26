/***
 79. Word Search
 Medium

 Given a 2D board and a word, find if the word exists in the grid.
 
 The word can be constructed from letters of sequentially adjacent cell, where "adjacent" cells are those horizontally or vertically neighboring. The same letter cell may not be used more than once.
 
 Example:
 
 board =
 [
 ['A','B','C','E'],
 ['S','F','C','S'],
 ['A','D','E','E']
 ]
 
 Given word = "ABCCED", return true.
 Given word = "SEE", return true.
 Given word = "ABCB", return false.
 
 
 Constraints:
 
 board and word consists only of lowercase and uppercase English letters.
 1 <= board.length <= 200
 1 <= board[i].length <= 200
 1 <= word.length <= 10^3
 ***/


class Solution79x1 {
    
    func searchSolution(_ board: inout [[Character]],
                        _ letter: inout [Character],
                        _ visited: inout [[Bool]],
                        _ x: Int,
                        _ y: Int,
                        _ index: Int) -> Bool {
        
        if board[x][y] == letter[index] {
            
            visited[x][y] = true
            
            if (index + 1) >= letter.count {
                return true
            }
            
            if x > 0 {
                if visited[x-1][y] == false && searchSolution(&board, &letter, &visited, x - 1, y, index + 1) {
                    return true
                }
            }
            if x < (board.count - 1) {
                if visited[x+1][y] == false && searchSolution(&board, &letter, &visited, x + 1, y, index + 1) {
                    return true
                }
            }
            if y > 0 {
                if visited[x][y-1] == false && searchSolution(&board, &letter, &visited, x, y - 1, index + 1) {
                    return true
                }
            }
            if y < (board[0].count - 1) {
                if visited[x][y+1] == false && searchSolution(&board, &letter, &visited, x, y + 1, index + 1) {
                    return true
                }
            }
            
            visited[x][y] = false
            
        }
        
        return false
    }
    
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        
        var letters = Array(word)
        var board = board
        
        if board.count <= 0 { return false }
        if board[0].count <= 0 { return false }
        
        var visited = [[Bool]](repeating: [Bool](repeating: false, count: board[0].count), count: board.count)
        
        for x in 0..<board.count {
            for y in 0..<board[0].count {
                
                if searchSolution(&board, &letters, &visited, x, y, 0) {
                    return true
                }
            }
        }
        
        return false
    }
}


class Solution79x2 {
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        
        if board.count == 0 {
            return false
        }
        let m = board.count
        let n = board[0].count
        var board = board
        var wordChars = Array(word)
        for i in 0..<m {
            for j in 0..<n {
                if helper(&board, i, j, &wordChars, 0) {
                    return true
                }
            }
        }
        return false
        
    }
    
    func helper(_ board: inout [[Character]], _ i: Int, _ j: Int, _ wordChars: inout [Character], _ cur: Int) -> Bool {
        let m = board.count
        let n = board[0].count
        if (i < 0 || i >= m || j < 0 || j >= n || board[i][j] == "0" || board[i][j] != wordChars[cur]) {
            return false
        }
        if cur == wordChars.count - 1 {
            return true
        }
        let temp = board[i][j]
        board[i][j] = "0"
        let res =   helper(&board, i-1, j, &wordChars, cur+1) ||
            helper(&board, i+1, j, &wordChars, cur+1) ||
            helper(&board, i, j-1, &wordChars, cur+1) ||
            helper(&board, i, j+1, &wordChars, cur+1)
        board[i][j] = temp
        return res
    }
}


class Solution79x3 {
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        
        let char = word[word.index(word.startIndex, offsetBy: 0)]
        
        for row in 0..<board.count {
            for col in 0..<board[0].count {
                if board[row][col] == char && search(board, word, row, col, 1) {
                    return true
                }
            }
        }
        
        return false
    }
    
    func search(_ board: [[Character]], _ word: String, _ row: Int, _ col: Int, _ index: Int) -> Bool {
        if index >= word.count { return true }
        
        var board = board
        board[row][col] = "-"
        
        let char = word[word.index(word.startIndex, offsetBy: index)]
        
        if (row+1) < board.count && board[row+1][col] == char && search(board, word, row+1, col, index+1) {
            return true
        }
            
        else if row > 0 && board[row-1][col] == char && search(board, word, row-1, col, index+1) {
            return true
        }
            
        else if (col+1) < board[row].count && board[row][col+1] == char && search(board, word, row, col+1, index+1) {
            return true
        }
            
        else if col > 0 && board[row][col-1] == char && search(board, word, row, col-1, index+1) {
            return true
        }
        
        return false
    }
}


class Solution79x4 {
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        var board = board
        var word = Array(word)
        for y in stride(from:0,to:board.count,by:1) {
            for x in stride(from:0,to:board[0].count,by:1) {
                if dfs(&board,y,x,word,0) {
                    return true
                }
            }
        }
        return false
    }
    
    func dfs(_ board:inout[[Character]], _ y:Int,_ x:Int,_ word:Array<Character>,_ wordPos:Int) -> Bool {
        if wordPos == word.count {
            return true
        } else if y < 0 || y >= board.count || x < 0 || x >= board[0].count || board[y][x] != word[wordPos]{
            return false
        }
        let temp = board[y][x]
        board[y][x] = "#"
        let res = dfs(&board,y + 1,x,word,wordPos + 1) ||
            dfs(&board,y - 1,x,word,wordPos + 1) ||
            dfs(&board,y,x + 1,word,wordPos + 1) ||
            dfs(&board,y,x - 1,word,wordPos + 1)
        
        board[y][x] = temp
        return res
    }
}
