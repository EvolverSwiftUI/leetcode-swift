class Solution {

    // 1334. Find the City With the Smallest Number of Neighbors at a Threshold Distance
    // There are n cities numbered from 0 to n-1. Given the array edges where edges[i] = [fromi, toi, weighti] represents a bidirectional and weighted edge between cities fromi and toi, and given the integer distanceThreshold.
    // Return the city with the smallest number of cities that are reachable through some path and whose distance is at most distanceThreshold, If there are multiple such cities, return the city with the greatest number.
    // Notice that the distance of a path connecting cities i and j is equal to the sum of the edges' weights along that path.

    // Example 1:
    // Input: n = 4, edges = [[0,1,3],[1,2,1],[1,3,4],[2,3,1]], distanceThreshold = 4
    // Output: 3
    // Explanation: The figure above describes the graph. 
    // The neighboring cities at a distanceThreshold = 4 for each city are:
    // City 0 -> [City 1, City 2] 
    // City 1 -> [City 0, City 2, City 3] 
    // City 2 -> [City 0, City 1, City 3] 
    // City 3 -> [City 1, City 2] 
    // Cities 0 and 3 have 2 neighboring cities at a distanceThreshold = 4, but we have to return city 3 since it has the greatest number.

    // Example 2:
    // Input: n = 5, edges = [[0,1,2],[0,4,8],[1,2,3],[1,4,2],[2,3,1],[3,4,1]], distanceThreshold = 2
    // Output: 0
    // Explanation: The figure above describes the graph. 
    // The neighboring cities at a distanceThreshold = 2 for each city are:
    // City 0 -> [City 1] 
    // City 1 -> [City 0, City 4] 
    // City 2 -> [City 3, City 4] 
    // City 3 -> [City 2, City 4]
    // City 4 -> [City 1, City 2, City 3] 
    // The city 0 has 1 neighboring city at a distanceThreshold = 2.

    // Constraints:
    // 2 <= n <= 100
    // 1 <= edges.length <= n * (n - 1) / 2
    // edges[i].length == 3
    // 0 <= fromi < toi < n
    // 1 <= weighti, distanceThreshold <= 10^4
    // All pairs (fromi, toi) are distinct.

    func findTheCity(_ n: Int, _ edges: [[Int]], _ distanceThreshold: Int) -> Int {
        var distanceMap = Array(repeating: Array(repeating: 10001, count: n), count: n)
        var answer = 0
        var minValue = Int.max

        for (_, yelement) in edges.enumerated(){    
            let from = yelement[0]
            let to = yelement[1]
            let weight = yelement[2]
            distanceMap[from][to] = weight
            distanceMap[to][from] = weight
        }
        
        for node in 0..<n { distanceMap[node][node] = 0 }
        
        for middlePoint in 0..<n{
            for startPoint in 0..<n{
                for endPoint in 0..<n{
                    if distanceMap[startPoint][middlePoint] + distanceMap[middlePoint][endPoint] < distanceMap[startPoint][endPoint]{
                        distanceMap[startPoint][endPoint] = distanceMap[startPoint][middlePoint] + distanceMap[middlePoint][endPoint]
                    }
                }
            }
        }
        
        for (yindex , yelement) in distanceMap.enumerated() {
            var cnt = 0

            for (xindex , xelement) in yelement.enumerated() where xindex != yindex && xelement <= distanceThreshold { cnt += 1  }
            
            if minValue >= cnt {
                minValue = cnt
                answer = yindex
            }
        }
        
        return answer
    }

}