class Solution {

    // Solution by Sergey Leschev

    // 122. Best Time to Buy and Sell Stock II
    // You are given an array prices where prices[i] is the price of a given stock on the ith day.
    // Find the maximum profit you can achieve. You may complete as many transactions as you like (i.e., buy one and sell one share of the stock multiple times).
    // Note: You may not engage in multiple transactions simultaneously (i.e., you must sell the stock before you buy again).

    // Finds the maximum profit.

    // - Parameter prices: An array where the i-th element is the price of a given stock on day i.
    // - Returns: Maximum profit.

    // Example 1:
    // Input: prices = [7,1,5,3,6,4]
    // Output: 7
    // Explanation: Buy on day 2 (price = 1) and sell on day 3 (price = 5), profit = 5-1 = 4.
    // Then buy on day 4 (price = 3) and sell on day 5 (price = 6), profit = 6-3 = 3.

    // Example 2:
    // Input: prices = [1,2,3,4,5]
    // Output: 4
    // Explanation: Buy on day 1 (price = 1) and sell on day 5 (price = 5), profit = 5-1 = 4.
    // Note that you cannot buy on day 1, buy on day 2 and sell them later, as you are engaging multiple transactions at the same time. You must sell before buying again.

    // Example 3:
    // Input: prices = [7,6,4,3,1]
    // Output: 0
    // Explanation: In this case, no transaction is done, i.e., max profit = 0.
     
    // Constraints:
    // 1 <= prices.length <= 3 * 10^4
    // 0 <= prices[i] <= 10^4

    // - Complexity:
    //   - time: O(n), where n is the length of the prices.
    //   - space: O(1), only constant space is used.
    
    func maxProfit(_ prices: [Int]) -> Int {
        guard !prices.isEmpty else { return 0 }
        
        var ans = 0
        
        for i in 1..<prices.count {
            guard prices[i] > prices[i - 1] else { continue }
            ans += prices[i] - prices[i - 1]
        }
        
        return ans
    }

}