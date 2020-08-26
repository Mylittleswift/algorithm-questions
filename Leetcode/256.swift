/***
 256. Paint House
 Medium
 
 Problem:
 There are a row of n houses, each house can be painted with one of the three colors: red, blue or green. The cost of painting each house with a certain color is different. You have to paint all the houses such that no two adjacent houses have the same color.
 
 The cost of painting each house with a certain color is represented by a n x 3 cost matrix. For example, costs[0][0] is the cost of painting house 0 with color red; costs[1][2] is the cost of painting house 1 with color green, and so on... Find the minimum cost to paint all houses.
 
 Note:
 All costs are positive integers.
 ***/


class Solution256 {
    func minCost(_ costs:[[Int]]) -> Int{
        if costs.isEmpty || costs[0].isEmpty
        {
            return 0
        }
        var dp:[[Int]] = costs
        for i in 1..<dp.count
        {
            for j in 0..<3
            {
                dp[i][j] += min(dp[i - 1][(j + 1) % 3], dp[i - 1][(j + 2) % 3])
            }
        }
        return min(min(dp.last![0], dp.last![1]), dp.last![2])
    }
}
