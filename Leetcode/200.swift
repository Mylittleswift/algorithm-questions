/***
 200. Number of Islands
 Medium

 Given a 2d grid map of '1's (land) and '0's (water), count the number of islands. An island is surrounded by water and is formed by connecting adjacent lands horizontally or vertically. You may assume all four edges of the grid are all surrounded by water.
 
 Example 1:
 
 Input:
 11110
 11010
 11000
 00000
 
 Output: 1
 Example 2:
 
 Input:
 11000
 11000
 00100
 00011
 
 Output: 3
 ***/



class Solution200x1 {
    func numIslands(_ grid: [[Character]]) -> Int {
        var map = grid
        let row = map.count
        if row == 0 {return 0}
        let col = map[0].count
        var count = 0
        for i in 0..<row {
            for j in 0..<col {
                if map[i][j] == "1" {
                    dfs(&map, i, j, row, col)
                    count += 1
                }
            }
        }
        return count
    }
    func dfs(_ map: inout [[Character]], _ i: Int, _ j: Int, _ row: Int, _ col: Int) {
        if (i >= 0 && i < row && j >= 0 && j < col && map[i][j] == "1") {
            map[i][j] = "2"
            dfs(&map, i, j-1, row, col);
            dfs(&map, i-1, j, row, col);
            dfs(&map, i, j+1, row, col);
            dfs(&map, i+1, j, row, col);
        }
    }
}


class Solution200x2 {
    func numIslands(_ grid: [[Character]]) -> Int {
        var map = grid
        let row = map.count
        if row == 0 {return 0}
        let col = map[0].count
        var count = 0
        for i in 0..<row {
            for j in 0..<col {
                if map[i][j] == "1" {
                    dfs(&map, i, j, row, col)
                    count += 1
                }
            }
        }
        return count
    }
    func dfs(_ map: inout [[Character]], _ i: Int, _ j: Int, _ row: Int, _ col: Int) {
        if (i >= 0 && i < row && j >= 0 && j < col && map[i][j] == "1") {
            map[i][j] = "2"
            let index = [0,-1,0,1,0]
            for k in 0..<(index.count - 1) {
                dfs(&map, i + index[k], j + index[k + 1], row, col)
            }
        }
    }
}


class Solution200x3 {
    func numIslands(_ grid: [[Character]]) -> Int {
        guard !grid.isEmpty, !grid[0].isEmpty else { return 0 }
        
        var queue = [[Int]]()
        var grid = grid
        var count = 0
        
        for i in 0..<grid.count {
            for j in 0..<grid[0].count {
                if grid[i][j] == "1" {
                    queue.append([i, j])
                    count += 1
                    markIsland(&grid, &queue)
                }
            }
        }
        return count
    }
    
    
    private let dc = [-1, 1, 0, 0]
    private let dr = [0, 0, 1, -1]
    
    private func markIsland(_ grid: inout [[Character]], _ queue: inout [[Int]]) {
        while !queue.isEmpty {
            let curr = queue.removeFirst()
            for i in 0..<dc.count {
                let row = curr[0] + dr[i]
                let column = curr[1] + dc[i]
                if row < 0 || row >= grid.count || column < 0 || column >= grid[0].count || grid[row][column] == "0" {
                    continue
                }
                grid[row][column] = "0"
                queue.append([row, column])
            }
        }
    }
}


class Solution200x4 {
    func numIslands(_ grid: [[Character]]) -> Int {
        guard grid.count > 0, grid[0].count > 0 else {
            return 0
        }
        var result = 0
        
        var dirs = [[0, 1], [1, 0], [0, -1], [-1, 0]]
        
        var memo = [[Bool]](repeating:[Bool](repeating:false, count:grid[0].count), count:grid.count)
        
        func dfs(i:Int, j:Int) {
            if i < 0 || j < 0 || i >= grid.count || j >= grid[0].count || memo[i][j] == true || grid[i][j] == "0" {
                return
            }
            
            memo[i][j] = true
            
            for dir in dirs {
                dfs(i:i + dir[0], j: j + dir[1])
            }
        }
        
        for i in 0..<grid.count {
            for j in 0..<grid[i].count {
                if memo[i][j] == true || grid[i][j] == "0" {
                    continue
                } else {
                    result += 1
                    dfs(i:i, j:j)
                }
            }
        }
        
        return result
    }
}
