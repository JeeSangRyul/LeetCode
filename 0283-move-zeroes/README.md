<h2><a href="https://leetcode.com/problems/move-zeroes">283. Move Zeroes</a></h2><h3>Easy</h3><hr><p>Given an integer array <code>nums</code>, move all <code>0</code>&#39;s to the end of it while maintaining the relative order of the non-zero elements.</p>

<p><strong>Note</strong> that you must do this in-place without making a copy of the array.</p>

<p>&nbsp;</p>
<p><strong class="example">Example 1:</strong></p>
<pre><strong>Input:</strong> nums = [0,1,0,3,12]
<strong>Output:</strong> [1,3,12,0,0]
</pre><p><strong class="example">Example 2:</strong></p>
<pre><strong>Input:</strong> nums = [0]
<strong>Output:</strong> [0]
</pre>
<p>&nbsp;</p>
<p><strong>Constraints:</strong></p>

<ul>
	<li><code>1 &lt;= nums.length &lt;= 10<sup>4</sup></code></li>
	<li><code>-2<sup>31</sup> &lt;= nums[i] &lt;= 2<sup>31</sup> - 1</code></li>
</ul>

<p>&nbsp;</p>
<strong>Follow up:</strong> Could you minimize the total number of operations done?


# 283.Move zeroes

```swift
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
```

(제약사항) 여분의 array는 만들지 말라는 제약이 있다.

two pointer 문제로 하나의 포인트는 while문에서 순회하면서 다른 포인터의 위치에 0이 아닌숫자를 옮겨주는 형식으로 풀었다.

마지막에는 다옮긴 후 그 이후 숫자들은 전부 0으로 채워주면 된다.
