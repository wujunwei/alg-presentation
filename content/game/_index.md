+++
title = "Algorithm"
description = "Algorithm presentations"
outputs = ["Reveal"]
[reveal_hugo]
margin = 0.02
transition = "slide"
transition_speed = "slow"
theme="beige"
+++

<h3 class="fragment fade-up">我们来玩个游戏</h3>
<h3 class="fragment fade-up" >心中想一个1~100的整数</h3>
<h3 class="fragment fade-up" >最接近所有人所想的数的平均数的一半就是赢家🏆</h3>
<small class="fragment fade-up" >PS:如果有多个人都最接近，取最早输入的人作为赢家</small>

---


A和B用几堆石子在做游戏。 游戏以谁手中的石子最多来决出胜负。石子的总数是奇数，所以没有平局。
A和B轮流进行，A先开始。 每回合，玩家从行的开始或结束处取走整堆石头。 直到取完为止，此时手中石子最多的玩家获胜。
假设A和B都发挥出最佳水平，当A赢得比赛时返回true，否则返回false。

```
输入：[5,3,4,5]
输出：true
解释：
A先开始，只能拿前 5 颗或后 5 颗石子 。
假设他取了前 5 颗，这一行就变成了 [3,4,5] 。
如果B拿走前 3 颗，那么剩下的是 [4,5]，A拿走后 5 颗赢得 10 分。
如果B拿走后 5 颗，那么剩下的是 [3,4]，A拿走后 4 颗赢得 9 分。
这表明，取前 5 颗石子对A来说是一个胜利的举动，所以我们返回 true 。
```
---

### answer 1

$$
dp[i][j]=max(piles[i]−dp[i+1][j],piles[j]−dp[i][j−1])
$$

```go
package main
func stoneGame(piles []int) bool {
    length := len(piles)
    dp := make([][]int, length)
    for i := 0; i < length; i++ {
        dp[i] = make([]int, length)
        dp[i][i] = piles[i]
    }
    for i := length - 2; i >= 0; i-- {
        for j := i + 1; j < length; j++ {
            dp[i][j] = max(piles[i] - dp[i+1][j], piles[j] - dp[i][j-1])
        }
    }
    return dp[0][length-1] > 0
}

func max(x, y int) int {
    if x > y {
        return x
    }
    return y
}
```

---

### answer 2

![](/images/stone.png)

---

```go
package main
func stoneGame(piles []int) bool {
    return true
}
```
#### [返回](/#/7)


