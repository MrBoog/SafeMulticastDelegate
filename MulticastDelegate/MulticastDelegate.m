//
//  MulticastDelegate.m
//  AOP
//
//  Created by LH'sMacbook on 16/5/10.
//  Copyright © 2016年 LH. All rights reserved.
//

#import "MulticastDelegate.h"

@interface MulticastDelegate ()
{
    NSHashTable *_delegates;
}
@end

@implementation MulticastDelegate

- (instancetype)init{
    _delegates = [NSHashTable hashTableWithOptions:NSHashTableWeakMemory];
    return self;
}

- (void)addDelegate:(id)delegate{
    if (delegate != nil) {
        [_delegates addObject:delegate];
    }else{
        NSAssert(NO, @"delegate couldn't be nil");
    }
}

- (void)removeDelegate:(id)delegate{
    [_delegates removeObject:delegate];
}

- (void)removeAllDelegates{
    [_delegates removeAllObjects];
}

#pragma mark - override
- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel
{
    for (id delegate in _delegates) {
        
        NSMethodSignature *result = [delegate methodSignatureForSelector:sel];
        if (result != nil) {
            return result;
        }
    }
   
    // This causes a crash...
    //        return [super methodSignatureForSelector:sel];
    return [[self class] instanceMethodSignatureForSelector:@selector(doNothing)];
}

- (void)forwardInvocation:(NSInvocation *)invocation
{
    SEL sel = invocation.selector;
    
    for (id delegate in _delegates) {
        if ([delegate respondsToSelector:sel]) {
            [invocation invokeWithTarget:delegate];
        }else{
            
            // This causes a crash...
            //        [super forwardInvocation:invocation];
            [self doNothing];
        }
    }
}

- (void)doNothing{
    NSLog(@"-------> %s",__func__);
}
@end
