/***
 37. Sudoku Solver
 Hard

 Write a program to solve a Sudoku puzzle by filling the empty cells.
 
 A sudoku solution must satisfy all of the following rules:
 
 Each of the digits 1-9 must occur exactly once in each row.
 Each of the digits 1-9 must occur exactly once in each column.
 Each of the the digits 1-9 must occur exactly once in each of the 9 3x3 sub-boxes of the grid.
 Empty cells are indicated by the character '.'.
 
 
 A sudoku puzzle...
 
 
 ...and its solution numbers marked in red.
 
 Note:
 
 The given board contain only digits 1-9 and the character '.'.
 You may assume that the given Sudoku puzzle will have a single unique solution.
 The given board size is always 9x9.
 ***/


class Solution37x1 {
    func solveSudoku(_ board: inout [[Character]]) {
        guard board.count != 0 || board[0].count != 0 else {
            return
        }
        helper(&board)
    }
    
    private func helper(_ board: inout [[Character]]) -> Bool {
        let m = board.count, n = board[0].count
        
        for i in 0..<m {
            for j in 0..<n {
                if board[i][j] == "." {
                    for num in 1...9 {
                        if isValid(board, i, j, Character(String(num))) {
                            board[i][j] = Character(String(num))
                            
                            if helper(&board) {
                                return true
                            } else {
                                board[i][j] = "."
                            }
                        }
                    }
                    return false
                }
            }
        }
        
        return true
    }
    
    private func isValid(_ board: [[Character]], _ i: Int, _ j: Int, _ num: Character) -> Bool {
        let m = board.count, n = board[0].count
        
        // check row
        for x in 0..<n {
            if board[i][x] == num {
                return false
            }
        }
        
        // check col
        for y in 0..<m {
            if board[y][j] == num {
                return false
            }
        }
        
        // check square
        for x in i / 3 * 3..<i / 3 * 3 + 3 {
            for y in j / 3 * 3..<j / 3 * 3 + 3 {
                if board[x][y] == num {
                    return false
                }
            }
        }
        
        return true
    }
}


class Solution37x2 {
    func isValidSudoku(_ board: inout [[Character]], row: Int, column: Int, char: Character) -> Bool {
        for i in 0..<9 {
            if board[i][column] == char {
                return false
            }
            
            if board[row][i] == char {
                return false
            }
            
            if board[3 * (row / 3) + i / 3][3 * (column / 3) + i % 3] == char {
                return false
            }
        }
        return true
    }
    
    func solve(_ board: inout [[Character]]) -> Bool {
        let digits: [Character] = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
        for i in 0..<9 {
            for j in 0..<9 {
                guard board[i][j] == "." else { continue }
                
                for char in digits {
                    guard isValidSudoku(&board, row: i, column: j, char: char) else { continue }
                    
                    board[i][j] = char
                    if solve(&board) {
                        return true
                    } else {
                        board[i][j] = "."
                    }
                }
                
                return false
            }
        }
        return true
    }
    
    func solveSudoku(_ board: inout [[Character]]) {
        solve(&board)
    }
}


class Solution37x3 {
    func solveSudoku(_ board: inout [[Character]]) {
        solve(&board)
    }
    
    func solve(_ board: inout [[Character]]) -> Bool{
        for i in 0..<9{
            for j in 0..<9{
                if board[i][j] == "."{
                    for k in "123456789"{
                        if valid(board, i, j, k){
                            board[i][j] = k
                            if solve(&board){
                                return true
                            }
                            board[i][j] = "."
                        }
                    }
                    return false
                }
            }
        }
        return true
    }
    
    func valid(_ board: [[Character]], _ i: Int, _ j: Int, _ k: Character) -> Bool{
        for m in 0..<9{
            if board[i][m] != "." && board[i][m] == k{
                return false
            }
            
            if board[m][j] != "." && board[m][j] == k{
                return false
            }
            
            var rowIndex = i / 3 * 3 + m / 3
            var colIndex = j / 3 * 3 + m % 3
            if board[rowIndex][colIndex] != "." && board[rowIndex][colIndex] == k{
                return false
            }
            
            
        }
        return true
    }
    
    
}
