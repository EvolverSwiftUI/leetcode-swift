class Solution {

    // Solution by Sergey Leschev

    // 1513. Number of Substrings With Only 1s
    // Given a binary string s (a string consisting only of '0' and '1's).

    // Return the number of substrings with all characters 1's.

    // Since the answer may be too large, return it modulo 10^9 + 7.

    // Example 1:
    // Input: s = "0110111"
    // Output: 9
    // Explanation: There are 9 substring in total with only 1's characters.
    // "1" -> 5 times.
    // "11" -> 3 times.
    // "111" -> 1 time.

    // Example 2:
    // Input: s = "101"
    // Output: 2
    // Explanation: Substring "1" is shown 2 times in s.

    // Example 3:
    // Input: s = "111111"
    // Output: 21
    // Explanation: Each substring contains only 1's characters.

    // Example 4:
    // Input: s = "000"
    // Output: 0

    // Constraints:
    // s[i] == '0' or s[i] == '1'
    // 1 <= s.length <= 10^5

    private let mod = 1_000_000_007


    func numSub(_ s: String) -> Int {
        var ans = 0
        var cntOnes = 0

        for ch in s {
            if ch == "0" {
                if cntOnes != 0 {
                    ans += (cntOnes * (1 + cntOnes)) >> 1
                    ans %= mod
                }
                cntOnes = 0
            } else {
                cntOnes += 1
            }
        }

        if cntOnes != 0 {
            cntOnes %= mod
            ans += (cntOnes * (1 + cntOnes)) >> 1
            ans %= mod
        }
        
        return ans
    }

}