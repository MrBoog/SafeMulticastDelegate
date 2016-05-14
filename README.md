
#### Multicast Delegate in Oc


NSNotificationCenter 我们肯定都有使用过，通过发送广播，实现一对多的消息发送。NSNotificationCenter使用起来灵活性特别高，但有时候过度使用反而是NSNotificationCenter 弊端。在项目的设计中，我们也常会思考的一个问题：限制部分灵活性，以此来交换应用的可读性和可维护性。NSNotificationCenter 允许应用各种跨层访问，监听者要配合合理使用add、remove等方法，出了问题实在不好跟踪。在某些时刻，需要酌情考虑是否应该使用。

对于一对多的消息发送，其实还有很多办法可以考虑。比如说，我们可以通过**NSProxy 实现消息转发**，将我们普通一对一的delegate模式，改为一对多。

所以我自己写了这个简单的DEMO

在目前实现过程中，需要考虑的主要有下面三点：

**1. 使用[NSHashTable](http://nshipster.com/nshashtable-and-nsmaptable/) 处理循环引用问题**

既然是一对多，肯定需要有容器保存delegate指针，为避免循环引用等问题，考虑使用NSHashTable，代替数组字典

**2. 使用message forwarding转发消息**

`-methodSignatureForSelector:` 和 `-forwardInvocation:`两个方法是实现转发的关键，使用[NSProxy](https://developer.apple.com/library/mac/documentation/Cocoa/Reference/Foundation/Classes/NSProxy_Class/) 只是因为相对于 NSObject，NSProxy更专注于消息转发，没有其他太多无关的方法。

**3. 处理 @optional的协议方法 crash问题**

协议不可能都是 @required 肯定还有 @optional，在转发中记得处理可能crash的情况。


