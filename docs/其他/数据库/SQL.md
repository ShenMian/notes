# SQL (Structured Query Language)

SQL 命令根据功能可以分为以下几类:

1. 数据定义语言 (Data Definition Language, DDL): `CREATE`, `DROP`, `ALTER`, `TRUNCATE`, `COMMENT`, `RENAME`.
2. 数据操作语言 (Data Manipulation Language, DML): `INSERT`, `UPDATE`, `DELETE`, `LOCK`, `CALL`, `EXPLAIN PLAN`.
3. 数据查询语言 (Data Query Language, DQL): `SELECT`.
4. 事务控制语言 (Transaction Control Language, TCL): `BEGIN TRANSACTION`, `COMMIT`, `ROLLBACK`, `SAVEPOINT`.
5. 数据控制语言 (Data Control Language, DCL): `GRANT`, `REVOKE`.

## 数据定义语言

- `CREATE`/`DROP`: 用于创建/删除库和表.
- `ALTER`: 修改表.
- `TRUNCATE`: 清空表的数据.

## 数据操作语言

- `INSERT`: 插入数据到表.
- `UPDATE`: 更新表数据.
- `DELETE`: 删除表数据.

## 数据查询语言

- `SELECT`: 查询表数据.

## 事务控制语言

- `BEGIN`: 开始事务. 与 `COMMIT`, `ROLLBACK` 配对使用.

    部分数据库也使用 `START TRANSACTION`.

- `COMMIT`: 提交事务, 即应用事务内的全部操作.
- `ROLLBACK`: 回滚事务, 即撤销事务内的全部操作.

## 数据控制语言

- `GRANT`: 给予用户权限.
- `REVOKE`: 撤销用户权限.

## SELECT

```txt
SELECT [DISTINCT] <column expression list>
FROM <tables>
[WHERE <predicate>]
[GROUP BY <column list>]
[HAVING <predicate>]
[ORDER BY <column list>]
[LIMIT <integer>];
```

### JOIN 子句

`JOIN` 用于连接多张表, 有以下几种连接类型:

- `JOIN`/`INNER JOIN`.
- `LEFT JOIN`.
- `RIGHT JOIN`.
- `FULL JOIN`.
- `NATURAL JOIN`: 通过有相同列名的列连接.

### ORDER BY 子句

根据指定列排序, 有以下两种排序方式:

- `ASC`: 升序, 默认排序方式.
- `DESC`: 降序, 默认排序方式.

### GROUP BY 子句

将行根据指定列分组, 该列值相同的行为一组. 此时查询的内容只能为分组使用的列或应用在其他列上的聚合函数.

### HAVING 子句

`WHERE` 按行过滤数据, 而 `HAVING` 按组过滤数据. 因此 `HAVING` 需要与 `GROUP BY` 搭配使用.

### SELECT 子句评估

1. **FROM**: 获取表, 求笛卡尔积.
2. **WHERE**: 过滤行.
3. **SELECT**: 过滤列.
4. **GROUP BY**: 分组.
5. **HAVING**: 过滤组.
6. **DISTINCT**: 去重.
7. **ORDER BY**: 排序.
8. **LIMIT**: 截取.

#### 例子

```sql
SELECT S.dept,
       Avg(S.gpa),
       Count(*)
FROM   students S
WHERE  S.gender = 'F'
GROUP  BY S.dept
HAVING Count(*) >= 2
ORDER  BY S.dept; 
```

1. 获取表 `Students` 的数据.
2. 仅保留列 `gender` 值为 `F` 的行.
3. 仅保留列 `dept` 和 `gpa`.
4. 将 `dept` 值相同的行进行分组. 进行 `HAVING` 中使用到的聚合操作.
5. 仅保留大小超过 2 的组. 进行 `SELECT` 或后续子句中使用到的聚合操作.
6. 略.
7. 根据 `dept` 排序.

### JOIN

`FROM` 可以指定多张表, 如果存在多张表, 则需要计算这些表的笛卡尔积.

### 表和列的别名

`SELECT` 和 `FROM` 中可以通过 `AS` 指定表或列的别名.  
当表进行自连接时, 为了避免歧义, 必须为该表指定别名.  

### 算数表达式

`SELECT`, `WHERE` 和 `HAVING` 中存在算数表达式.

```sql
SELECT Log(1000)  AS three,
       Exp(Ln(2)) AS two,
       Cos(0)     AS one, Ln(2*3) = Ln(2) + Ln(3) AS sanity; 
```

### 字符串匹配

```sql
SELECT S.sname
FROM   sailors S
WHERE  S.sname LIKE 'B_%’
```

DBMS 通常也支持通过正则表达式匹配字符串, 但语法不太一致. 下面是 PostgreSQL 的例子:

```sql
SELECT s.sname
FROM   sailors S
WHERE  s.sname ~ 'B.*’
```

### 组合

`UNION`/`INTERSECT`/`EXCEPT` 可以求两条查询语句结果的交/并/差集.

### 嵌套查询

可以通过 `IN`/`EXISTS`/`ANY`/`ALL` 嵌套查询语句.

```sql
SELECT S.sname
FROM   sailors S
WHERE  S.sid IN (SELECT R.sid
                 FROM   reserves R
                 WHERE  R.bid = 102) 
```

## 参考

- <https://www.geeksforgeeks.org/sql-ddl-dql-dml-dcl-tcl-commands/>
