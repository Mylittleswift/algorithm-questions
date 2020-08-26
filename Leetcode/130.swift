/***
 130. Surrounded Regions
 Medium

 Given a 2D board containing 'X' and 'O' (the letter O), capture all regions surrounded by 'X'.
 
 A region is captured by flipping all 'O's into 'X's in that surrounded region.
 
 Example:
 
 X X X X
 X O O X
 X X O X
 X O X X
 After running your function, the board should be:
 
 X X X X
 X X X X
 X X X X
 X O X X
 Explanation:
 
 Surrounded regions shouldn’t be on the border, which means that any 'O' on the border of the board are not flipped to 'X'. Any 'O' that is not on the border and it is not connected to an 'O' on the border will be flipped to 'X'. Two cells are connected if they are adjacent cells connected horizontally or vertically.
 ***/



class Solution130x1 {
    func solve(_ board: inout [[Character]]) {
        let h = board.count
        guard h > 2 else { return }
        
        let w = board[0].count
        guard w > 2 else { return }
        
        for i in 0..<h {
            mark(&board, i, 0)
            mark(&board, i, w - 1)
        }
        
        for j in 0..<w {
            mark(&board, 0, j)
            mark(&board, h - 1, j)
        }
        
        for i in 0..<h {
            for j in 0..<w {
                if board[i][j] == "O" {
                    board[i][j] = "X"
                } else if board[i][j] == "T" {
                    board[i][j] = "O"
                }
            }
        }
    }
    
    func mark(_ board: inout [[Character]], _ i: Int, _ j: Int) {
        guard i >= 0 && i < board.count else { return }
        guard j >= 0 && j < board[i].count else { return }
        guard board[i][j] == "O" else { return }
        
        board[i][j] = "T"
        
        mark(&board, i - 1, j)
        mark(&board, i + 1, j)
        mark(&board, i, j - 1)
        mark(&board, i, j + 1)
    }
}



class Solution130x2 {
    func solve(_ board: inout [[Character]]) {
        for i in 0..<board.count {
            for j in 0..<board[i].count {
                if (i == 0 || i == board.count - 1 || j == 0 || j == board[i].count - 1) && board[i][j] == "O" {
                    dfs(&board, i, j)
                }
                
            }
        }
        for i in 0..<board.count {
            for j in 0..<board[i].count {
                if board[i][j] == "O" {
                    board[i][j] = "X"
                }
                if board[i][j] == "Y" {
                    board[i][j] = "O"
                }
            }
        }
    }
    private func dfs(_ board: inout [[Character]], _ i: Int, _ j: Int) {
        if board[i][j] == "O" {
            
            board[i][j] = "Y"
            if i > 0 && board[i - 1][j] == "O" {
                dfs(&board, i - 1, j)
            }
            
            if j < board[i].count - 1 && board[i][j + 1] == "O" {
                dfs(&board, i, j + 1)
            }
            
            if i < board.count - 1 && board[i + 1][j] == "O" {
                dfs(&board, i + 1, j)
            }
            
            if j > 0 && board[i][j - 1] == "O" {
                dfs(&board, i, j - 1)
            }
        }
    }
}



class Solution130x3 {
    func solve(_ board: inout [[Character]]) {
        for i in 0..<board.count{
            for j in 0..<board[0].count{
                if (i==0 || i == board.count - 1 || j == 0 || j == board[0].count - 1) && board[i][j] == "O" {
                    board[i][j] = "M"
                    connected(i, j, &board)
                }
            }
        }
        for i in 0..<board.count{
            for j in 0..<board[0].count{
                if board[i][j] == "O" {
                    board[i][j] = "X"
                }
                else if board[i][j] == "M" {
                    board[i][j] = "O"
                }
            }
        }
    }
    private func connected(_ i : Int, _ j : Int, _ board: inout [[Character]]){
        if i-1 > 0 && board[i-1][j] == "O" {
            board[i-1][j] = "M"
            connected(i-1, j, &board)
        }
        if i+1 < board.count-1 && board[i+1][j] == "O" {
            board[i+1][j] = "M"
            connected(i+1, j, &board)
        }
        if j-1 > 0 && board[i][j-1] == "O" {
            board[i][j-1] = "M"
            connected(i, j-1, &board)
        }
        if j+1 < board[i].count-1 && board[i][j+1] == "O" {
            board[i][j+1] = "M"
            connected(i, j+1, &board)
        }
    }
}
