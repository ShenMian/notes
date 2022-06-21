# IRC

## Weechat

Weechat 是终端下的 IRC 客户端, 配置/使用起来十分方便.  
初次使用 Weechat 可以参考 [Weechat Quick Start Guide](https://weechat.org/files/doc/stable/weechat_quickstart.en.html#join_part_irc_channels) 来进行配置.  

**注意**: 涉及保密内容的字串需要使用 `/secure` 命令来加密存储, 否则会以明文的形式直接显示在配置文件中.  

连接服务器后自动加入频道:

```
/set irc.server.libera.autojoin "#archlinux-cn-offtopic,#C++,##English,#c_lang_cn,#archlinux-cn"
```

## 安全

- 使用 SSL 连接服务器.

  在添加服务器的时候使用 `-ssl` 选项. 或:

  ```
  /set irc.server.<server-name>.ssl on
  ```

- 提高账户安全性.

  ```
  /msg nickserv set enforce on
  ```

- 通过代理连接服务器.

  ```
  /proxy add <proxy-name> http <proxy-host> <proxy-port>
  /set irc.server.<server-name>.proxy "<proxy-name>"
  ```
