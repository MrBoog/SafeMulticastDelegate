//
//  main.m
//  MulticastDelegate
//
//  Created by LH'sMacbook on 16/5/14.
//  Copyright © 2016年 LH. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ZooManager.h"

#import "Tiger.h"
#import "Camel.h"
#import "Penguin.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        
        Camel *camel = [[Camel alloc] init];
        [[ZooManager sharedInstance] addDelegate:camel];
        
        Penguin *penguin = [[Penguin alloc] init];
        [[ZooManager sharedInstance] addDelegate:penguin];
        
        Tiger *tiger = [[Tiger alloc] init];
        [[ZooManager sharedInstance] addDelegate:tiger];
        
        
        [[ZooManager sharedInstance] doManage];
        
        
//        NSLog(@"%@%@%@",tiger,camel,penguin);
    }
    
    sleep(10);
    
    return 0;
}
