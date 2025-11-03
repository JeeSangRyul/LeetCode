class Solution {
    func moveZeroes(_ nums: inout [Int]) {
        var j = 0
        var i = 0
        while i < nums.count {
            if nums[i] != 0 {
                nums[j] = nums[i]
                j += 1
            }
            i += 1
        }

        for c in j..<nums.count {
            nums[c] = 0
        }
    }
}