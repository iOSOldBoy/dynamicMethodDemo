//
//  Person.m
//  RunTimeDemo
//
//  Created by 刘瑞 on 2018/6/14.
//  Copyright © 2018年 com.youxin7.uxin. All rights reserved.
//

#import "Person.h"
#import <objc/runtime.h>
#import "AppDelegate.h"

@implementation Person

- (void)play {
    NSLog(@"%s",__func__);
}

- (void)sleep {
    NSLog(@"%s",__func__);
}
//
//void eat(id self,SEL sel) {
//    NSLog(@"%@ %@",self,NSStringFromSelector(sel));
//}

+ (BOOL)resolveInstanceMethod:(SEL)sel {
    if (sel == @selector(eat)) {
        class_addMethod(self, @selector(eat), (IMP)eat, "v@:");
    }
    return [super resolveInstanceMethod:sel];
}
@end
