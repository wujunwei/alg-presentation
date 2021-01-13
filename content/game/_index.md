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

<a href="http://118.25.25.221/avg" target="_blank">点击查看答案</a>

博弈只需领先一步，高人一筹！

{{% fragment %}}
|平均数|12~16|16~20|20~25|
|:----:|:----:|:----:|:----:|
|评价|很好|较好|一般|
{{% /fragment %}}

---

### 总结

{{% fragment %}}

博弈就是你中有我，我中有你。博弈的核心在于整体思维上的换位思考，用他人得益去推测他人行为，从而选择最有利于自己的策略。

{{% /fragment %}}

---

# 石子游戏

---

拜登和川普用偶数堆石子在做游戏，以谁手中的石子最多来决出下届总统。石子的总数是奇数，所以没有平局。
拜登和川普轮流进行，拜登先开始。 每回合，两人从行的开始或结束处取走整堆石头。 直到取完为止，此时手中石子最多的玩家获胜。
假设拜登和川普都发挥出最佳水平，当拜登必胜时返回true，否则返回false。

```
输入：[5,3,4,5]
输出：true
```
---

### answer 1

$dp[i][j]=max(piles[i]−dp[i+1][j],piles[j]−dp[i][j−1])$

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
#### [下一节](/#/7)


