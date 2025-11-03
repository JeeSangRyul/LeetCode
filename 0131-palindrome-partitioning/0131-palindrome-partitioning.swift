class Solution {
    func isPalindrome(_ s: String) -> Bool {
        let chars = Array(s)
        var left: Int = 0
        var right: Int = chars.count - 1

        while left < right {
            if chars[left] != chars[right] { return false }
            left += 1
            right -= 1
        }

        return true
    }
    
    func partition(_ s: String) -> [[String]] {
        var result = [[String]]()

        func backTracking(_ start: Int, _ path: [String]) {
            if start == s.count {
                result.append(path)
                return
            }

            let chars = Array(s)

            for end in start..<s.count {
                let sub = String(chars[start...end])

                if isPalindrome(sub) {
                    backTracking(end + 1, path + [sub])
                }
            }
        }
        backTracking(0, [])
        return result
    }
}