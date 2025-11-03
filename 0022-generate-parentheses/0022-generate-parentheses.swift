
class Solution {
    func generateParenthesis(_ n: Int) -> [String] {
        var result: [String] = []

        func solve(_ open: Int, _ close: Int, _ current: String) {
            if current.count == n * 2 {
                result.append(current)
            }

            if open < n {
                solve(open + 1, close, current + "(")
            }
            if close < open {
                solve(open, close + 1, current + ")")
            }
        }
        solve(0,0,"")
        return result
    }
}