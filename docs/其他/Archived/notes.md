## 1. 矩阵的基本运算(加减乘除)

矩阵乘法:  

$$
\begin{bmatrix}
1 & 2 \\
3 & 4 \\
\end{bmatrix}
\begin{bmatrix}
5 & 6 \\
7 & 8 \\
\end{bmatrix}
=
\begin{bmatrix}
19 & 22 \\
43 & 50 \\
\end{bmatrix}
$$

$C_{11} = A_{11} * B_{11} + A_{12} * B_{21}$  

## 2. 三元一次方程组 (10分)

$$
ax_1 + bx_2 + cx_3 = x \\
dx_1 + ex_2 + fx_3 = y \\
gx_1 + hx_2 + ix_3 = z
$$

$$
\begin{bmatrix}
a & b & c \\
d & e & f \\
g & h & i
\end{bmatrix}
$$

## 3. 矩阵行列式 (10分)

$$
\begin{vmatrix}
1 & b & c \\
0 & e & f \\
0 & h & i
\end{vmatrix}
=
\begin{vmatrix}
e & f \\
h & i
\end{vmatrix}
= ei - hf
$$

## 4. 矩阵求逆 (10分)

$$ A^{-1} = \frac{A^*}{|A|} $$

## 5. 矩阵方程组 (10分)

$$ AA^{-1} = A^{-1}A = I $$

$$
\begin{align}
AX &= AB \\
 X &= A^{-1}AB \\
 X &= A^{-1}B \\
 X &= \frac{1}{|A|}}A^*B
\end{align}
$$

!!! warning
    注意矩阵之间相乘顺序不可以对调, 假设公式为 $XA = B$ 可得 $X = BA^{-1}$.  
    矩阵不能作为分母.  

答题步骤:  

1. 求行列式的值.
2. 求代数余子式.
3. 带入公式.

$$
\begin{align}
AX + BX &= C \\
 (A+B)X &= C \\
      X &= (A+B)^{-1}C
\end{align}
$$

$$
AX + X = B
(A + I)X = B
$$

## 6. 初等变换

$A \rightarrow B$

2 3 1  2
1 2 3  3
3 6 9 12

1 2 3 3
2 3 1 2
1 2 3 4

1  2  3  3
0 -1 -5 -4
0  0  0  1

## 7. 矩阵的秩

最高阶子式不为零的阶数.  

求 r(A).  

r(A) = 造三角形零的矩阵的 行数 - 零行数

1 1 1 1
0 1 1 1
0 0 1 1
 
1 1 1
0 1 1
0 0 1
0 0 0

## 8. 证明

对角矩阵

$$
\begin{bmatrix}
a_{11} & . & . & 0 \\
.      & a_{22} & 0 & . \\
.      & 0 & . & . \\
0      & . & . & a_{mn}
\end{bmatrix}
$$

上三角(左下角为0)/下三角矩阵(右上角为0)  
对称矩阵(主对角线为对称轴)  

