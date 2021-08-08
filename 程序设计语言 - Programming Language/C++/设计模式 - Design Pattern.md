# Design Pattern

## Singleton 单例模式
- 第一次获取实例时初始化, 被称为`懒汉式`.  
初始化顺序可控, C++11及之后线程安全, C++11之前线程不安全.  
**出处**: 该方法由 Scott Meyer 在 *Effective C++* 一书中提出.
```cpp
class Singleton
{
public:
  static Singleton& get()
  {
    static Singleton instance();
    return instance;
  }

private:
  Singleton() = default;
};
```

- 作为全局变量初始化, 被称为`饿汉式`.  
初始化顺序不可控, 线程安全.
```cpp
class Singleton
{
public:
  static Singleton& get()
  {
    return instance;
  }

private:
  Singleton() = default;

  inline static Singleton instance = Singleton();
};
```
