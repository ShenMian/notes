# LLM

## 客户端

### 优点

- **界面统一**: 可以通过统一的界面使用各种 LLM. 通过 API 接入各种 LLM 提供商, 可以访问不同的 LLM.

    ![LLMs](assets/cherry_select_models.png){ width=70% style="display: block; margin: 0 auto" }  

- **支持 MCP**: 部分客户端支持 MCP.
- **可以离线使用**: 客户端通常支持运行本地 LLM.
- **开源**: 部分 LLM 客户端是开源的.

### 缺点

- **需要 API**: 会增加使用难度, 并产生额外成本. LLM 提供商的网页版通常可以免费使用, 而 API 则需要付费使用. 不过 API 价格通常较便宜, 而且用途更加广泛 (比如可以让翻译插件接入 LLM).

## 推荐

- **[Cherry Studio]**: 跨平台, 部分开源 (个人使用免费),  MCP, 在线搜索, 图片/文档解析, 知识库, Ollama/LM Studio. **不支持**对话克隆.
- **[LobeChat]**: 跨平台, 部分开源 (个人使用免费), 支持知识库, Ollama.
- **[LM Studio]**: 跨平台, 闭源免费, **仅支持离线模型**, 界面简洁易用. 支持图片/文档解析.
- **[Msty]**: 跨平台, 闭源免费 (提供付费高级版), 支持在线搜索 (效果较差), 图片/文档解析, 知识库, Ollama.

[Cherry Studio]: https://github.com/CherryHQ/cherry-studio
[LobeChat]: https://github.com/lobehub/lobe-chat
[LM Studio]:https://lmstudio.ai/
[Msty]: https://msty.app/

### MCP

LLM 可以与 MCP 服务器通信, 以拓展其功能.

MCP 既可以运行在远程服务器, 也可以运行在本地. 比如网页爬虫 MCP 就可以在本地或远程, 而文件系统 MCP (访问本地文件系统) 就只应该在本地运行.

![MCP](assets/cherry_mcp_server.png){ width=80% style="display: block; margin: 0 auto" }  

点击上图右上角的 `Search MCP` 按钮, 即可快速添加 Cherry Studio 提供的 MCP.

## 实用链接

- [DeepSeek API](https://platform.deepseek.com/).
- [DeepSeek API 价格](https://api-docs.deepseek.com/zh-cn/quick_start/pricing/).
- [OpenAI API](https://platform.openai.com/).
- [OpenAI API 价格](https://openai.com/api/pricing/).
- [GitHub Models](https://github.com/marketplace?type=models).
