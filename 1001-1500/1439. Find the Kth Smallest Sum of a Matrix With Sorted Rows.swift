class Solution {

    // Solution by Sergey Leschev

    // 1439. Find the Kth Smallest Sum of a Matrix With Sorted Rows
    // You are given an m * n matrix, mat, and an integer k, which has its rows sorted in non-decreasing order.
    // You are allowed to choose exactly 1 element from each row to form an array. Return the Kth smallest array sum among all possible arrays.

    // Find the Kth Smallest Sum of a Matrix With Sorted Rows

    // Example 1:
    // Input: mat = [[1,3,11],[2,4,6]], k = 5
    // Output: 7
    // Explanation: Choosing one element from each row, the first k smallest sum are:
    // [1,2], [1,4], [3,2], [3,4], [1,6]. Where the 5th sum is 7.  

    // Example 2:
    // Input: mat = [[1,3,11],[2,4,6]], k = 9
    // Output: 17

    // Example 3:
    // Input: mat = [[1,10,10],[1,4,5],[2,3,6]], k = 7
    // Output: 9
    // Explanation: Choosing one element from each row, the first k smallest sum are:
    // [1,1,2], [1,1,3], [1,4,2], [1,4,3], [1,1,6], [1,5,2], [1,5,3]. Where the 7th sum is 9.  

    // Example 4:
    // Input: mat = [[1,1,10],[2,2,9]], k = 7
    // Output: 12

    // Constraints:
    // m == mat.length
    // n == mat.length[i]
    // 1 <= m, n <= 40
    // 1 <= k <= min(200, n ^ m)
    // 1 <= mat[i][j] <= 5000
    // mat[i] is a non decreasing array.

    // - Complexity:
    //   - time: O(k* n log n) n is rows

    func kthSmallest(_ mat: [[Int]], _ k: Int) -> Int {
        var arr = mat[0]
        let rows = mat.endIndex
        let cols = mat[0].endIndex
        var i = 1

        while i < rows {
            var nextRow = [Int]()
            for j in 0..<cols {
                for n in arr { nextRow.append(mat[i][j] + n) }
            }
            nextRow.sort()
            arr = Array(nextRow[0..<(min(k, nextRow.endIndex))])
            i += 1
        }
        return arr[k - 1]
    }

}