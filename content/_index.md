+++
title = "Algorithm"
description = "Algorithm presentations"
outputs = ["Reveal"]
[reveal_hugo]
margin = 0.02
transition = "cube"
transition_speed = "slow"
auto_animate = true
+++

# 有趣的算法

<small> provided by 吴俊伟 </small>

---
## 什么是算法?

方案、指令、策略、机制

{{% fragment %}}
- 有穷性
- 确切性
- 输入项、输出项
- 可行性 
{{% /fragment %}}
  
---

### 如何描述一个算法的优劣?

{{% section %}}

算法 = 🐴

---

时间复杂度：执行算法所需要的计算工作量

空间复杂度：算法需要消耗的内存空间

---

$$
O(1)<O(\log_2{N})<O(N)<O(N^2)<O(2^N)<O(N!)
$$

|  输入数据长度   |     可接受复杂度      |
|:---------:|:---------------:|
| $≤10^{9}$ | $O(\log_2{N})$  |
| $≤10^{6}$ |     $O(N)$      |
| $≤10^{5}$ | $O(N\log_2{N})$ |
|  $≤1000$  |     $N^{2}$     |
---

![](/images/sort.png)

{{% /section %}}

---

# 怎么做？

[举个🌰](/example/)

---

纸上得来终觉浅,绝知此事要躬行

---

# bit

[💪去做题](/bit/)

---

# 博弈论

[💪玩游戏](/game/)

---

# 数学

[💪去做题](/math/)

---

# 一些有趣的算法题

[💪去做题](/others/)

---

<h1 class="fragment fade-out" data-autoslide="1000">thank you</h1>
<h1 class="fragment fade-up" >end</h1>