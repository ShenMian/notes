# Petri 网

**英文**: Petri net

## 简介

![Petri net](assets/petri_net.jpg){ width=80% style="display: block; margin: 0 auto" }

Petri 网是用于描述分布式系统的数学建模语言, 名称来源于发明者 Carl Adam Petri, 最初目的是用于描述化学过程.  
通过 Petri 网对并发系统进行建模后, 就可以利用其数学特性进行分析.

Petri 网由三种元素组成:

1. **库所(Place)**: 即上图的圆形节点.
2. **变迁(Transition)**: 即上图的方形节点.
3. **有向弧(Arc)**: 用于连接库所和变迁.

## 定义

Petri 网是一个三元组 $N = (P, T, F)$, 其中:

- $P$ 和 $T$ 是两个不相交的有限集, 分别表示库所和变迁.
- $F \subseteq (P \times T) \cup (T \times P)$ 是弧的集合.

---

令牌(Token).

---

```txt
place <place_name>
transition <transition_name>

p1(red)
p2(yellow)
p3(green)
t1[]
t2[]
t3[]

p1 -> t1 -> p2 -> t2 -> p3 -> t3 -> p1
```

```rs
struct Place {
    label: String,
    next: Vec<Rc<Transition>>,
}

struct Transition {
    next: Vec<Rc<Place>>,
}
```

## 参见

- <https://pes.vsb.cz/petrineteditor/>.
- [Petri Net Markup Language](https://www.pnml.org/papers/PNML_CTT.pdf).
- <http://petrinet.org/>.
