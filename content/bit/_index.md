+++
title = "bit Algorithm"
description = "Algorithm presentations"
outputs = ["Reveal"]
[reveal_hugo]
margin = 0.02
transition = "slide"
transition_speed = "slow"
theme="serif"
+++

### 基础知识

|符号|描述|运算规则|
|:----:|:----:|:----:|
|&|与|两个位都为1时，结果才为1|
|\||或|两个位都为0时，结果才为0|
|^|异或|两个位相同为0，相异为1|
|~|取反|0变1，1变0|
|<<|左移|各二进位全部左移若干位，高位丢弃，低位补0|
|>>|右移|各二进位全部右移若干位|

---

##### 💡tips

{{% section %}}

```c++
//做乘法运算
int a = 2;
a >> 1; // 1
a << 1; // 4
```

```c++
//判断奇偶
if(0 == (a & 1)) {
 //偶数
}
```

```c++
// 改变符号
int reversal(int a) {
  return ~a + 1;
}
```
---

|功能|示例|位运算|
|:----:|:----:|:----:|
| 把右数第k位变成1| (101001->101101,k=3)| x \| (1 << (k-1)) |
| 把右数第k位变成0| (101101->101001,k=3)| x & ~ (1 << (k-1)) |
| 右数第k位取反| (101001->101101,k=3)| x ^ (1 << (k-1)) |
| 取末三位| (1101101->101)| x & 7 |
| 取末k位| (1101101->1101,k=5)| x & (1 << k-1) |
| 把右边连续的1变成0| (100101111->100100000)| x & (x+1) |
| 把右起第一个0变成1| (100101111->100111111)| x \| (x+1) |
| 把右边连续的0变成1| (11011000->11011111)| x \| (x-1) |
| 取右边连续的1| (100101111->1111)| (x ^ (x+1)) >> 1 |
| 把右起第一个1变成0| (100101000->100100000)| x ^ (x-1) |


{{% /section %}}

---

<small> 给定一个非空整数数组，除了某个元素只出现一次以外，其余每个元素均出现两次。找出那个只出现了一次的元素。</small>


示例 1:
```
输入: [2,2,1]
输出: 1
```

示例 2:
```
输入: [4,1,2,1,2]
输出: 4
```

---

### answer

```go
package main
func singleNumber(nums []int) int {
	result := 0
	for _,num :=range nums{
		result ^=num
	}
	return result
}
```

---

<small> 给定一个整数数组 nums，其中恰好有两个元素只出现一次，其余所有元素均出现两次。 找出只出现一次的那两个元素。</small>

示例 :
```
输入: [1,2,1,3,2,5]
输出: [3,5]
```

---

### answer

{{% section %}}

#### 第一步：
把所有的元素进行异或操作，最终得到一个异或值。因为是不同的两个数字，所以这个值必定不为 0；

```c++
int xor = 0;
for (int num : nums) {
    xor ^= num;
}
//xor=3^5(11^101=110)
```


      
---

第二步：
取xor最后一个二进制位为 1 的数字作为 mask，表示两个数字在这一位上不同。

```c++
int mask = xor & (-xor);//mask = 2(10)
```        


---

第三步：

![](/images/mask.png)

---
```golang
package main
func singleNumber(arr []int) []int {
	var result []int
	if arr == nil {
		return result
	}
	xor := 0
	// 计算数组中所有数字异或的结果
	for _, v := range arr {
		xor ^= v
	}
	position := 0
	for i := xor; i&1 == 0; i >>= 1 {
		position++
	}
	// 异或的结果与所有第position位为1的数字异或
	// 结果一定是出现一次的两个数中的一个
	tempXor := xor
	for _, v := range arr {
		if (uint(v)>>uint(position))&1 == 1 {
			xor ^= v
		}
	}
	// 得到另外一个出现一次的数字
	return []int{xor, xor ^ tempXor}
}
```

{{% /section %}}

---

#### [返回](/#/6)


