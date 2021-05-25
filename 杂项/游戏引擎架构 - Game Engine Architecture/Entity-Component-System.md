# Entity-Component-System(ECS)
ECS 架构分离了标识(entities), 数据(components)和行为(systems). ECS 具有以下几个优点:  
- 模块化: ECS 可以增加代码重用, 避免代码体积迅速膨胀.
- 高性能: 数据以组件的形式添加, 内存管理自由, 可以有效利用数据局部性原理(Cache 友好).
- 避免继承带来的缺陷: 相比传统的继承, ECS 不用担心"菱形继承", 继承关系复杂等问题.
![Concept](assets/ECSBlock.png)  

## Archetypes
一种独特的组件类型组合被称为一个 Archetype. 如下图, 可以通过组件类型的组合分为 M, N 两种 Archtype. 对组件类型的改动也会造成实体 Archtype 的改变. 例如, 移除实体B的 Renderer 组件会使其的 Archtype 从 M 变为 N.  
![Archtype](assets/Archetype.png)  

## Memory Chunks
实体组件的存储位置取决于其 Archtype. ECS 申请的内存块被简称为 chunk. 每个 chunk 只会存储相同 Archtype 的实体.  
![Chunk](assets/ArchetypeChunk.png)  
