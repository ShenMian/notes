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

## 波罗的海战役

### 金牌要求

获取金牌的条件**需且仅需满足金牌要求**, 无需同时满足铜牌和银牌要求.

#### 美军任务

| 任务                                           | 金牌要求                                                                      |
|------------------------------------------------|-------------------------------------------------------------------------------|
| 好戏上演 (Show Time)                           | • 在困难难度下完成任务.<br/>• 在 30 分钟内完成所有目标.                       |
| 和平捍卫者 (Peacekeeper)                       | • 在困难难度下完成任务.<br/>• 不要损失任何单位.                               |
| 空军基地惊天劫案 (Airbase Heist)               | • 在困难难度下完成任务.<br/>• 在 30 分钟内完成任务.                           |
| 巨浪 (The Big Wave)                            | • 在困难难度下完成任务.<br/>• 在 10 分钟内占领堡垒.                           |
| 钢铁洪流 (Tracked and Furious)                 | • 在困难难度下完成任务.<br/>• 不要损失任何一辆车辆.                           |
| 夜幕主宰者 (We Own The Night)                  | • 在困难难度下完成任务.<br/>• 不要损失任何一架直升机.                         |
| 吸血鬼! (Vampires)                             | • 在困难难度下完成任务.<br/>• 不要损失任何一架飞机.                           |
| 铁雨天降 (Heavy Rain)                          | • 在困难难度下完成任务.<br/>• 不要让任何单位被伊斯坎德尔 (Iskander) 导弹击毁. |
| 狩猎季节 (Hunting Season)                      | • 在困难难度下完成任务.<br/>• 消灭防空设施且不损失直升机.                     |
| 好友相助 (With a little help from our friends) | • 在困难难度下完成任务.<br/>• 不使用豹式坦克 (Leopards) 赢得任务.             |
| 断箭 (Broken Arrow)                            | • 在困难难度下完成任务.<br/>• 遵循本内特 (Bennet) 的计划.                     |

#### 俄军任务

| 任务                               | 金牌要求                                                                    |
|------------------------------------|-----------------------------------------------------------------------------|
| 请出示证件 (Papers Please)         | • 在困难难度下完成任务.<br/>• 使用最少的乘员组.                             |
| 停电 (Blackout)                    | • 在困难难度下完成任务.<br/>• 撤离全部幸存步兵与车辆.                       |
| 冷港行动 (Operation Cold Harbour)  | • 在困难难度下完成任务.<br/>• 不借助巴塔林 (Batalin), 独自占领港口全部目标. |
| 自助服务 (Self Service)            | • 在困难难度下完成任务.<br/>• 在 45 分钟内完成任务.                         |
| 禁航水域 (Forbidden Waters)        | • 在困难难度下完成任务.<br/>• 用 SSO 或 Spetsnaz VMF 击杀 50 个敌方单位.    |
| 搜索与救援 (Search & Rescue)       | • 在困难难度下完成任务.<br/>• 在 40 分钟内占领城市.                         |
| 舍我其谁 (The Ride of the VDV)     | • 在困难难度下完成任务.<br/>• 不使用 BMD-4M 或 Sprut-SD.                    |
| 归宿之路 (Road to Fiddler's Green) | • 在困难难度下完成任务.<br/>• 不向上校请求任何援助.                         |

### 金牌技巧

**冷港行动**

- 可以在 "夺取港口登陆场" 时提前将部分 PDSS 部署在码头左侧, 便于后续快速占领左侧区域. 进入下一阶段后使用直升机快速清剿左侧区域的敌人, 然后占领.
- 占领左侧区域后, 巴塔林并不会主动占领右侧区域, 因此后续一定能达成 "独自占领港口全部目标" 这一条件.

**禁航水域**

- 在 SSO 或 Spetsnaz VMF 完成击杀时, 屏幕左侧会显示喇叭图标和当前击杀数.
- 可以依靠 Spetsnaz VMF 或其他侦察单位提供视野, 然后通过 SSO 的 Kornet-M 从远距离打击敌方人员和载具单位.
- 如需轻松完成 50 击杀的目标, 需要让其他单位在合适的时候启用 "仅还击", 避免直接击杀敌军单位.

**舍我其谁**

- 集中兵力防御单个位置, 所有位置都被敌方占领才会判定为任务失败.

**归宿之路**

- 任务前期德米多夫上校会询问玩家需要何种增援, 选择不需要任何增援即可.

### 人物关系

#### 美军

```mermaid
graph TD
    Bennet["<b>将军 (Bennet)</b><br/>陆军中将 / 最高指挥"]
    Williams["<b>威廉姆斯 (Williams)</b><br/>少校 → 中校 / 前线指挥"]
    Miller["<b>米勒 (Miller)</b><br/>律师/顾问 / CIA 权力夺取者"]
    Player["<b>指挥官 (Commander)</b><br/>玩家 / 道德关键"]
    
    Bennet -->|信任与战术指令| Williams
    Bennet -->|对立 昔日友谊破裂| Miller
    Williams -->|执行任务 建立信任| Player
    
    Miller -->|权力夺取 国家安全命令| Bennet
    Miller -->|提拔与胁迫| Williams
    Miller -->|强制指挥| Player
    
    Williams -. "共同反抗 道德同盟" .- Player
    
    style Miller fill:#F5A623,color:#000,stroke:#D97C1A,stroke-width:3px
    style Bennet fill:#4A90E2,color:#000,stroke:#2E5C8A,stroke-width:3px
    style Williams fill:#7ED321,color:#000,stroke:#5BA80E,stroke-width:3px
    style Player fill:#BD10E0,color:#000,stroke:#8B06A0,stroke-width:3px
```

#### 俄军

```mermaid
graph TD
    Lena["<b>莱娜 (Lena)</b><br/>SVR 特工 / 指挥官"]
    Demidov["<b>德米多夫 (Demidov)</b><br/>资深上校 / 战争英雄"]
    Batalin["<b>巴塔林 (Batalin)</b><br/>陆军上尉 / 崇拜者"]
    Player["<b>指挥官 (Commander)</b><br/>玩家 / 战术核心"]

    Lena -- "指挥与监视" --> Demidov
    Lena -- "利用与诱导" --> Batalin
    Demidov -- "直接领导" --> Player
    Demidov -- "指导与保护" --> Batalin
    
    Batalin -- "仰慕与服从" --> Demidov
    Batalin -. "竞争合作" .- Player
    
    Lena -- "揭露/报复" --> Demidov

    style Lena fill:#F5A623,color:#000,stroke:#D97C1A,stroke-width:3px
    style Demidov fill:#4A90E2,color:#000,stroke:#2E5C8A,stroke-width:3px
    style Batalin fill:#7ED321,color:#000,stroke:#5BA80E,stroke-width:3px
    style Player fill:#BD10E0,color:#000,stroke:#8B06A0,stroke-width:3px
```

## 教程

- [For those who aren't military geeks](https://steamcommunity.com/sharedfiles/filedetails/?id=3501205842): 介绍了常见的概念和术语, 可以帮助快速入门.

## 资源

- <https://ba-hub.net>
- <https://barmory.net>

## 参考

- <https://steamcommunity.com/sharedfiles/filedetails/?id=3505492842>
