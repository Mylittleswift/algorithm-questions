/***
 296: Best Meeting Point
 Medium
 
 A group of two or more people wants to meet and minimize the total travel distance. You are given a 2D grid of values 0 or 1, where each 1 marks the home of someone in the group. The distance is calculated using Manhattan Distance, where distance(p1, p2) = |p2.x - p1.x| + |p2.y - p1.y|.
 For example, given three people living at (0,0), (0,4), and (2,2):
 1 - 0 - 0 - 0 - 1
 |   |   |   |   |
 0 - 0 - 0 - 0 - 0
 |   |   |   |   |
 0 - 0 - 1 - 0 - 0
 The point (0,2) is an ideal meeting point, as the total travel distance of 2+2+2=6 is minimal.
 So return 6.
 ***/


class Solution296 {
    func minTotalDistance(_ grid:inout [[Int]]) -> Int {
        var rows:[Int] = [Int]()
        var cols:[Int] = [Int]()
        for i in 0..<grid.count
        {
            for j in 0..<grid[i].count
            {
                if grid[i][j] == 1
                {
                    rows.append(i)
                    cols.append(j)
                }
            }
        }
        cols.sort()
        var res:Int = 0
        var i:Int = 0
        var j:Int = rows.count - 1
        while(i < j)
        {
            res += (rows[j] - rows[i] + cols[j] - cols[i] )
            j -= 1
            i += 1
        }
        return res
    }
}
