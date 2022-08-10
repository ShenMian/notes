# std::string_view

**头文件**: `<string_view>`.  
**标准**: C++17.  

## 适用范围

- 只读. 如果需要修改原字符串, 请使用 `std::string&`.

## 优点

- 避免了不必要的内存分配: `const std::string&` 在传入 `const char*` 时需要执行拷贝操作.
- 提高访问速度: `const std::string&` 需要先解引用, 因此在使用 `std::string_view` 的时候请不要通过引用传递. `std::string_view` 实现十分轻量, 因此可以通过值传递.

## 例子

在 C++17 之前我们通常使用以下方式声明一个带有 `std::string` 参数的函数, 将参数通过引用传递.

```cpp
void print(const std::string&);

std::vector<char> v {'s','t','r'};
print("str");                // copy
print({v.begin(), v.end()}); // copy
```

但这种实现方式存在一个问题, 当以上方例子调用 `print()` 的时候会先构建一个 `std::string` 对象, 产生了不必要的拷贝.  
在 C++17 将可以使用 `std::string_view` 来代替 `std::string`, 以提高效率.

```cpp
void print(std::string_view);

std::vector<char> v {'s','t','r'};
print("str");                // no copy
print({v.begin(), v.end()}); // no copy
```

这样写无论实参是 `std::string` 或 `const char*` 都会构建一个 `std::string_view` 对象, 因为不存在拷贝操作, 因此效率较高.  

`std::string_view` 没有 `c_str()` 方法, 可以使用 `data()` 方法来代替.

## 参考

- [Which String Parameter Type?](https://hackingcpp.com/cpp/recipe/string_parameters.html)
