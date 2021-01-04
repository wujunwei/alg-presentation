+++
title = "bit Algorithm"
description = "Algorithm presentations"
outputs = ["Reveal"]
[reveal_hugo]
margin = 0.02
transition = "slide"
transition_speed = "slow"
theme="league"
[logo]
src = "index-logo.png"
+++

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

        int xor = 0;
        for (int num : nums) {
            xor ^= num;
        } 

      
---

第二步：
取异或值最后一个二进制位为 1 的数字作为 mask，如果是 1 则表示两个数字在这一位上不同。
        
        int mask = xor & (-xor);

---

第三步：
通过与这个 mask 进行与操作，如果为 0 的分为一个数组，为 1 的分为另一个数组。这样就把问题降低成了：“有一个数组每个数字都出现两次，有一个数字只出现了一次，求出该数字”。对这两个子问题分别进行全异或就可以得到两个解。也就是最终的数组了。

        int[] ans = new int[2];
        for (int num : nums) {
            if ( (num & mask) == 0) {
                ans[0] ^= num;
            } else {
                ans[1] ^= num;
            }
        }

{{% /section %}}

---

#### [Start over](/#/4)


