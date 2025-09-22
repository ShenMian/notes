# Godot 导出体积优化

## 仅打包所需资源

Godot 4.5 默认打包所有资源, 即使这些资源没有被使用 (比如字体文件).

`Export -> Resources -> Export Mode` 选择 `Export Selected Scenes (and dependencies)`, 并勾选使用到的场景.

## 对引擎功能进行裁剪

Godot 4.5 空项目 Windows 导出产物体积 92.1 MB. 缩小这部分体积需要对引擎本身的功能进行裁剪.

<https://godot-build-options-generator.github.io/>
