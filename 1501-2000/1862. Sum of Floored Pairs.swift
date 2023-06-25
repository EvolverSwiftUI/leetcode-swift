class Solution {

    // Solution @ Sergey Leschev

    // 1862. Sum of Floored Pairs
    // Given an integer array nums, return the sum of floor(nums[i] / nums[j]) for all pairs of indices 0 <= i, j < nums.length in the array. Since the answer may be too large, return it modulo 109 + 7.
    // The floor() function returns the integer part of the division.

    // Example 1:
    // Input: nums = [2,5,9]
    // Output: 10
    // Explanation:
    // floor(2 / 5) = floor(2 / 9) = floor(5 / 9) = 0
    // floor(2 / 2) = floor(5 / 5) = floor(9 / 9) = 1
    // floor(5 / 2) = 2
    // floor(9 / 2) = 4
    // floor(9 / 5) = 1
    // We calculate the floor of the division for every pair of indices in the array then sum them up.

    // Example 2:
    // Input: nums = [7,7,7,7,7,7,7]
    // Output: 49

    // Constraints:
    // 1 <= nums.length <= 10^5
    // 1 <= nums[i] <= 10^5

    private let mod  = 1_000_000_007


    func sumOfFlooredPairs(_ nums: [Int]) -> Int {
        var ans = 0
        let maxEle = nums.max()!
        let minEle = nums.min()!
        var counter = [Int](repeating: 0, count: maxEle  + 1)
        var preffix = [0]
        

        func getSum(of num:  Int) -> Int {
            var t = 0
            var d = 1
            while d * num <= maxEle {
                t  += d * (preffix[min(maxEle + 1, (d + 1) * num)] - preffix[d * num])
                d += 1
            }
            return t
        }

        for num in nums { counter[num] += 1 }
        for cnt in counter { preffix.append(preffix.last! + cnt) }

        for idx in minEle...maxEle where counter[idx] > 0 {
            ans += (counter[idx] * getSum(of: idx) % mod)
            ans %= mod
        }
        return ans % mod
    }

}