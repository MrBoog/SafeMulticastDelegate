//
//  ZooManager.m
//  MulticastDelegate
//
//  Created by LH'sMacbook on 16/5/14.
//  Copyright © 2016年 LH. All rights reserved.
//

#import "ZooManager.h"

@interface ZooManager ()
{
    MulticastDelegate <ZooProtocol>*_multicastDelegate;
}
@end

@implementation ZooManager

+ (ZooManager *)sharedInstance{
    static ZooManager *sharedInstance = nil;

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (instancetype)init
{
    if (self = [super init]) {
        _multicastDelegate = [(MulticastDelegate <ZooProtocol>*)[MulticastDelegate alloc] init];
    }
    return self;
}

- (void)addDelegate:(id)delegate
{
    [_multicastDelegate addDelegate:delegate];
}

- (void)removeDelegate:(id)delegate
{
    [_multicastDelegate removeDelegate:delegate];
}

- (void)doManage
{
    [_multicastDelegate goToSleep];
    [_multicastDelegate feeding];
}

- (void)dealloc
{
    NSLog(@"-------> %s",__func__);
}

@end
