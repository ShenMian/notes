# CLion 故障排除

## 命令行输出结果中空格的处理不正确

禁用 PTY:

1. `Help | Find Action`.
2. 输入 "Registry".
3. 打开 Registry.
4. 找到并禁用 `run.processes.with.pty` 选项.
