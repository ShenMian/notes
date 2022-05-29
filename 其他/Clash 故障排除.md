# Clash 故障排除

**警告**: 以下内容仅供学习网络安全参考, 禁止用于非法用途.  
**注意**: 以下内容针对的是 Clash for Windows.  

## 常见故障

- 全部节点显示超时(timeout).
- 订阅无法更新.

## 校准时间

Windows 11: 设置 -> 时间和语言 -> 日期和时间 -> 其他设置 -> 立即同步.  

## 禁用内部 DNS

在配置文件的 dns 的 enable 改为 false.  

## 使用旧版本

使用 1.19.4 及以下版本. 若 BUG 是新版本引入的, 可以通过回滚到旧版本来解决问题. 若 BUG 是由 [Clash Core](https://github.com/Dreamacro/clash) 引入的, 则可以使用较早的 Clash Core.  

**警告**: 1.19.9 以下版本存在 XSS 安全漏洞, [#2710](https://github.com/Fndroid/clash_for_windows_pkg/issues/2710).  

## 1.19.5 及以上版本

Setting->Profiles->Parsers->Edit, 进行以下修改:  

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

## 重启 Clash

关闭并重新打开 Clash 可能可以**暂时**解决问题.  
