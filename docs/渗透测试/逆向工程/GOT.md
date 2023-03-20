# GOT

**全称**: Global Offset Table.  

ELF 中的动态链接函数的地址是在运行时确定的, 第一次执行函数前会先通过动态解析器(dynamic resolver)解析获得函数的地址, 然后将结果缓存在 GOT 中.  
由于程序可能存在大量动态函数, 若在一开始就对全部函数进行解析将耗费不少时间, 而且最终可能只有一部分动态函数被使用到, 因此 ELF 使用了延迟绑定的方法, 只在动态函数被调用前才进行绑定.  

GOT 是在运行时不断完善的, 所以该表是**可写的**.  
如果该程序被标记为 full RELRO, GOT 将是只读的, 否则这些解析工作是惰性的. 可以使用 `readelf` 或 `checksec` 判断程序是否是 full RELRO 的.  

## 参考

- <https://ctf101.org/binary-exploitation/what-is-the-got/>
