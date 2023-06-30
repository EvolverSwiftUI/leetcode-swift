class Solution {

    // Solution by Sergey Leschev

    // 825. Friends Of Appropriate Ages
    // Some people will make friend requests. The list of their ages is given and ages[i] is the age of the ith person. 
    // Person A will NOT friend request person B (B != A) if any of the following conditions are true:
    // age[B] <= 0.5 * age[A] + 7
    // age[B] > age[A]
    // age[B] > 100 && age[A] < 100
    // Otherwise, A will friend request B.
    // Note that if A requests B, B does not necessarily request A.  Also, people will not friend request themselves.
    // How many total friend requests are made?

    // Example 1:
    // Input: [16,16]
    // Output: 2
    // Explanation: 2 people friend request each other.

    // Example 2:
    // Input: [16,17,18]
    // Output: 2
    // Explanation: Friend requests are made 17 -> 16, 18 -> 17.

    // Example 3:
    // Input: [20,30,100,110,120]
    // Output: 3
    // Explanation: Friend requests are made 110 -> 100, 120 -> 110, 120 -> 100. 

    // Notes:
    // 1 <= ages.length <= 20000.
    // 1 <= ages[i] <= 120.

    func numFriendRequests(_ ages: [Int]) -> Int {
        var ageCount = Array(repeating: 0, count: 121)
        var sumCount = Array(repeating: 0, count: 121)
        var ans = 0

        for age in ages { ageCount[age] += 1 }
        for i in 1...120 { sumCount[i] = sumCount[i - 1] + ageCount[i] }

        for i in 15...120 {
            if ageCount[i] == 0 { continue }
            let count = sumCount[i] - sumCount[i / 2 + 7]
            ans += count * ageCount[i] - ageCount[i]
        }

        return ans
    }

}