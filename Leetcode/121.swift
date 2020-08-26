/***
 121. Best Time to Buy and Sell Stock
 Easy

 Say you have an array for which the ith element is the price of a given stock on day i.
 
 If you were only permitted to complete at most one transaction (i.e., buy one and sell one share of the stock), design an algorithm to find the maximum profit.
 
 Note that you cannot sell a stock before you buy one.
 
 Example 1:
 
 Input: [7,1,5,3,6,4]
 Output: 5
 Explanation: Buy on day 2 (price = 1) and sell on day 5 (price = 6), profit = 6-1 = 5.
 Not 7-1 = 6, as selling price needs to be larger than buying price.
 Example 2:
 
 Input: [7,6,4,3,1]
 Output: 0
 Explanation: In this case, no transaction is done, i.e. max profit = 0.
 ***/



class Solution121x1 {
    func maxProfit(_ prices: [Int]) -> Int {
        if prices == nil || prices.count == 0
        {
            return 0
        }
        let counts = prices.count
        var arr:Array = Array(repeating: 0, count: counts)
        var minPrice = prices[0]
        for i in 1..<counts
        {
            minPrice = (minPrice < prices[i]) ? minPrice : prices[i]
            arr[i] = (arr[i - 1] > (prices[i] - minPrice)) ? arr[i - 1] : (prices[i] - minPrice)
        }
        return arr[counts-1]
        
    }
}


class Solution121x2 {
    func maxProfit(_ prices: [Int]) -> Int {
        guard prices.count > 0 else {
            return 0
        }
        
        var maxProfit = 0
        var middleProfit = 0
        for i in 1..<prices.count {
            middleProfit = max(prices[i] - prices[i - 1] + middleProfit, 0)
            maxProfit = max(maxProfit, middleProfit)
        }
        
        return maxProfit
    }
}


class Solution121x3 {
    func maxProfit(_ prices: [Int]) -> Int {
        guard prices.count >= 2 else {
            return 0
        }
        var dif = 0
        var profit = 0
        for i in 1..<prices.count {
            dif = max(dif+prices[i]-prices[i-1],0)
            profit = max(dif,profit)
        }
        return profit
    }
}
