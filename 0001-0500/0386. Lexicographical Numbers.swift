class Solution {

    // Solution by Sergey Leschev

    // 386. Lexicographical Numbers
    // Given an integer n, return all the numbers in the range [1, n] sorted in lexicographical order.
    // You must write an algorithm that runs in O(n) time and uses O(1) extra space. 

    // Example 1:
    // Input: n = 13
    // Output: [1,10,11,12,13,2,3,4,5,6,7,8,9]

    // Example 2:
    // Input: n = 2
    // Output: [1,2]

    // Constraints:
    // 1 <= n <= 5 * 10^4

    func lexicalOrder(_ n: Int) -> [Int] {
        var ans = [Int]()


        func innerLexicalOrder(current: Int) {
            ans.append(current)
            for i in 0...9 {
                let next =  current * 10 + i
                guard next <= n else { return }
                innerLexicalOrder(current: next)
            }
        }

        for i in 1...9 where i <= n { innerLexicalOrder(current: i) }
        return ans
    }
    
 }