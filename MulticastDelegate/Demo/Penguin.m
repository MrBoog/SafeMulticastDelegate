//
//  Penguin.m
//  MulticastDelegate
//
//  Created by LH'sMacbook on 16/5/14.
//  Copyright © 2016年 LH. All rights reserved.
//

#import "Penguin.h"
#import "ZooManager.h"

@implementation Penguin

- (instancetype)init
{
    self = [super init];
    if (self) {

    }
    return self;
}


- (void)feeding
{
    NSLog(@"-------> %s",__func__);
}

- (void)dealloc
{

}
@end
