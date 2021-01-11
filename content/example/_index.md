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

输入 A，B 两个数字（均小于100），返回A+B。

```
输入: 1 2 
输出: 3
```
```
输入: 45 67
输出: 112
```

---

{{% section %}}

### c

```c
#include <stdio.h>

int main() {
    int a,b;
    scanf("%d%d",&a,&b);
    printf("%d", a+b);
    return 0;
}
```

---

### c++

```c++
#include <iostream>
#include <cstdio>

using namespace std;

int main() {
    int a,b;
    cin >> a >> b;
    cout << a+b;
    return 0;
}
```

---

### c#

```c#
using System;

public class APlusB{
    private static void Main(){
        string[] input = Console.ReadLine().Split(' ');
        Console.WriteLine(int.Parse(input[0]) + int.Parse(input[1]));
    }
}
```

---

### python

```python
s = raw_input().split()
print int(s[0]) + int(s[1])
```

```python
s = input().split()
print(int(s[0]) + int(s[1]))
```

---

### ruby

```ruby
a, b = gets.split.map(&:to_i)
print a+b
```

---

### php

```php
<?php
$input = trim(file_get_contents("php://stdin"));
list($a, $b) = explode(' ', $input);
echo $a + $b;
```

---

### rust

```rust
use std::io;

fn main(){
    let mut input=String::new();
    io::stdin().read_line(&mut input).unwrap();
    let mut s=input.trim().split(' ');

    let a:i32=s.next().unwrap()
               .parse().unwrap();
    let b:i32=s.next().unwrap()
               .parse().unwrap();
    println!("{}",a+b);
}
```

---

### golang

```go
package main

import "fmt"

func main() {
    var a, b int
    fmt.Scanf("%d%d", &a, &b)
    fmt.Println(a+b)
}
```

---

### 文言([编程语言：文言文](https://github.com/wenyan-lang/wenyan))

```文言文
施「require('fs').readFileSync」於「「/dev/stdin」」。名之曰「數據」。
施「(buf => buf.toString().trim())」於「數據」。昔之「數據」者。今其是矣。
施「(s => s.split(' '))」於「數據」。昔之「數據」者。今其是矣。
注曰。「「文言尚菜，無對象之操作，故需 JavaScript 之语法」」。

夫「數據」之一。取一以施「parseInt」。名之曰「甲」。
夫「數據」之二。取一以施「parseInt」。名之曰「乙」。

加「甲」以「乙」。書之。
```

{{% /section %}}

---

{{% section %}}

![](/images/img.png)

---

![](/images/img2.png)

{{% /section %}}

---

#### [返回](/#/4)

