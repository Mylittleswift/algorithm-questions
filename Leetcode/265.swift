/***
 265: Paint House II
 Medium
 
 There are a row of n houses, each house can be painted with one of the k colors. The cost of painting each house with a certain color is different. You have to paint all the houses such that no two adjacent houses have the same color.
 
 The cost of painting each house with a certain color is represented by a n x k cost matrix. For example, costs[0][0] is the cost of painting house 0 with color 0; costs[1][2] is the cost of painting house 1 with color 2, and so on... Find the minimum cost to paint all houses.
 
 Note:
 All costs are positive integers.
 
 Follow up:
 Could you solve it in O(nk) runtime?
 ***/



class Solution265 {
    func minCostII(_ costs: [[Int]]) -> Int {
        if costs.isEmpty || costs[0].isEmpty
        {
            return 0
        }
        var min1:Int = 0
        var min2:Int = 0
        var idx1:Int = -1
        for i in 0..<costs.count
        {
            var m1:Int = Int.max
            var m2:Int = m1
            var id1:Int = -1
            for j in 0..<costs[0].count
            {
                var cost:Int = costs[i][j] + (j == idx1 ? min2 : min1)
                if cost < m1
                {
                    m2 = m1
                    m1 = cost
                    id1 = j
                }
                else if cost < m2
                {
                    m2 = cost
                }
            }
            min1 = m1
            min2 = m2
            idx1 = id1
        }
        return min1
    }
}
