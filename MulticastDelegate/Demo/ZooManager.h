//
//  ZooManager.h
//  MulticastDelegate
//
//  Created by LH'sMacbook on 16/5/14.
//  Copyright © 2016年 LH. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "MulticastDelegate.h"
#import "ZooProtocol.h"

@interface ZooManager : NSObject

+ (ZooManager *)sharedInstance;

- (void)addDelegate:(id)delegate;
- (void)removeDelegate:(id)delegate;

- (void)doManage;

@end
