//
//  Camel.m
//  MulticastDelegate
//
//  Created by LH'sMacbook on 16/5/14.
//  Copyright © 2016年 LH. All rights reserved.
//

#import "Camel.h"
#import "ZooManager.h"

@implementation Camel

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)goToSleep
{
    NSLog(@"-------> %s",__func__);
}

- (void)feeding
{
    NSLog(@"-------> %s",__func__);
}

- (void)dealloc
{

}
@end
