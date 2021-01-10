+++
title = "Algorithm"
description = "Algorithm presentations"
outputs = ["Reveal"]
[reveal_hugo]
margin = 0.02
transition = "slide"
transition_speed = "slow"
theme="league"
+++

给定一个大小为 n 的数组，找到其中的多数元素。多数元素是指在数组中出现次数 大于 ⌊ n/2 ⌋ 的元素。


```
输入：[2,2,1,2,1,2,2,3,4]
输出：2
```
```
输入：[3,3,3,1,2]
输出：3
```
---
### answer 1

```go
package main
func majorityElement(nums []int) int {
	length := len(nums)
	count := make(map[int]int)
	for _, value := range nums {
		count[value]++
		if count[value] > length/2 {
            return value
		}
	}
	return -1
}

```

---

### answer 2

```go
package main
func majorityElement(nums []int) int {
	length := len(nums)
	sort.Ints(nums)
	return nums[length/2]
}
```
---

#### 摩尔投票法（Boyer–Moore majority vote algorithm）

{{% section %}}

以 `[2,2,1,3,1,2,2]` 为例。

遍历数组第一个元素 `2` 时，因 `major` 空缺，所以赋值 `major = 2`，且票数 `count = 1`：

![](/images/bm_1.png)

---

我们发现第二个元素依旧是「候选人」`2`，与 `major` 相同，因此将票数加一：

![](/images/bm_2.png)

---

第三个元素是 `1`，与 `major` 不同，因此发生「对抗」，将当前 `major` 的票数冲抵掉 1 票：

![](/images/bm_3.png)

---

第四个元素是 `3`，又与 `major` 不同，因此产生「对抗」，票数继续冲抵：

![](/images/bm_4.png)

---

当遍历到第五个元素 `1` 时，我们发现当前 `count` 已经归 `0`，说明 `major` 位置空缺，因此我们令 `major = 1`，且 `count = 1`：

![](/images/bm_5.png)

---

第六个元素是 `2`，与 `major` 不同，因此进行票数抵消，元素 `1` 刚上位又要下台了：

![](/images/bm_6.png)


---

此时 `count` 又归零了，因此当遍历到最后一个元素 `2` 时，令 `major = 2`，票数 `count = 1`：

![](/images/bm_7.png)

至此遍历结束，求出的多数元素为元素 `2`。
{{% /section %}}

---

### answer 3

```go
package main
func majorityElement(nums []int) int {
	count := 1
	index := nums[0]
	for i := 1 ; i < len(nums) ; i++{
		if nums[i] == index{
			count++
		}else{
			count--
			if count == 0{
				index = nums[i + 1]
			}
		}
	}
	return index
}
```

---

给定一个haystack 字符串和一个 needle 字符串，在 haystack 字符串中找出 needle 字符串出现的第一个位置 (从0开始)。如果不存在，则返回 -1。

示例 1：
```
输入: haystack = "hello", needle = "ll"
输出: 2
```
示例 2:
```
输入: haystack = "aaaaa", needle = "bba"
输出: -1
```
---

### answer 1

暴力（Brute Force）最直接的方法 - 沿着字符换逐步移动滑动窗口，将窗口内的子串与 needle 字符串比较。
![](/images/bf.png)

---

```go
package main
func strStr(haystack string, needle string) int {
    l1 := len(haystack)
    l2 := len(needle)
    if l2 == 0 {
        return 0
    }
    if l1 == 0 || l1 < l2 {
        return -1
    }
    for i := 0; i <= l1 - l2; i++ {
        if haystack[i : i + l2] == needle {
            return i
        }
    }
    return -1
}
```

---

### Rabin Karp(字符串哈希)

假设 needle="abcd",haystack="bcabcd"，needle转换为 [0,1,2,3],其hash值为
$$target =0×26^{3} +1×26^{2} +2×26^{1} +3×26^{0}$$

haystack的前4个字符转换为 [2,3,1,2], hash值为
$$h0 =2×26^{3} +3×26^{2} +1×26^{1} +2×26^{0}$$

---

### 如何避免溢出？

设置数值上限来避免溢出。设置数值上限可以用取模的方式，即用 h % modulus 来代替原本的哈希值。
对于这个问题来说$2^{31}$ 就足够了。
[证明](https://en.wikipedia.org/wiki/Linear_congruential_generator#Parameters_in_common_use)

---

```go
package main
const primeRK = 26
const mod uint64 = 1 << 32
func strStr(haystack string, needle string) int {
	var pow, sq uint64 = 1, primeRK
	for i := n; i > 0; i >>= 1 {
		if i&1 != 0 {
			pow *= sq
		}
		sq = sq * sq
		sq %= mod
	}
	n := len(needle)
	var h,target uint64
	for i := 0; i < n; i++ {
		h = ((h*primeRK)%mod + uint64(needle[i])) % mod
	}
	for i := 0; i < n; i++ {
		h = ((h*primeRK)%mod + uint64(haystack[i])) % mod
	}
	if h == target{
		return 0
    }
	for i := n; i < len(haystack); {
		h *= primeRK
		h %= mod
		h += uint64(haystack[i])
		h %= mod
		h -= (pow * uint64(haystack[i-n])) % mod
		h %= mod
		i++
		if h==target {
			return i - n
		}
	}
	return -1
}
```

---

### KMP （Boyer-Moore、Sunday）

![](/images/substrings.png)

---

```go
package main
func sunday(haystack, needle string) int {
	if len(needle) > len(haystack) {
		return -1
	}
	if needle == "" {
		return 0
	}
	//计算偏移表
	shiftMap := map[byte]int{}
	for i := len(needle) - 1; i > -1; i-- {
		if _, ok := shiftMap[needle[i]]; !ok {
			shiftMap[needle[i]] = len(needle) - i
		}
	}
	ans := 0
	for ans+len(needle) <= len(haystack) {
		// 判断是否匹配
		if haystack[ans:ans+len(needle)] == needle {
			return ans
		}
		// 不匹配情况下，根据下一个字符的偏移，移动ans
		if step, ok := shiftMap[haystack[ans+len(needle)]]; ok {
			ans += step
		} else {
			ans += len(needle) + 1
		}
	}
	return -1
}
```

---

[更多算法](https://www.processon.com/view/link/5ff6ab75f346fb340dedc38c)

#### [返回](/#/9)


