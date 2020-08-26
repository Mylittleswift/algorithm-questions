/***
 51. N-Queens
 Hard

 The n-queens puzzle is the problem of placing n queens on an n×n chessboard such that no two queens attack each other.
 
 
 
 Given an integer n, return all distinct solutions to the n-queens puzzle.
 
 Each solution contains a distinct board configuration of the n-queens' placement, where 'Q' and '.' both indicate a queen and an empty space respectively.
 
 Example:
 
 Input: 4
 Output: [
 [".Q..",  // Solution 1
 "...Q",
 "Q...",
 "..Q."],
 
 ["..Q.",  // Solution 2
 "Q...",
 "...Q",
 ".Q.."]
 ]
 Explanation: There exist two distinct solutions to the 4-queens puzzle as shown above.
 ***/



class Solution51x1 {
    func solveNQueens(_ n: Int) -> [[String]] {
        guard n > 0 else {
            return []
        }
        var results = [[String]]()
        var cols = [Int]()
        cols.reserveCapacity(n)
        dfsHelper(n, &cols, &results)
        return results
    }
    
    fileprivate func dfsHelper(_ n: Int, _ cols: inout [Int], _ results: inout [[String]]) {
        if cols.count == n {
            results.append(draw(cols))
            return
        }
        
        for i in 0..<n {
            guard isValid(cols, i) else {
                continue
            }
            cols.append(i)
            dfsHelper(n, &cols, &results)
            cols.removeLast()
        }
    }
    
    
    fileprivate func isValid(_ cols: [Int], _ colIndex: Int) -> Bool {
        for rowIndex in 0..<cols.count {
            if colIndex == cols[rowIndex] {
                return false
            }
            if cols.count - rowIndex == colIndex - cols[rowIndex] {
                return false
            }
            if rowIndex - cols.count == colIndex - cols[rowIndex] {
                return false
            }
        }
        return true
    }
    
    fileprivate func draw(_ cols: [Int]) -> [String] {
        var result = [String]()
        for rowIndex in 0..<cols.count {
            var row = ""
            for j in 0..<cols.count {
                row += cols[rowIndex] == j ? "Q" : "."
            }
            result.append(row)
        }
        return result
    }
}



class Solution51x2 {
    func solveNQueens(_ n: Int) -> [[String]] {
        var result = [[String]]()
        var currB = Array(repeating:String(Array(repeating:".",count:n)),count:n)
        var cols = Array(repeating:false,count:n)
        var diagnal = Array(repeating:false,count:2*n-1)
        var antidiagonal = Array(repeating:false,count:2*n-1)
        
        helper(&result,&currB,n,0,&cols,&diagnal,&antidiagonal)
        return result
    }
    
    func helper(_ result: inout [[String]], _ currB: inout [String], _ n: Int, _ row: Int, _ cols: inout [Bool], _ diagonal: inout [Bool], _ antiDiagonal: inout [Bool]) -> Void {
        
        
        if(row==n) {
            result.append(currB)
            return
        }
        
        for col in 0..<n {
            if(cols[col] || diagonal[row-col+n-1] || antiDiagonal[row+col]) {
                continue
            }
            
            var curr = currB
            
            
            cols[col] = true
            diagonal[row-col+n-1] = true
            antiDiagonal[row+col] = true
            
            curr[row] = String(curr[row].prefix(col)) + String("Q") + String(curr[row].dropFirst(col + 1))
            helper(&result,&curr,n,row+1,&cols,&diagonal,&antiDiagonal)
            cols[col] = false
            diagonal[row-col+n-1] = false
            antiDiagonal[row+col] = false
            curr[row] = String(curr[row].prefix(col)) + String(".") + String(curr[row].dropFirst(col + 1))
        }
        
        return
    }
}


class Solution51x3 {
    func solveNQueens(_ n: Int) -> [[String]] {
        var result = [[String]]()
        var answer = [String]()
        nQueens(n: n, p: 0, l: 0, m: 0, r: 0, answer: &answer, result: &result)
        return result
    }
    
    private func getNq(index: Int, n: Int) -> String {
        var charArr = [Character](repeating: ".", count: n)
        charArr[index] = "Q"
        return String(charArr)
    }
    
    private func nQueens(n: Int, p: Int, l: Int, m: Int, r: Int, answer: inout [String], result: inout [[String]]) {
        if p >= n {
            result.append(answer)
            return
        }
        let mask = l | m | r
        var i = 0
        var b = 1
        while i < n {
            if mask & b == 0 {
                answer.append(getNq(index: i, n: n))
                nQueens(n: n, p: p+1, l: (l | b) >> 1, m: m | b, r: (r | b) << 1, answer: &answer, result: &result)
                answer.removeLast()
            }
            i += 1
            b <<= 1
        }
    }
}


class Solution51x4 {
    func solveNQueens(_ n: Int) -> [[String]] {
        var res = [[String]]()
        var curr = Array(repeating: 0, count: n)
        var usedColumn = Array(repeating: false, count: n)
        var usedDiagonals = Array(repeating: false, count: n * 2 - 1)
        var usedRevDiagonals = Array(repeating: false, count: n * 2 - 1)
        generateSolution(n , 0, &curr, &res, &usedColumn, &usedDiagonals, &usedRevDiagonals)
        return res
    }
    
    
    private func generateSolution(_ n: Int, _ row: Int, _ curr: inout [Int], _ res: inout [[String]], _ usedColumn: inout [Bool], _ usedDiagonals: inout [Bool], _ usedRevDiagonals: inout [Bool]) {
        if row == n {
            res.append(toList(n, curr))
            return
        }
        
        for i in 0..<n {
            if isValid(n, row, i, usedColumn, usedDiagonals, usedRevDiagonals) {
                mark(n, row, i, &usedColumn, &usedDiagonals, &usedRevDiagonals)
                curr[row] = i
                generateSolution(n , row + 1, &curr, &res, &usedColumn, &usedDiagonals, &usedRevDiagonals)
                unMark(n, row, i, &usedColumn, &usedDiagonals, &usedRevDiagonals)
            }
        }
    }
    
    
    private func mark(_ n: Int, _ row: Int, _ column: Int, _ usedColumn: inout [Bool], _ usedDiagonals: inout [Bool], _ usedRevDiagonals: inout [Bool]) {
        usedColumn[column] = true
        usedDiagonals[row + column] = true
        usedRevDiagonals[row - column + n - 1] = true
    }
    
    
    private func unMark(_ n: Int, _ row: Int, _ column: Int, _ usedColumn: inout [Bool], _ usedDiagonals: inout [Bool], _ usedRevDiagonals: inout [Bool]) {
        usedColumn[column] = false
        usedDiagonals[row + column] = false
        usedRevDiagonals[row - column + n - 1] = false
    }
    
    
    private func isValid(_ n: Int, _ row: Int, _ column: Int, _ usedColumn: [Bool], _ usedDiagonals: [Bool], _ usedRevDiagonals: [Bool]) -> Bool {
        return !usedColumn[column] && !usedDiagonals[row + column] && !usedRevDiagonals[row - column + n - 1]
    }
    
    
    private func toList(_ n: Int, _ curr: [Int]) -> [String] {
        var res = [String]()
        for num in curr {
            var tmp = Array(repeating: ".", count: n)
            tmp[num] = "Q"
            var string = String()
            for s in tmp {
                string += s
            }
            res.append(string)
        }
        return res
    }
}
