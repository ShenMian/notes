发明者: Vapinik \[苏\]

Linear support vector machine(LSVM) in the linearly separable case and Hard Margin Maximization.

LSVM in the linearly separable case suppose a training dataset in a feature space, is given 
   $$T = \{(x_1. y_1), (x_2, y_2), ..., (x_n, y_n)\}$$
   where $x_i \in X$ = $R^n$, $y_i \in Y = \{+1, -1\}$, $i=1,2,...,N$.
   
   Definition (linear separability of dataset)
   Given T, if there is a hyper plane (超平面)
   $$S: \omega \cdot X + b = 0$$
   Than can precisely divide the positive instance points and negative instance points of dataset into both sides of the hyper plane.
   
   i.e. For all instances $i$ with $y_i=+1$, $W \cdot x + b > 0$ and for all instances with $y_i$=-1, $\omega \cdot x + b < 0$. Then the dataset T is called a linearly separate data.

---

```
^
|   \   o
|    \     o
| x   \  o
|  x   \   o
| x  x  \
+---------------->
```
- `o` indicates positive instance points.
- `x` indicates negative instance points.

Find:
1. $\omega^* \cdot x + b^* = 0$
2. $f(x) = sign(\omega^* \cdot x + b^*)$

---

Function margin and Geometric margin

1. Function margin: with regard to the give training dataset T and the hyperplane($W$, $b$). Define the functional margin of hyperplane on sample point $(x_i, y_i)$ as
   $$\hat{\gamma}_i = y_i(\omega \cdot x_i + b)$$
   $$\hat{\gamma} = \min_{i=0,...,N}\hat{\gamma}_i$$
2. Two facts
	1. $(\omega^*, b^*)$ 与 $(a\omega^*, ab^*)$ 相同.
	2. Distance from $(x_0, y_0)$ to the plane $\omega_1x + \omega_2y + b = 0$:
	   $$d = \frac{|\omega_1x + \omega_2y + b|}{\sqrt{\omega_1^2 + \omega_2^2}} = \frac{|\omega_1x + \omega_2y + b|}{||\omega||}$$
	   Vector $\vec{x}_0$ to the hyperplane $\omega_1x + \omega_2y + b = 0$:
	   $$d = \frac{|\omega^* \cdot x_0 + b^*|}{||\omega^*||}$$
