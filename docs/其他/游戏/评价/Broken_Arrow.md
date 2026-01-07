# Broken Arrow

**中文**: 断箭.  

## 防空压制

防空压制 (Suppression of Enemy Air Defenses, SEAD) 是指通过使用反辐射导弹 (Anti-Radiation Missile, ARM) 来摧毁或压制敌方防空雷达和导弹系统的战术.

以下是具备 SEAD 能力的战斗机:

- **美国**: Prowler (x4), F-16CJ (x4), F-35A (x2), F-15EX (x2).
- **俄罗斯**: Su-24MP (x3), Su-34 (x2), MiG-35 (x4), Su-57 (x4), Su-25 (x2).

其中 (xN) 表示最多可携带 N 枚 ARM.

以下是具备 SEAD 能力的直升机:

- **美国**: AH-1Z Viper (x2).
- **俄罗斯**: Ka-52 Katran (x2).

以下作战单位应该设置编号, 便于快速选中:

- **远程火力**: 快速为前线提供火力支援.
- **雷达防空**: 便于在发现 SEAD-capable 战机时快速关闭雷达.

## 单位克制关系

```mermaid
flowchart TD
    %% ========== 样式定义 ==========
    classDef recon fill:#f1c40f,stroke:#f39c12,color:#000
    classDef armor fill:#27ae60,stroke:#2d4a3a,color:#fff
    classDef infantry fill:#16a085,stroke:#0b5345,color:#fff
    classDef air fill:#3498db,stroke:#2980b9,color:#fff
    classDef aa fill:#e74c3c,stroke:#c0392b,color:#fff
    classDef artillery fill:#9b59b6,stroke:#8e44ad,color:#fff

    %% ========== 核心节点 ==========
    RECON["<b>侦察 Recon</b><br/><font size=2>视野 / 目标指示核心</font>"]:::recon

    MBT["<b>主战坦克 MBT</b><br/><font size=2>平原突破 / 抗线核心</font>"]:::armor
    IFV["<b>步兵战车 IFV</b><br/><font size=2>机炮压制 / 机动反甲</font>"]:::armor

    INF["<b>步兵 Infantry</b><br/><font size=2>城镇 / 森林控制</font>"]:::infantry
    ATGM["<b>反坦克小组 ATGM</b><br/><font size=2>远程开罐 / 地形伏击</font>"]:::infantry

    HELI["<b>武装直升机 Heli</b><br/><font size=2>低空舔地 / 快速反应</font>"]:::air
    JET_CAS["<b>攻击机 CAS</b><br/><font size=2>精确轰炸 / 装甲杀手</font>"]:::air
    JET_SEAD["<b>防空压制 SEAD</b><br/><font size=2>反辐射导弹 / 拆伞</font>"]:::air

    AA_RADAR["<b>雷达防空 Radar AA</b><br/><font size=2>高空远距 / 区域拒止</font>"]:::aa
    AA_IR["<b>红外防空 IR / MANPADS</b><br/><font size=2>隐蔽拦截 / 直升机克星</font>"]:::aa

    ARTY["<b>火炮 / 火箭炮 Artillery</b><br/><font size=2>范围覆盖 / 压制 / 反炮</font>"]:::artillery

    %% ========== 核心逻辑：侦察驱动 ==========
    RECON -->|提供视野与目标| ARTY
    RECON -->|引导锁定| ATGM
    RECON -->|前沿侦查| HELI
    RECON -.->|发现即摧毁| MBT

    %% ========== 地面攻防链 ==========
    MBT -->|平原碾压| INF
    MBT -->|直射火力| AA_RADAR

    IFV -->|机炮清扫| INF
    IFV -->|导弹狙击| MBT

    subgraph Terrain_Bonus["地形加成单位组"]
        INF -->|城镇 / 森林伏击| MBT
        INF -->|便携防空伏击| HELI
        ATGM -->|远程开罐| MBT
        ATGM -->|伏击| IFV
    end

    %% ========== 空中优势链 ==========
    HELI -->|猎杀| MBT
    HELI -->|压制| INF
    HELI -.->|低空突防| AA_RADAR

    JET_CAS -->|精确轰炸| MBT
    JET_SEAD -->|反辐射打击| AA_RADAR

    %% ========== 防空与反制链 ==========
    AA_RADAR -->|区域拒止| JET_CAS
    AA_RADAR -->|远距拦截| JET_SEAD
    AA_IR -->|隐蔽猎杀| HELI
    AA_IR -->|驱离| JET_CAS

    %% ========== 炮兵体系链 ==========
    ARTY -->|火力覆盖| INF
    ARTY -->|压制 / 摧毁| AA_RADAR
    ARTY -.->|反炮兵对决| ARTY
```

## 金牌要求

获取金牌的条件需且仅需满足金牌要求, 可以忽略铜牌和银牌要求.

### 美军任务

| 任务                                               | 金牌要求                                                         |
|----------------------------------------------------|------------------------------------------------------------------|
| 表演时刻 (Show Time)                               | • 在困难难度下完成任务.<br>• 在 30 分钟内完成所有目标.           |
| 和平卫士 (Peacekeeper)                             | • 在困难难度下完成任务.<br>• 不要损失任何单位.                   |
| 空军基地劫案 (Airbase Heist)                       | • 在困难难度下完成任务.<br>• 在 30 分钟内完成任务.               |
| 巨浪来袭 (The Big Wave)                            | • 在困难难度下完成任务.<br>• 在 10 分钟内占领堡垒.               |
| 追踪与狂怒 (Tracked and Furious)                   | • 在困难难度下完成任务.<br>• 不要损失任何一辆车辆.               |
| 夜色属于我们 (We Own The Night)                    | • 在困难难度下完成任务.<br>• 不要损失任何一架直升机.             |
| 吸血鬼 (Vampires)                                  | • 在困难难度下完成任务.<br>• 不要损失任何一架飞机.               |
| 暴雨来袭 (Heavy Rain)                              | • 在困难难度下完成任务.<br>• 不要让任何单位被伊斯坎德尔导弹击毁. |
| 狩猎季节 (Hunting Season)                          | • 在困难难度下完成任务.<br>• 消灭防空设施且不损失直升机.         |
| 朋友的小帮手 (With a little help from our friends) | • 在困难难度下完成任务.<br>• 不使用豹式坦克赢得任务.             |
| 断箭 (Broken Arrow)                                | • 在困难难度下完成任务.<br>• 遵循本内特的计划.                   |

### 俄军任务

| 任务                                         | 金牌要求                                                          |
|----------------------------------------------|-------------------------------------------------------------------|
| 边检 (Papers Please)                         | • 在困难难度下完成任务.<br>• 使用最少的乘员组.                    |
| 停电 (Blackout)                              | • 在困难难度下完成任务.<br>• 撤离全部幸存步兵与车辆.              |
| 冷港行动 (Operation Cold Harbour)            | • 在困难难度下完成任务.<br>• 不借助巴塔林, 独自占领港口全部目标.  |
| 自助加油 (Self Service)                      | • 在困难难度下完成任务.<br>• 在 45 分钟内完成任务.                |
| 禁航水域 (Forbidden Waters)                  | • 在困难难度下完成任务.<br>• 用 SSO 或海军特种击杀 50 个敌方单位. |
| 搜救 (Search & Rescue)                       | • 在困难难度下完成任务.<br>• 在 40 分钟内占领城市.                |
| 空降兵之旅 (The Ride of the VDV)             | • 在困难难度下完成任务.<br>• 不使用 BMD-4M 或 Sprut-SD.           |
| 通往菲德勒绿地之路 (Road to Fiddler's Green) | • 在金牌难度下完成任务.<br>• 不向上校请求任何援助.                |

## 教程

- [For those who aren't military geeks](https://steamcommunity.com/sharedfiles/filedetails/?id=3501205842): 介绍了常见的概念和术语, 可以帮助快速入门.

## 资源

- <https://ba-hub.net>
- <https://barmory.net>

## 参考

- <https://steamcommunity.com/sharedfiles/filedetails/?id=3505492842>
