# Minecraft

**中文**: 我的世界.

我的世界目前有两个版本:

- **Java 版 (Java Edition)**: 使用 Java 编写.
- **基岩版 (Bedrock Edition)**: 使用 C++ 编写.

**以下内容均基于 Java 版本**.

Windows 下的 `.minecraft` 文件夹通常位于 `%APPDATA%/.minecraft`.

## 启动器 (Launcher)

- **[Prism Launcher](https://github.com/PrismLauncher/PrismLauncher)**: 开源 (GPL-3.0)/跨平台, 支持快速安装和更新模组/材质包/光影等资源.
- **[Minecraft Launcher](https://www.minecraft.net/en-us/download)**: 官方启动器, 甚至还需要一个启动器来启动该启动器, 启动极其的缓慢.

## 资源包 (Resource Pack)

推荐资源包:

- [Redstone Tweaks]: 开源 (CC-BY-NC-SA-4.0), 在原版材质的基础上, 添加**红石相关信息的可视化**.

    ![Redstone Tweaks 材质预览](assets/Minecraft/redstone_tweaks.webp){ width=60% style="display: block; margin: 0 auto" }

[Redstone Tweaks]: https://modrinth.com/resourcepack/redstone-tweaks/versions

**安装方式**

将 ZIP 文件放入 `.minecraft/resourcepacks` 文件夹即可.

## 模组 (Mod)

目前有两种主流的模组框架:

- **[Fabric]**: 开源 (Apache-2.0), 轻量, Fabric Loader 甚至可以做到版本无关.
- **[NeoForge]**: 开源 (LGPL-2.1).
- **[Forge]**: 开源 (带特殊条款[^forge]的 LGPL-2.1).

[^forge]: 总体而言是更宽松了, 但 Minecraft Coder Pack 属于有独立的许可限制.

[Fabric]: https://github.com/FabricMC/fabric-api
[NeoForge]: https://github.com/neoforged/neoforge
[Forge]: https://github.com/MinecraftForge/MinecraftForge

推荐模组 (均支持 Fabric):

- **[Fabric API]**: 开源 (Apache-2.0), 仅支持 Fabric.
- **[Iris Shaders](#光影)**: 光影包加载器.
- **[Sodium]**: 有源软件, 降低 GPU 负载, 主要是对渲染管线进行优化.
- **[Lithium]**: 开源 (LGPL-3.0), 降低 CPU 负载, 主要是对游戏逻辑进行优化.
- **[FerriteCore]**: 开源 (MIT), 降低特定场景下的内存负载, 适合模组数量较多的情况.
- **[Voxy]**: 专有软件, 依赖 Fabric API, 提供超远视距. (**存在兼容性限制**)
- **[Distant Horizons]**: 开源 (LGPL-3.0), 提供超远视距. (**显著地提高游戏崩溃风险, 存在兼容性限制**)

    搭配 Sodium 使用可能需要将配置文件 `.minecraft/config/DistantHorizons.toml` 中的 `client.advanced.graphics.experimental.renderingApi` 设置为 `OPEN_GL` (默认为 `AUTO`, 可能会选择不兼容的渲染 API).

更多模组可以在 [modrinth](https://modrinth.com/discover/mods) 浏览.

[Fabric API]: https://modrinth.com/mod/fabric-api
[Sodium]: https://modrinth.com/mod/sodium
[Lithium]: https://modrinth.com/mod/lithium
[FerriteCore]: https://modrinth.com/mod/ferrite-core
[Voxy]: https://modrinth.com/mod/voxy
[Distant Horizons]: https://modrinth.com/mod/distanthorizons

Fabric + Sodium + Lithium 可以在保留原版体验的同时, 降低 CPU/GPU 负载, 提供更流畅的游戏体验.

**安装方式**

将 JAR 文件放入 `.minecraft/mods` 文件夹中即可.

## 光影 (Shader)

目前有两种主流的光影加载器:

- **[Iris Shaders]**: 开源 (LGPL-3.0), 快速[^iris], 兼容 OptiFine 光影包.
- **[OptiFine]**: 免费软件, 不允许再分发和商业使用. 对新版本支持较慢.

    从[官网下载](https://optifine.net/downloads)对应版本的 JAR 格式安装包, 然后使用 `java -jar` 命令执行该文件.

[^iris]: Iris Shaders 切换光影包速度快, OptiFine 则会卡顿几秒钟.

[Iris Shaders]: https://github.com/IrisShaders/Iris
[OptiFine]: https://optifine.net/home

### 光影包 (Shader Pack)

!!! tips
    如果你使用的是 Iris Shader, 可以通过按下 <kbd>K</kbd> 键快速启用/禁用光影包.

推荐光影包:

- **[Complementary]**.

    ![Complementary Shaders 下的 Mosslorn](assets/Minecraft/mosslorn_dusk.webp){ width=60% style="display: block; margin: 0 auto" }

    ![Complementary Shaders 的 Reimagined 和 Unbound 预览](assets/Minecraft/complementary_shaders.webp){ width=60% style="display: block; margin: 0 auto" }

    左图为 Unbound, 右图为 Reimagined.

    - [Complementary Shaders - Reimagined](https://modrinth.com/shader/complementary-reimagined): 类原版.
    - [Complementary Shaders - Unbound](https://modrinth.com/shader/complementary-unbound)

- **[BSL Shaders]**.

    ![BSL Shaders 预览](assets/Minecraft/bsl_shaders.webp){ width=60% style="display: block; margin: 0 auto" }

- **[Miniature Shader]**: 开源 (MIT), 极度轻量的光影. 性能极高, 几乎无帧率影响.

    ![Miniature Shader 预览](assets/Minecraft/miniature_shader.webp){ width=60% style="display: block; margin: 0 auto" }

更多光影包可以在 [modrinth](https://modrinth.com/discover/shaders) 浏览.

[Complementary]: https://www.complementary.dev/shaders/
[BSL Shaders]: https://modrinth.com/shader/bsl-shaders
[Miniature Shader]: https://github.com/mateuskreuch/minecraft-miniature-shader

**安装方式**

将 ZIP 文件放入 `.minecraft/shaderpacks` 文件夹中即可.

## 杂项

### 最大帧率

该设置选项位于 `Video Settings... | General | Max Framerate`.

### 关闭空气阻力

空气阻力, 等于**取消飞行时的速度上限**.

```
/attribute @p minecraft:air_drag_modifier base set 0
```

### 高亮袭击者

由于寻路算法的缺陷, 袭击者可能生成在远离村庄中心, 并且不可到达村庄的位置.  
该命令可用于快速定位这些处于异常状态的袭击者.

```
/effect give @e[type=#raiders] glowing 60
```

### 存档瘦身

1. 下载并安装 [MCA Selector](https://github.com/querz/mcaselector).
2. 将存档文件夹拖拽入 MCA Selector 中.
3. 选择 `Tools | Filter chunks`.
4. 根据需求调整 `InhabitedTime` 的过滤条件.
5. 在单选项中选中 `Delete`.
6. 点击 `OK` 按钮.
