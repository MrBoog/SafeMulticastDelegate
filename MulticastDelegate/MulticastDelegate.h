//
//  MulticastDelegate.h
//  AOP
//
//  Created by LH'sMacbook on 16/5/10.
//  Copyright © 2016年 LH. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MulticastDelegate : NSProxy

- (instancetype)init;


- (void)addDelegate:(id)delegate;
- (void)removeDelegate:(id)delegate;
- (void)removeAllDelegates;


@end
