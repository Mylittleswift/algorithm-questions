/***
 174. Dungeon Game
 Hard

 The demons had captured the princess (P) and imprisoned her in the bottom-right corner of a dungeon. The dungeon consists of M x N rooms laid out in a 2D grid. Our valiant knight (K) was initially positioned in the top-left room and must fight his way through the dungeon to rescue the princess.
 
 The knight has an initial health point represented by a positive integer. If at any point his health point drops to 0 or below, he dies immediately.
 
 Some of the rooms are guarded by demons, so the knight loses health (negative integers) upon entering these rooms; other rooms are either empty (0's) or contain magic orbs that increase the knight's health (positive integers).
 
 In order to reach the princess as quickly as possible, the knight decides to move only rightward or downward in each step.
 
 
 
 Write a function to determine the knight's minimum initial health so that he is able to rescue the princess.
 
 For example, given the dungeon below, the initial health of the knight must be at least 7 if he follows the optimal path RIGHT-> RIGHT -> DOWN -> DOWN.
 
 -2 (K)    -3    3
 -5    -10    1
 10    30    -5 (P)
 
 
 Note:
 
 The knight's health has no upper bound.
 Any room can contain threats or power-ups, even the first room the knight enters and the bottom-right room where the princess is imprisoned.
***/




class Solution174x1 {
    func calculateMinimumHP(_ dungeon: [[Int]]) -> Int {
        var m:Int = dungeon.count
        var n:Int = dungeon[0].count
        var dp:[Int] = [Int](repeating:Int.max,count:n + 1)
        dp[n - 1] = 1
        for i in (0..<m).reversed()
        {
            for j in (0..<n).reversed()
            {
                dp[j] = max(1, min(dp[j], dp[j + 1]) - dungeon[i][j])
            }
        }
        return dp[0]
    }
}


class Solution174x2 {
    
    func calculateMinimumHP(_ dungeon: [[Int]]) -> Int {
        let n = dungeon.count
        if n > 0 {
            let m = dungeon[0].count
            var c = [[Int]](repeating:[Int](repeating: .max, count: m + 1), count: n + 1)
            c[n][m-1] = 0
            c[n-1][m] = 0
            for i in stride(from: n-1, through: 0, by: -1) {
                for j in stride(from: m-1, through: 0, by: -1) {
                    let next = min(c[i+1][j],c[i][j+1])
                    var cur = -dungeon[i][j] + next
                    cur = max(cur, 0)
                    c[i][j] = cur
                }
            }
            return c[0][0] + 1
        } else {
            return 1
        }
    }
}


class Solution174x3 {
    func calculateMinimumHP(_ dungeon: [[Int]]) -> Int {
        let rows = dungeon.count
        let cols = dungeon[0].count
        var dp = Array(repeating: Array(repeating: Int.max, count: cols + 1), count: rows + 1)
        
        dp[rows][cols - 1] = 1
        dp[rows - 1][cols] = 1
        
        for i in stride(from: rows - 1, to: -1, by: -1 ) {
            for j in stride(from: cols - 1, to: -1, by: -1 ) {
                let mv = min(dp[i + 1][j], dp[i][j + 1]) - dungeon[i][j]
                dp[i][j] = mv <= 0 ? 1 : mv
            }
        }
        print(dp)
        return dp[0][0]
    }
}
