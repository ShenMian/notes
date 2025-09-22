# Godot 导出体积优化

Godot 4.5 空项目 Windows 导出产物体积 92.1 MB. 可见对于小游戏来说, 优化导出体积是十分必要的.

## 仅打包所需资源

`Export -> Resources -> Export Mode` 选择 `Export Selected Scenes (and dependencies)`, 并勾选使用到的场景.

## 对引擎功能进行裁剪

<https://godot-build-options-generator.github.io/>
