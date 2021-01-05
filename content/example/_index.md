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

给你一个长度为n的数组nums， 其中 n>1,返回nums中除nums[i]之外其余各元素的乘积。



```
输入: [1,2,3,4]
输出: [24,12,8,6]
```

---

{{% section %}}

![](/images/238_1.png)

---

![](/images/238_2.png)

---

![](/images/238_3.png)

---

![](/images/238_4.png)

---

![](/images/238_5.png)

---

![](/images/238_6.png)

---

![](/images/238_7.png)

---

![](/images/238_8.png)

---

![](/images/238_9.png)

---

![](/images/238_10.png)

{{% /section %}}

---

### answer

```go
package main
func productExceptSelf(nums []int) []int {
    length := len(nums)
    answer := make([]int, length)
    answer[0] = 1
    for i := 1; i < length; i++ {
        answer[i] = nums[i-1] * answer[i-1]
    }
    R := 1
    for i := length - 1; i >= 0; i-- {
        answer[i] = answer[i] * R
        R *= nums[i]
    }
    return answer
}

```

---
#### [返回](/#/4)

