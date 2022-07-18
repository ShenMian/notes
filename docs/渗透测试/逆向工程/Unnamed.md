# Unnamed

- 查看程序依赖库

  ```sh
  ldd [file]
  dumpbin /DEPENDENTS [file] # Windows
  ```

- 查看进程的调用栈

  ```sh
  pstack [pid]
  ```

- 检测系统调用

  ```sh
  strace [option] [file | -p [pid]]
  ```

  常用参数:

  - `-c`: 按系统调用进行汇总, 包括耗时/时间占比/调用次数/失败次数等.
  - `-t`: 在输出的系统调用信息记录前加上时间戳.
  - `-T`: 在输出的系统调用信息记录后加上耗时.

  还可以对记录按系统调用或类型进行过滤.  
