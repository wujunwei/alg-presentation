+++
title = "Algorithm"
description = "Algorithm presentations"
outputs = ["Reveal"]
[reveal_hugo]
margin = 0.02
transition = "slide"
transition_speed = "slow"
theme="solarized"
+++

## 🐸跳台阶

---

一只青蛙一次可以跳上1级台阶，也可以跳上2级台阶。求该青蛙跳上一个n级的台阶总共有多少种跳法。
<br><br>
<small>PS：结果需对$10^{9}+7$ 取余</small>

```
输入: 2
输出: 2
```
```
输入: 4
输出: 5
```
```
输入: 54
输出: 267570670
解释：n=54时，共有86267571272种跳法，86267571272%1000000007=267570670
```
---

#### 💡

<ul>
  <li class="fragment fade-in">斐波那契数 $$F(n)=F(n-1)+F(n-2)$$</li>
  <li class="fragment fade-in">中国同余定理 $$c=a+b$$ 则 $$c\%m = (a\%m+b\%m)\%m$$</li>
</ul>


---

### answer 1

$$F(n)=(F(n-1)+F(n-2))\\%1000000007$$

```go
package main
func fib(n int) int {
	if n <=1 {
		return 1
    }
    return (fib(n-1)+fib(n-2))%(1e9+7)
}
```

---

### answer 2

$$F(n)=(F(n-1)+F(n-2))\\%1000000007$$

```go
package main
func fib(n int) int {
    if n < 2 {
        return n
    }
    p, q, r := 0, 0, 1
    for i := 2; i <= n; i++ {
        p = q
        q = r
        r = (p + q)%(1e9+7)
    }
    return r
}
```

---

### answer 3

{{% section %}}

<small>矩阵乘法➕快速幂</small>

$$
\left[
\begin{matrix}
1 & 1 \\\\
1 & 0
\end{matrix}
\right]
\left[
\begin{matrix}
F(n)\\\\
F(n - 1)
\end{matrix}
\right] =
\left[
\begin{matrix}
F(n) + F(n - 1)\\\\
F(n)
\end{matrix}
\right] =
\left[
\begin{matrix}
F(n + 1)\\\\
F(n)
\end{matrix}
\right]
$$

$$
\left[
\begin{matrix}
F(n + 1)\\\\
F(n)
\end{matrix}
\right] =
\left[
\begin{matrix}
1 & 1 \\\\
1 & 0
\end{matrix}
\right] ^n
\left[
\begin{matrix}
F(1)\\\\
F(0)
\end{matrix}
\right]
$$

---

```go
package main
type matrix [2][2]int

func multiply(a, b matrix) (c matrix) {
	for i := 0; i < 2; i++ {
		for j := 0; j < 2; j++ {
			c[i][j] = (a[i][0]*b[0][j] + a[i][1]*b[1][j])%(1e9+7)
		}
	}
	return
}

func pow(a matrix, n int) matrix {
	ret := matrix{{1, 0}, {0, 1}}
	for ; n > 0; n >>= 1 {
		if n&1 == 1 {
			ret = multiply(ret, a)
		}
		a = multiply(a, a)
	}
	return ret
}

func fib(n int) int {
	if n < 2 {
		return n
	}
	res := pow(matrix{{1, 1}, {1, 0}}, n-1)
	return res[0][0]
}
```
{{% /section %}}

---


$$F(n)=\frac{1}{\sqrt{5}}\left[ \left(\frac{1+\sqrt{5}}{2}\right)^{n} - \left(\frac{1-\sqrt{5}}{2}\right)^{n} \right]$$

```go
package main
func pow(a float64, n int) float64 {
	ret := 1
	for ; n > 0; n >>= 1 {
		if n&1 == 1 {
			ret = a
		}
		a = a * a
		a %= 1e9+7
	}
	return ret
}

func fib(n int) int {
    sqrt5 := math.Sqrt(5)
    p1 := pow((1+sqrt5)/2, float64(n))
    p2 := pow((1-sqrt5)/2, float64(n))
    return int(math.Round((p1 - p2) / sqrt5))
}
```

---

给你一个整数 n ，返回 和为 n 的完全平方数的最少数量 。

提示： 1 <= n <= 10000


```
输入：n = 12
输出：3 
解释：12 = 4 + 4 + 4
```
```
输入：n = 13
输出：2
解释：13 = 4 + 9
```
---

#### 方法一：动态规划

{{% section %}}

$f[i]$ 表示最少需要多少个数的平方来表示整数 $i$。
这些数必然落在区间 $[1,\\sqrt{n}]$。
$$
f[i]=1+\\min_{j=1}^{\\lfloor\\sqrt{i}\\rfloor}{f[i-j^2]}
$$

---

**复杂度分析**

- 时间复杂度：$O(n\\sqrt{n})$，其中 $n$ 为给定的正整数。
- 空间复杂度：$O(n)$。我们需要 $O(n)$ 的空间保存状态。
---

```go
func numSquares(n int) int {
    f := make([]int, n+1)
    for i := 1; i <= n; i++ {
        minn := math.MaxInt32
        for j := 1; j*j <= i; j++ {
            minn = min(minn, f[i-j*j])
        }
        f[i] = minn + 1
    }
    return f[n]
}
func min(a, b int) int {
    if a < b {
        return a
    }
    return b
}
```

{{% /section %}}

---

#### 方法二：数学

{{% section %}}

`拉格朗日四平方和定理`: 任意一个正整数都可以被表示为至多四个正整数的平方和。 同时四平方和定理包含了一个更强的结论：当且仅当 $n = 4^k \\times (8m+7)$ 时，$n$ 可以被表示为至多三个正整数的平方和。因此，当 $n = 4^k \\times (8m+7)$ 时，$n$ 只能被表示为四个正整数的平方和。

---

[//]: # (当 $n ≠ 4^k \\times &#40;8m+7&#41;$ 时，我们需要判断到底多少个完全平方数能够表示 $n$，我们知道答案只会是 $1,2,3$ 中的一个：)
-  $1$ ：则必有 $n$ 为完全平方数，这很好判断；
-  $2$ ：则有 $n=a^2+b^2$，我们只需要枚举所有的 $a(1 \\leq a \\leq \\sqrt{n})$，判断 $n-a^2$ 是否为完全平方数即可；
-  $3$ ：我们很难在一个优秀的时间复杂度内解决它，但我们只需要检查答案为 $1$ 或 $2$ 的两种情况，即可利用排除法确定答案。

---

```go
// 判断是否为完全平方数
func isPerfectSquare(x int) bool {
    y := int(math.Sqrt(float64(x)))
    return y*y == x
}
// 判断是否能表示为 4^k*(8m+7)
func checkAnswer4(x int) bool {
    for x%4 == 0 {
        x /= 4
    }
    return x%8 == 7
}
func numSquares(n int) int {
    if isPerfectSquare(n) {
        return 1
    }
    if checkAnswer4(n) {
        return 4
    }
    for i := 1; i*i <= n; i++ {
        j := n - i*i
        if isPerfectSquare(j) {
            return 2
        }
    }
    return 3
}
```

- 时间复杂度：$O(\\sqrt{n})$
- 空间复杂度：$O(1)$

{{% /section %}}

---

#### [下一节](/#/8)


