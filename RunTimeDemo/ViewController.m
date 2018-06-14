//
//  ViewController.m
//  RunTimeDemo
//
//  Created by 刘瑞 on 2018/6/13.
//  Copyright © 2018年 com.youxin7.uxin. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>
#import "Person.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    Person *person = [[Person alloc] init];
    unsigned int count = 0;
    Method *methods = class_copyMethodList([Person class], &count);
    for (int i = 0; i < count; i++) {
        
        Method method = methods[i];
        
        SEL methodSEL = method_getName(method);
        
        const char * selName = sel_getName(methodSEL);
        
        if (methodSEL) {
            NSLog(@"sel------%s", selName);
        }
    }
    SEL sel = NSSelectorFromString(@"eat");
    [person performSelector:sel];
    
    unsigned int count1 = 0;
    Method *methods1 = class_copyMethodList([Person class], &count1);
    for (int i = 0; i < count1; i++) {
        
        Method method = methods1[i];
        
        SEL methodSEL = method_getName(method);
        
        const char * selName = sel_getName(methodSEL);
        
        if (methodSEL) {
            NSLog(@"sel------%s", selName);
        }
    }
}

@end
