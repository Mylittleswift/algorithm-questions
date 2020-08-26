/***
 289. Game of Life
 Medium

 According to the Wikipedia's article: "The Game of Life, also known simply as Life, is a cellular automaton devised by the British mathematician John Horton Conway in 1970."
 
 Given a board with m by n cells, each cell has an initial state live (1) or dead (0). Each cell interacts with its eight neighbors (horizontal, vertical, diagonal) using the following four rules (taken from the above Wikipedia article):
 
 Any live cell with fewer than two live neighbors dies, as if caused by under-population.
 Any live cell with two or three live neighbors lives on to the next generation.
 Any live cell with more than three live neighbors dies, as if by over-population..
 Any dead cell with exactly three live neighbors becomes a live cell, as if by reproduction.
 Write a function to compute the next state (after one update) of the board given its current state. The next state is created by applying the above rules simultaneously to every cell in the current state, where births and deaths occur simultaneously.
 
 Example:
 
 Input:
 [
 [0,1,0],
 [0,0,1],
 [1,1,1],
 [0,0,0]
 ]
 Output:
 [
 [0,0,0],
 [1,0,1],
 [0,1,1],
 [0,1,0]
 ]
 Follow up:
 
 Could you solve it in-place? Remember that the board needs to be updated at the same time: You cannot update some cells first and then use their updated values to update other cells.
 In this question, we represent the board using a 2D array. In principle, the board is infinite, which would cause problems when the active area encroaches the border of the array. How would you address these problems?
 ***/



class Solution289x1 {
    func gameOfLife(_ board: inout [[Int]]) {
        
        let m = board.count
        let n = board[0].count
        
        for i in 0..<m {
            for j in 0..<n {
                var count = 0
                if i != 0 {
                    if j != 0 {
                        count += board[i-1][j-1] > 0 ? 1 : 0
                    }
                    
                    if j != n-1 {
                        count += board[i-1][j+1] > 0 ? 1 : 0
                    }
                    
                    count += board[i-1][j] > 0 ? 1 : 0
                }
                
                if i != m-1 {
                    if j != 0 {
                        count += board[i+1][j-1] > 0 ? 1 : 0
                    }
                    
                    if j != n-1 {
                        count += board[i+1][j+1] > 0 ? 1 : 0
                    }
                    
                    count += board[i+1][j] > 0 ? 1 : 0
                }
                
                if j != 0 {
                    count += board[i][j-1] > 0 ? 1 : 0
                }
                
                if j != n-1 {
                    count += board[i][j+1] > 0 ? 1 : 0
                }
                
                if board[i][j] == 0 {
                    if count == 3 {
                        board[i][j] = -1
                    }
                }else {
                    if count != 2 && count != 3 {
                        board[i][j] = 2
                    }
                }
            }
        }
        
        for i in 0..<m {
            for j in 0..<n {
                if board[i][j] == 2 {
                    board[i][j] = 0
                }
                if board[i][j] == -1 {
                    board[i][j] = 1
                }
            }
        }
    }
}



class Solution289x2 {
    func gameOfLife(_ board: inout [[Int]]) {
        var m = board.count
        var n = board[0].count
        var matrix = board
        
        func helper(_ i: Int, _ j: Int) -> Int {
            var count = 0
            if i > 0 {
                count += board[i - 1][j]
                if j > 0 {
                    count += board[i - 1][j - 1]
                }
                if j < n - 1 {
                    count += board[i - 1][j + 1]
                }
            }
            if i < m - 1 {
                count += board[i + 1][j]
                if j > 0 {
                    count += board[i + 1][j - 1]
                }
                if j < n - 1 {
                    count += board[i + 1][j + 1]
                }
            }
            if j > 0 {
                count += board[i][j - 1]
            }
            if j < n - 1 {
                count += board[i][j + 1]
            }
            
            if board[i][j] == 1 {
                if count == 2 || count == 3 {
                    return 1
                } else {
                    return 0
                }
            } else {
                if count == 3 {
                    return 1
                } else {
                    return 0
                }
            }
        }
        
        for i in 0 ..< m {
            for j in 0 ..< n {
                matrix[i][j] = helper(i, j)
            }
        }
        board = matrix
    }
}
