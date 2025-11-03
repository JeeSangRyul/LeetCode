<h2><a href="https://leetcode.com/problems/palindrome-partitioning/?envType=problem-list-v2&envId=23zq12nv">131. Palindrome Partitioning</a></h2><h3>Medium</h3><hr><p>Given a string <code>s</code>, partition <code>s</code> such that every <span data-keyword="substring-nonempty">substring</span> of the partition is a <span data-keyword="palindrome-string"><strong>palindrome</strong></span>. Return <em>all possible palindrome partitioning of </em><code>s</code>.</p>

<p>&nbsp;</p>
<p><strong class="example">Example 1:</strong></p>
<pre><strong>Input:</strong> s = "aab"
<strong>Output:</strong> [["a","a","b"],["aa","b"]]
</pre><p><strong class="example">Example 2:</strong></p>
<pre><strong>Input:</strong> s = "a"
<strong>Output:</strong> [["a"]]
</pre>
<p>&nbsp;</p>
<p><strong>Constraints:</strong></p>

<ul>
	<li><code>1 &lt;= s.length &lt;= 16</code></li>
	<li><code>s</code> contains only lowercase English letters.</li>
</ul>

# 131_Palindrome_Partitioning

### **DP로 풀 수 있는 문제인지 확인**

현재 직면한 문제가 작은 문제들로 이루어진 하나의 함수로 표현될 수 있는지를 판단해야 한다.

**보통 특정 데이터 내 최대화 / 최소화 계산을 하거나 특정 조건 내 데이터를 세야 한다거나 확률 등의 계산의 경우 DP로 풀 수 있는 경우가 많다.**

```swift
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
```

- dfs VS backtracking
    - dfs는 특정 조건에 맞다면 전부 조사함, 백트래킹은 가지치기가 추가되어서 끝까지 안가도돼서 시간을 더 줄여줌
- 회문이기 때문에 반을 갈라서 양쪽에서 체크하도록 함 → 하나라도 틀리면 false

### 주의할점

모르겠다면 무조건 그림을 그려보자…ㅠㅠ

## 🧭 1️⃣ DFS (Depth-First Search)

### 💡 핵심 특징

- “**모든 경우를 탐색하되**, 결과를 꼭 다 저장할 필요는 없음”
- 탐색 깊이 우선 (한 경로 끝까지 → 돌아와서 다음)
- **경로의 유효성만 검사**하거나, **최대/최소/존재 여부**를 찾는 문제

### ✅ 대표 예시

- 미로 탈출 (경로가 존재하는가?)
- 그래프 탐색 (방문 순서 찾기)
- 트리 순회 (inorder, preorder 등)

### 🔍 키워드로 감 잡기

- “존재하냐?”
- “최대/최소 깊이?”
- “탐색 순서?”
    
    → 👉 DFS일 확률 높음
    

---

## 🌲 2️⃣ 백트래킹 (Backtracking)

### 💡 핵심 특징

- DFS와 거의 같지만,
    
    **“불필요한 가지를 미리 쳐내서(가지치기)” 효율을 높임**
    
- 즉, **조건을 만족하지 않으면 더 이상 진행하지 않음**
- **모든 가능한 조합/순열/분할**을 찾되,
    
    조건이 맞는 것만 결과에 추가
    

### ✅ 대표 예시

- N-Queen
- 괄호 생성 (`Generate Parentheses`)
- 문자열 분할 (Palindrome Partitioning)
- 조합/순열 (`Combination Sum`, `Permutations`)

### 🔍 키워드로 감 잡기

- “모든 가능한 조합을 구하라”
- “조건을 만족하는 모든 경우를 반환하라”
- “가지치기” or “조건 만족 안 하면 스킵”
    
    → 👉 백트래킹
    

---

## 🧩 3️⃣ DP (Dynamic Programming)

### 💡 핵심 특징

- **부분 문제의 결과를 저장(memoization)** 하여
    
    **중복 계산을 피함**
    
- 즉, “이전 계산 결과를 재활용”
- **최적화(최대/최소/경로 수)** 문제에서 자주 등장

### ✅ 대표 예시

- 피보나치 수열
- 최소 경로 합 (`Minimum Path Sum`)
- 문자열 편집 거리 (Edit Distance)
- Knapsack (배낭 문제)
- Palindrome Partitioning 최소 분할 수 (← 백트래킹과 비슷하지만 “최소”라면 DP)

### 🔍 키워드로 감 잡기

- “최대/최소/최단/최적”
- “경로의 수”, “방법의 수”
- “부분 문제로 나누어 풀 수 있다”
    
    → 👉 DP
