# Godot

## 与前端交互

导出为 WASM 的项目, 可以通过 [JavaScriptBridge] 与前端进行交互.  
比如可以借助前端技术实现 UI, 这样就可以实现 UI 与游戏引擎的分离.

详情请参考[官方教程](https://docs.godotengine.org/en/latest/tutorials/platform/web/javascript_bridge.html).

[JavaScriptBridge]: https://docs.godotengine.org/en/latest/classes/class_javascriptbridge.html

### Godot 调用 JS

现在前端创建一个全局的 JS 函数:

```js
function HelloFromGodot() {
    console.log("Hello from Godot!")
}
```

然后 Godot 直接通过获取 `window` 对象来调用前端的 JavaScript 函数:

```gd
var window = JavaScriptBridge.get_interface("window")
window.HelloFromGodot()
```

### JS 调用 Godot

Godot 创建一个 JS 函数, 并将其回调绑定到一个 GDScript 函数:

```gd
var _hello_from_js_callback_ref = JavaScriptBridge.create_callback(_hello_from_js)

func _ready():
    var window = JavaScriptBridge.get_interface("window")
    window.helloFromJs = _hello_from_js_callback_ref

func _hello_from_js() -> void:
    print("Hello from JS!")
```

前端直接调用该 JS 函数:

```js
window.helloFromJs()
```
