# MySQL 锁

## 行级锁 (Row-level locks)

InnoDB 支持以下两种行级锁:

- 共享锁 (shared lock, S): 单行可以施加多个共享锁.
- 独占锁 (exclusive lock, X): 也称为**排他锁**. 单行只能施加单个独占锁.

## 意向锁 (Intention lock)

意向锁是表级锁.

意向锁有以下两种类型:

- 意向共享锁 (intention shared lock, IS).
- 意向独占锁 (intention exclusive lock, IX).

`SELECT ... FOR SHARE`
`SELECT ... FOR UPDATE`

TODO: 说明意向锁和表锁之间的区别

## 不同锁之间的冲突兼容关系

|    | X    | IX   | S    | IS   |
|----|------|------|------|------|
| X  | 冲突 | 冲突 | 冲突 | 冲突 |
| IX | 冲突 | 兼容 | 冲突 | 兼容 |
| S  | 冲突 | 冲突 | 兼容 | 兼容 |
| IS | 冲突 | 兼容 | 兼容 | 兼容 |

## 表锁 (Table lock)

`LOCK TABLES` 可以用于为表添加锁.

表锁有以下两种类型:

- `READ`: 持有该锁的会话可以读取该表, 但不能写入. 不同会话可以请求同一个表的读锁.
- `WRITE`: 持有该锁的会话可以读取并写入该表. 其他会话在加锁期间无法访问该表.

当前事务会在尝试获取新的表锁时释放之前的表锁, 也可以通过 `UNLOCK TABLES` 显式的释放表锁.

## 参考

- <https://dev.mysql.com/doc/refman/9.3/en/innodb-locking.html>.

## 参见

- <https://dev.mysql.com/doc/refman/9.3/en/lock-tables.html>.
