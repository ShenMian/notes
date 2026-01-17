# Arma 3

**全称**: Armed Assault 3.  
**中文**: 武装突袭 3.  

![封面 - Bohemia Interactive](assets/arma_3_cover.webp){ width=30% style="display: block; margin: 0 auto" }  

## 测评

**类型**: 军事模拟, FPS/TPS, 拟真, 多人合作.  

| 项目 | 评分 | 描述 |
|------|------|------|
| 总体 | 7    |      |
| 画面 | 8    |      |
| 音效 | 6    |      |
| 优化 | 2    |      |
| 剧情 | -    |      |

### 优点

- 目前该类型拟真度最高的游戏.
- 机制的实现十分复杂且完善.
- 有丰富的枪械和载具, 部分需要购买 DLC 解锁.

### 缺点

- 优化不佳.
- 不支持 Steam 云存档及其他云存档.
- 服务器数量以及在线人数少, 其他地区延迟十分高且易掉线. 多款加速器均无效果.
- 人物动作僵硬, 如跨越障碍只是一个与场景无关的僵硬动画/人被击中后的反应不真实.
- 剧情刻意美化北约 (NATO), 抹黑其他国家 (CSAT).

### 严重问题

- 存档可能丢失/损坏, 导致失去游戏进度.
- 在中文输入法启用的情况下游玩, 约 10 分钟后会崩溃.
- 跨越障碍物可以透视或穿墙.
- NPC 射击精度不平衡: 即使站位极具优势且先发制人, 依然可能被 NPC 一枪击杀. 虽然更贴近现实, 但这终究是游戏和模拟, 因此体验不佳. 可以在设置中修改 AI 敌人的射击精度.
- ~~不支持外设热拔插: 如果要使用新的输入或输出设备(如耳机/手柄)需要到设置里刷新~~. (已修复)

## 优化

以下设置仅供参考, 需根据实际情况进行调整. 比如单人战役环境可能与服务器环境有较大差异, 因此需要分别寻找二者的最优设置.  

### 游戏内

适用:  

- **PIP**: `低` 或 `禁用`, 对性能有极大影响.
- **水面反射**: `标准`.

显示:  

- **垂直同步**: `禁用`, 降低延迟.
- **FSAA**: `禁用` 或 `2x`.

后处理:  

- **径向模糊**: 0, 减少非必要视觉效果.
- **旋转模糊**: 0, 减少非必要视觉效果.
- **焦散线**: `禁用`, 减少非必要视觉效果.

### 启动器

- **在菜单中显示静态背景**: 勾选, 减少进入游戏的时间.
- **在启动时跳过标识**: 勾选, 减少进入游戏的时间.
- **CPU 总数**: CPU 核心数.
- **额外线程**: 勾选, 子项目全部勾选.
- **启用超线程**: 勾选.
- **启用大页内存支持**: 勾选.

### 配置文件

修改配置文件 `%USERPROFILE%\Documents\Arma 3\Arma3.cfg` 中的以下选项:  

```cfg
refresh=<屏幕刷新率>;
GPU_MaxFramesAhead=1;
GPU_DetectedFramesAhead=1;
```

### 模组

- [Automatic ViewDistance]\: 根据帧率自动调节视距.
- [Advanced Garbage Collector]\: 将尸体替换为裹尸袋, 减少对象三角形数.
- [Optimize Performance]\: 优化相关模组合集.

[Automatic ViewDistance]: https://steamcommunity.com/sharedfiles/filedetails/?id=1544955993
[Advanced Garbage Collector]: https://steamcommunity.com/sharedfiles/filedetails/?id=1724884525
[Optimize Performance]: https://steamcommunity.com/sharedfiles/filedetails/?id=2779217051

## 参考

- [如何在 Arma 3 中将我的 FPS 翻倍 - 优化性能指南 - 飞龙岩山 - bilibili](https://www.bilibili.com/video/BV1iV4y177YT?vd_source=b0a1d90ff65d8547a0ffc9ce4d68bcfd)
