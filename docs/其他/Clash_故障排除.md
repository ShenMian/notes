# Clash 故障排除

!!! warning
    在中国大陆境内, 禁止用于连接境外服务器等其他非法用途.  

!!! warning
    Clash for Windows 是闭源软件.  

## 校准时间

对系统进行进行校准.  

## 禁用内部 DNS

将配置文件的 `dns.enable` 改为 false.  

## Clash for Windows (1.19.5 及以上版本)

- 使用旧版本.

    使用 1.19.4 及以下版本. 若 BUG 是新版本引入的, 可以通过回滚到旧版本来解决问题. 若 BUG 是由 [Clash](https://github.com/Dreamacro/clash) 引入的, 则可以使用较早的 Clash.  

    !!! warning
        1.19.9 以下版本存在 XSS 安全漏洞, [#2710](https://github.com/Fndroid/clash_for_windows_pkg/issues/2710).  

- *Setting -> Profiles -> Parsers -> Edit*, 进行以下修改:  

    ```diff
    - parsers: #array
    + parsers:
    + - reg: '^.*$'
    +   code: |
    +     module.exports.parse = async (raw, { axios, yaml, notify, console }, { name, url, interval, selected }) => {
    +       const obj = yaml.parse(raw)
    +       obj.proxies.forEach( v => {
    +           if (v.network === 'ws' && !v['ws-opts'] && v['ws-path'] && !v['ws-headers']) {
    +             const opts = {}
    +             opts.path = v['ws-path']
    +             v['ws-opts'] = opts
    +             delete v['ws-path']
    +           }
    +           if (v.network === 'ws' && !v['ws-opts'] && v['ws-path'] && v['ws-headers']) {
    +             const opts = {}
    +             opts.path = v['ws-path']
    +             opts.headers = v['ws-headers']
    +             v['ws-opts'] = opts
    +             delete v['ws-path']
    +             delete v['ws-headers']
    +           }
    +       })
    +       return yaml.stringify(obj)
    +     }
    ```

- 关闭并重新打开 Clash 可能可以**暂时**解决问题.  

## GUI 客户端

- [Windows](https://github.com/Fndroid/clash_for_windows_pkg) **闭源**, 不建议使用.
- [Android](https://github.com/Kr328/ClashForAndroid) 开源.
