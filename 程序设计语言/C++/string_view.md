# std::string_view

**头文件**: `<string_view>`.  
**标准**: C++17.  

## 何时使用

- 只读. 如果需要修改原字符串, 请使用 `std::string&`.

## 优点

- 避免了不必要的内存分配.
- 提高访问速度: `std::string&` 需要先接引用.

## 例子

在 C++17 之前我们通常使用以下方式声明一个带有 `std::string` 参数的函数, 将参数通过引用传递.

```cpp
void print(const std::string&);
```

但这种实现方式存在一个问题, 就是当实参类型为 `const char*` 的时候会先构建一个 `std::string` 对象, 产生了不必要的拷贝.  
在 C++17 将可以使用 `std::string_view` 来代替 `std::string`, 以提高效率.

```cpp
void print(std::string_view);
```

这样写无论实参是 `std::string` 或 `const char*` 都会构建一个 `std::string_view` 对象, 因为不存在拷贝操作, 因此效率较高.  

`std::string_view` 没有 `c_str()` 方法, 可以使用 `data()` 来代替.

## 参考

- [Which String Parameter Type?](https://hackingcpp.com/cpp/recipe/string_parameters.html)
