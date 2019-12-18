//
//  LSObjectProxy.m
//  58.NSTimer使用中间代理
//
//  Created by 中创 on 2019/12/17.
//  Copyright © 2019 LS. All rights reserved.
//

#import "LSObjectProxy.h"

@implementation LSObjectProxy

+ (instancetype)proxyWithTarget:(id)target{
    LSObjectProxy * proxy = [[LSObjectProxy alloc] init];
    proxy.target = target;
    return proxy;
}

// 转发目标选择器
- (id)forwardingTargetForSelector:(SEL)aSelector{
    
    return self.target;
}

@end
