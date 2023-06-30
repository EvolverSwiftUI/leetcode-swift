class Solution {

    // Solution by Sergey Leschev

    // 1781. Sum of Beauty of All Substrings
    // The beauty of a string is the difference in frequencies between the most frequent and least frequent characters.
    // For example, the beauty of "abaacc" is 3 - 1 = 2.
    // Given a string s, return the sum of beauty of all of its substrings.

    // Example 1:
    // Input: s = "aabcb"
    // Output: 5
    // Explanation: The substrings with non-zero beauty are ["aab","aabc","aabcb","abcb","bcb"], each with beauty equal to 1.

    // Example 2:
    // Input: s = "aabcbaa"
    // Output: 17

    // Constraints:
    // 1 <= s.length <= 500
    // s consists of only lowercase English letters.

    func beautySum(_ s: String) -> Int {
        var ans = 0
        var counter = [Character:Int]()
        let n = s.count
        let chars = [Character](s)
        for i in 0..<(n - 1) {
            counter[chars[i], default: 0] += 1
            for j in (i + 1)..<n {
                counter[chars[j], default: 0] += 1
                ans += (counter.values.max() ?? 0) - (counter.values.min() ?? 0 )
            }
            counter = [:]
        }
        return ans
    }

}