# Rust

## 静态变量与静态生命周期

Rust 保证内存安全, 但是防止内存泄露不属于内存安全的一部分. 所以 Rust 并不保证不会发生内存泄露, 甚至允许通过 `Box::leak` 这类安全的函数, 主动泄露内存. [^1]

静态变量 (通过 static 关键字定义的), 满足 `'static` 生命周期约束, 但满足该生命周期约束的变量, 不一定是静态变量. 也可能是在运行过程中创建的变量 (通过动态内存分配), 然后通过 `Box::leak` 这类函数泄露, 就满足 `'static` 约束.

这种动态创建的, 满足 `'static` 约束的变量, 是可以通过 `std::mem::drop` 手动释放的. 这使得他们与静态变量非常不同.

[^1]: https://github.com/pretzelhammer/rust-blog/blob/master/posts/translations/zh-hans/common-rust-lifetime-misconceptions.md

## Rust Atomics and Locks

| 标题                    |
|-----------------------|
| [并发基础](并发基础.md) |
| [原子](原子.md)         |
| [内存排序](内存排序.md) |
