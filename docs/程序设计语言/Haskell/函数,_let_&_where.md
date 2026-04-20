# 函数, let & where

## 函数 (Functions)

定义函数的语法:

```txt
name arg1 arg2 ... argn = <expr>
```

函数体是一个表达式, 该表达式的值就是该函数的返回值.

```hs
in_range min max x = min <= x && x <= max
```

```console
ghci> in_range 0 5 3
True
ghci> in_range 4.0 5.0 3.0
False
```

近似的命令式代码如下:

```rs
fn in_range<T: PartialOrd>(min: T, max: T, x: T) -> bool {
    min <= x && x <= max
}
```

## Let

关键字 `let`[^let] 用于声明变量:

```hs
in_range min max x =
  let in_lower_bound = min <= x
    in_upper_bound = max >= x
  in
    in_lower_bound && in_upper_bound
```

Haskell 对缩进有着严格的限制, 此处 `in_lower_bound` 与 `in_upper_bound` 必须有缩进, 且开头垂直对齐.

## Where

使用 `where`[^where] 关键字可以实现和 `let` 关键字相似的功能:

```hs
in_range min max x = in_lower_bound && in_upper_bound
  where
    in_lower_bound = min <= x
    in_upper_bound = max >= x
```

但使用守卫表达式时, 在不同分支内需要使用同一个变量时, 只能使用 `where` 而无法使用 `let`.  
它们的区别并不仅限于绑定变量语句的位置, 详情请参见 [HaskellWiki](https://wiki.haskell.org/Let_vs._Where).

## If

关键字 `if`[^if] 与命令式编程语言相似, 用于创建分支:

```hs
in_range min max x =
  if in_lower_bound then in_upper_bound else False
  where
    in_lower_bound = min <= x
    in_upper_bound = max >= x
```

## Infix

中缀运算符关键字 `` ` ``[^infix].

```console
ghci> add x y = x + y
ghci> add 10 20
30
ghci> 10 `add` 20
30
```

[^let]: <https://wiki.haskell.org/Keywords#let.2C_in>
[^where]: <https://wiki.haskell.org/Keywords#where>
[^if]: <https://wiki.haskell.org/Keywords#if.2C_then.2C_else>
[^infix]: <https://wiki.haskell.org/Keywords#.60>
