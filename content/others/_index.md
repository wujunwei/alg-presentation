+++
title = "Algorithm"
description = "Algorithm presentations"
outputs = ["Reveal"]
[reveal_hugo]
margin = 0.02
transition = "slide"
transition_speed = "slow"
theme="sky"
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

[更多算法](https://www.processon.com/view/link/5ff6ab75f346fb340dedc38c)

[更多题目](http://192.168.138.67:30022/)
#### [下一节](/#/9)


