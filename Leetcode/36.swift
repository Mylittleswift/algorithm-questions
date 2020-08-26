/***
 36. Valid Sudoku
 Medium

 Determine if a 9x9 Sudoku board is valid. Only the filled cells need to be validated according to the following rules:
 
 Each row must contain the digits 1-9 without repetition.
 Each column must contain the digits 1-9 without repetition.
 Each of the 9 3x3 sub-boxes of the grid must contain the digits 1-9 without repetition.
 
 A partially filled sudoku which is valid.
 
 The Sudoku board could be partially filled, where empty cells are filled with the character '.'.
 
 Example 1:
 
 Input:
 [
 ["5","3",".",".","7",".",".",".","."],
 ["6",".",".","1","9","5",".",".","."],
 [".","9","8",".",".",".",".","6","."],
 ["8",".",".",".","6",".",".",".","3"],
 ["4",".",".","8",".","3",".",".","1"],
 ["7",".",".",".","2",".",".",".","6"],
 [".","6",".",".",".",".","2","8","."],
 [".",".",".","4","1","9",".",".","5"],
 [".",".",".",".","8",".",".","7","9"]
 ]
 Output: true
 Example 2:
 
 Input:
 [
 ["8","3",".",".","7",".",".",".","."],
 ["6",".",".","1","9","5",".",".","."],
 [".","9","8",".",".",".",".","6","."],
 ["8",".",".",".","6",".",".",".","3"],
 ["4",".",".","8",".","3",".",".","1"],
 ["7",".",".",".","2",".",".",".","6"],
 [".","6",".",".",".",".","2","8","."],
 [".",".",".","4","1","9",".",".","5"],
 [".",".",".",".","8",".",".","7","9"]
 ]
 Output: false
 Explanation: Same as Example 1, except with the 5 in the top left corner being
 modified to 8. Since there are two 8's in the top left 3x3 sub-box, it is invalid.
 Note:
 
 A Sudoku board (partially filled) could be valid but is not necessarily solvable.
 Only the filled cells need to be validated according to the mentioned rules.
 The given board contain only digits 1-9 and the character '.'.
 The given board size is always 9x9.
 ***/


class Solution36x1 {
    func isValidSudoku(_ board: [[Character]]) -> Bool {
        var rowSet = Set<Character>()
        var colSet = Set<Character>()
        var cube = Set<Character>()
        
        
        for i in 0..<9 {
            rowSet.removeAll()
            colSet.removeAll()
            for j in 0..<9 {
                let rowval = board[i][j]
                let colval = board[j][i]
                if rowval != "." {
                    if rowSet.contains(rowval) {return false}
                    rowSet.insert(rowval)
                }
                if colval != "." {
                    if colSet.contains(colval) {return false}
                    colSet.insert(colval)
                }
            }
            
        }
        print("here")
        for i in 0..<3 {
            for j in 0..<3 {
                cube.removeAll()
                let row = i * 3
                let col = j * 3
                for x in row..<(row + 3) {
                    for y in col..<(col + 3) {
                        let val = board[x][y]
                        if val != "." {
                            if cube.contains(val) {return false}
                            cube.insert(val)
                        }
                    }
                }
            }
        }
        return true
    }
}


class Solution36x2 {
    func isValidSudoku(_ board: [[Character]]) -> Bool {
        guard board.count == 9, board[0].count == 9 else { return false }
        
        var rowSet = Set<Character>()
        var columnSet = Set<Character>()
        for i in 0..<board.count {
            
            for j in 0..<board[0].count {
                if board[i][j] != "." {
                    if !rowSet.insert(board[i][j]).inserted { return false }
                }
                if board[j][i] != "." {
                    if !columnSet.insert(board[j][i]).inserted { return false }
                }
            }
            rowSet.removeAll()
            columnSet.removeAll()
        }
        
        for i in 0..<3 {
            for j in 0..<3 {
                for m in i * 3..<i * 3 + 3 {
                    for n in j * 3..<j * 3 + 3 {
                        if board[m][n] != "." {
                            if !rowSet.insert(board[m][n]).inserted { return false }
                        }
                    }
                }
                rowSet.removeAll()
            }
        }
        
        return true
    }
}



class Solution36x4 {
    func isValidSudoku(_ board: [[Character]]) -> Bool {
        guard board.count > 0 && board[0].count > 0 else {
            return false
        }
        let rowCount = board.count
        let colCount = board[0].count
        var rowFlag = Array<[Bool]>(repeating: Array<Bool>(repeating: false, count: colCount), count: rowCount)
        var colFlag = Array<[Bool]>(repeating: Array<Bool>(repeating: false, count: colCount), count: rowCount)
        var cellFlag = Array<[Bool]>(repeating: Array<Bool>(repeating: false, count: colCount), count: rowCount)
        
        
        for i in 0..<rowCount {
            for j in 0..<colCount {
                let num = Int(board[i][j].unicodeScalars.first!.value)
                if num >= 49 && num <= 57 {
                    let c = num - 49
                    if rowFlag[i][c] || colFlag[c][j] || cellFlag[3 * (i / 3) + j / 3][c] {
                        return false
                    }
                    rowFlag[i][c] = true
                    colFlag[c][j] = true
                    cellFlag[3 * (i / 3) + j / 3][c] = true
                }
                
            }
        }
        return true
    }
}


class Solution36x5 {
    
    enum BoardType {
        case colon
        case row
        case subSquare
    }
    
    func isValidSudoku(_ board: [[Character]]) -> Bool {
        
        func doesContains(index: (row: Int, col: Int), boardType: BoardType) -> Bool{
            switch boardType {
            case .colon:
                for i in index.row+1..<9 {
                    if board[index.row][index.col] == board[i][index.col] { return true }
                }
            case .row:
                let array = board[index.row][index.col + 1..<9]
                if array.contains(board[index.row][index.col]) { return true}
                
            case .subSquare:
                for squareRow in 0..<3 {
                    for squareCol in 0..<3 {
                        let x = index.row / 3 * 3 + squareRow
                        let y = index.col / 3 * 3 + squareCol
                        if board[index.row][index.col] == board[x][y] && index.row != x && index.col != y {
                            return true
                            
                        }
                    }
                    
                }
                
            }
            return false
        }
        
        // check horizontal
        for row in 0..<9 {
            for col in 0..<9 {
                let character = board[row][col]
                if Int(String(character)) != nil {
                    // Check horizontal
                    if doesContains(index: (row,col), boardType: .row) { return false }
                    
                    // Check vertical
                    if doesContains(index: (row,col), boardType: .colon) { return false }
                    
                    // Check sub-square
                    if doesContains(index: (row,col), boardType: .subSquare) { return false }
                }
                
            }
        }
        
        return true
    }
}


class Solution36x6 {
    func isValidSudoku(_ board: [[Character]]) -> Bool {
        var set = Set<String>()
        for i in 0..<9{
            for j in 0..<9{
                if board[i][j] == "."{
                    continue
                }
                if set.insert("\(board[i][j]) in row \(i)").inserted == false {
                    
                    return false
                }
                
                if set.insert("\(board[i][j]) in col \(j)").inserted == false {
                    
                    return false
                }
                
                if set.insert("\(board[i][j]) in cube \(i/3) - \(j/3)").inserted == false {
                    
                    return false
                }
            }
        }
        return true
        
    }
}


class Solution36x7 {
    func isValidSudoku(_ board: [[Character]]) -> Bool {
        var seen = Set<String>()
        
        for i in 0..<9 {
            for j in 0..<9 {
                let currVal = board[i][j]
                
                if currVal != "." {
                    if seen.contains("\(currVal) at row \(i)") ||
                        seen.contains("\(currVal) at col \(j)") ||
                        seen.contains("\(currVal) at block \(3 * (i / 3)),\(j / 3)") {
                        return false
                    }
                    else { // Valid, can be added
                        seen.insert("\(currVal) at row \(i)")
                        seen.insert("\(currVal) at col \(j)")
                        seen.insert("\(currVal) at block \(3 * (i / 3)),\(j / 3)")
                    } // End of else
                } // End of if
            }
        } // End of for
        
        return true
    }
}
