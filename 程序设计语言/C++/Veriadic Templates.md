# Veriadic Templates

可变参数模板.  
**标准**: C++11.  

```cpp
template <typename T, typename... Args>
void print(const T& arg, const Args&... args)
{
  std::cout << arg;
  print(args...);
}

void print()
{
  std::cout << std::endl;
}

int main()
{
  print("1+2=", 1+2); // 1+2=3
  return 0;
}
```
可变参数模板将通过递归的方式对参数进行解析:
 - print("1+2=", 1+2)
 - print("1+2=")
 - print(1+2)
 - print()

可通过 `sizeof...(args)` 来获取可变参数 `args` 的类型参数个数.  
因此上述实现还可以写为:  
```cpp
template <typename T, typename... Args>
void print(const T& arg, const Args&... args)
{
  std::cout << arg;
  if constexpr (sizeof...(args) > 0)
    print(args...);
  else
    std::cout << std::endl;
}
```
**提示**: constexpr if 为 C++17 引入的语法.

```cpp
template <typename T, typename... Args>
void print(const T& arg, const Args&... args)
{
  // ...
}

template <typename... Args>
void print(const Args&... args)
{
  // ...
}
```
上面的实现是可以通过编译的, 即使出现了参数数量超过或等于 2 的调用语句.  
