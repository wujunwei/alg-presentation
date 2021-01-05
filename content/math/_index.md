+++
title = "Algorithm"
description = "Algorithm presentations"
outputs = ["Reveal"]
[reveal_hugo]
margin = 0.02
transition = "slide"
transition_speed = "slow"
theme="beige"
[logo]
src = "index-logo.png"
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
输入: 3
输出: 3
```
```
输入: 4
输出: 5
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
### answer 2
{{% section %}}

<small>矩阵快速幂</small>

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
		for a > 1e9+7 {
			a -= 1e9 + 7
		}
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

### answer 4

```go
package main
func fib(n int) {
	nums := [30]int{1,1,2,3,5,8,13,21,34,55,89,144,233,377,610,987,1597,2584,4181,6765,10946,17711,28657,46368,75025,121393,196418,317811,514229,832040};
	return nums[n];
}
```

---

#### [返回](/#/8)


