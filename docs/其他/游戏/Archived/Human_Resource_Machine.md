# Human Resource Machine

**Tetracontipler**

$2^4 \times 2^3 \times 3 = 40$

```
-- HUMAN RESOURCE MACHINE PROGRAM --

a:
    INBOX   
    COPYTO   0
    ADD      0
    COPYTO   0
    ADD      0
    COPYTO   0
    ADD      0
    COPYTO   0 // 此时内存单元 0 存储的是 n * 2^3
    ADD      0
    ADD      0 // 加上内存单元 0 三次, 即加上内存单元 0 乘以 3
    ADD      0
    ADD      0
    OUTBOX  
    JUMP     a
```

**Zero Preservation Initiative**

速度优化方式就是展开循环, 以减少 JUMP 指令的调用次数, 以空间换时间.

```
-- HUMAN RESOURCE MACHINE PROGRAM --

a:
b:
c:
    INBOX   
    JUMPZ    d
    JUMP     c
d:
    OUTBOX  
    INBOX   
    JUMPZ    e
    JUMP     b
e:
    OUTBOX  
    JUMP     a
```

**Equalization Room**

```
-- HUMAN RESOURCE MACHINE PROGRAM --

    JUMP     b
a:
    COPYFROM 0
    OUTBOX  
b:
c:
    INBOX   
    COPYTO   0
    INBOX   
    SUB      0
    JUMPZ    a
    JUMP     c
```

**Maximization Room**

```
-- HUMAN RESOURCE MACHINE PROGRAM --

a:
    INBOX   
    COPYTO   0
    INBOX   
    SUB      0
    JUMPN    b
    ADD      0
    JUMP     c
b:
    COPYFROM 0
c:
    OUTBOX  
    JUMP     a
```

**Exclusive Lounge**

Size:

```
-- HUMAN RESOURCE MACHINE PROGRAM --

a:
    INBOX   
    JUMPN    b
    INBOX   
    JUMPN    c
    JUMP     d
b:
    INBOX   
    JUMPN    e
c:
    COPYFROM 5
    JUMP     f
d:
e:
    COPYFROM 4
f:
    OUTBOX  
    JUMP     a
```

Speed:

```
-- HUMAN RESOURCE MACHINE PROGRAM --

a:
b:
    INBOX   
    JUMPN    c
    INBOX   
    JUMPN    d
    JUMP     e
c:
    INBOX   
    JUMPN    f
d:
    COPYFROM 5
    OUTBOX  
    JUMP     b
e:
f:
    COPYFROM 4
    OUTBOX  
    JUMP     a
```

**Absolute Positivity**

Size:

```
-- HUMAN RESOURCE MACHINE PROGRAM --

a:
    INBOX   
    JUMPN    c
b:
    OUTBOX  
    JUMP     a
c:
    COPYTO   0
    SUB      0
    SUB      0
    JUMP     b
```

Speed:

```
-- HUMAN RESOURCE MACHINE PROGRAM --

a:
b:
    INBOX   
    JUMPN    c
    OUTBOX  
    JUMP     b
c:
    COPYTO   0
    SUB      0
    SUB      0
    OUTBOX  
    JUMP     a
```

**Countdown**

Speed (79):

```
-- HUMAN RESOURCE MACHINE PROGRAM --

    JUMP     d
a:
b:
c:
    OUTBOX  
d:
    INBOX   
    JUMPZ    c
    COPYTO   0
    JUMPN    f
e:
    OUTBOX  
    BUMPDN   0
    JUMPZ    b
    JUMP     e
f:
g:
    OUTBOX  
    BUMPUP   0
    JUMPZ    a
    JUMP     g
```
