[Simulator Screen Recording - iPhone 15 Pro Max - 2025-07-05 at 08.11.17.mp4](../_resources/Simulator%20Screen%20Recording%20-%20iPhone%2015%20Pro%20Max%20-%202.mp4)
### Flutter架构
* 框架层
* 引擎层
* 嵌入层

  
### 渲染机制
* 三棵树机制（核心）
  >Widget 树：声明式 UI 配置（不可变，描述当前状态）。
  >
  >Element 树：Widget 的实例化，管理生命周期和状态（可变）。负责协调 Widget 树和 RenderObject 树（通过createElement()创建）。
  >
  >RenderObject 树：实际布局（Layout）、绘制（Paint）的实体（如RenderBox）。持有尺寸、位置等渲染信息，通过markNeedsPaint()触发重绘。

* 渲染流程：build → layout → paint → compositing
* 重排和重绘
  > 重排：组件的宽高、边距、对齐方式等布局属性有了变化。
  > 重绘：是指在布局确定之后，将组件绘制到屏幕上的过程。当组件的视觉外观发生变化，但布局信息保持不变时，就会触发重绘。

2、更新流程

* 当状态变更（如setState()），重建 Widget 树。

* Element 树对比新旧 Widget 树（Diff 算法），复用未变化的 Element/RenderObject。

* 仅更新变化的 RenderObject（避免全量重绘）。
  
* 生命周期
  1、initState()
  >组件创建后，首次插入到 widget 树时调用，且仅调用一次。

  2、didChangeDependencies()
  >首次构建前（在 initState 之后、build 之前）。
  
  3、
### 2、异步编程的核心要点
#### 事件循环
* 微任务队列
  >优先级最高。微任务会在当前代码执行完毕后立即执行，直到微任务队列为空。
  
* 事件队列
> 事件队列也是 FIFO 队列，用于处理低优先级的异步任务。它包含：
> *  定时器事件（如 Future.delayed）。
> *  I/O 事件（如文件读写、网络请求）。
> *  UI 绘制事件（如动画帧）。

#### 特点：
* 优先级低于微任务队列：只有当微任务队列清空后，事件队列的任务才会执行。
* UI 渲染依赖事件队列：如果事件队列被长时间任务阻塞，UI 会卡顿。

#### Flutter 的事件循环（Event Loop）遵循以下规则：
* 1、执行当前同步代码。
* 2、处理微任务队列：逐个执行微任务，直到队列为空。
* 3、处理事件队列的一个任务：从事件队列取出一个任务执行。
* 4、重复步骤 2 和 3：每次事件队列任务执行后，优先清空微任务队列。

#### Stream
* Single Subscription
	* 只能有一个订阅者：多次订阅会抛出异常。
	* 订阅后才开始生成事件：事件不会被存储，未订阅时发生的事件会丢失。
* Broadcast
	* 支持多个订阅者：每个订阅者独立接收事件。
	* 订阅者互不影响：一个订阅者的状态（如暂停、取消）不影响其他订阅者。
	* 事件无论是否有监听器都会发生

### 3、动画

* 隐式动画
  >隐式动画是最简单的动画实现方式，通过改变Widget属性自动生成过渡动画。

* 显示动画
  >显式动画提供更精细的控制，需要手动管理动画控制器和动画状态。
* 高性能需求 → Rive/Lottie

### 4、通信
* MethodChannel - 双向
  >调用原生方法并获取返回值，适合偶尔调用的场景（如获取设备信息）。

* EventChannel -单向 原生 → Flutter
  >流式数据传输，适合持续事件（如传感器数据、地理位置更新）。

* BasicMessageChannel - 双向
  >通用消息传递，支持自定义编解码，适合复杂数据结构。

* PlatformView - 双向
  >直接嵌入原生视图（如地图、视频播放器），性能开销较大。
  
### 5、性能优化

* 渲染优化

1、尽量减少重建范围
2、使用 const 构造函数减少 Widget 重建
3、对复杂列表使用 ListView.builder 或 Sliver 系列组件。
4、避免过度绘制
> RepaintBoundary 是一个特殊的 Widget，它在渲染树中创建一个边界，将其子树与父树隔离。当边界内的组件重绘时，不会触发外部组件的重绘；反之亦然。
>
> 核心优势：
减少重绘范围：将重绘限制在边界内，避免影响其他区域。
优化动画性能：对频繁变化的元素（如动画、滚动内容）使用边界，提升帧率。
缓存静态内容：对不经常变化的区域使用边界，减少不必要的重绘。

* 内存优化
1、本地图片尽量使用SVG、WEBP
2、 对象复用与缓存
3、及时释放资源（如 StreamSubscription、AnimationController）
* 卡顿
1、避免在 build 方法中执行耗时计算。
2、UI层级尽量扁平化
3、使用 const 构造函数减少 Widget 重建
4、对复杂列表使用 ListView.builder 或 Sliver 系列组件。

* 减少内存使用
1、及时释放资源（如 StreamSubscription、AnimationController）。
2、使用 Image.cache 控制图片缓存大小。
3、避免在长生命周期对象中持有大对象引用