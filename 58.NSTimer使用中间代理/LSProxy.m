//
//  LSProxy.m
//  58.NSTimer使用中间代理
//
//  Created by 中创 on 2019/12/17.
//  Copyright © 2019 LS. All rights reserved.
//

#import "LSProxy.h"

@implementation LSProxy

+ (instancetype)proxyWithTarget:(id)target{
    LSProxy * proxy = [LSProxy alloc];
    proxy.target = target;
    return proxy;
}

// 选择器的方法签名
- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel{
    return [self.target methodSignatureForSelector:sel];
}
- (void)forwardInvocation:(NSInvocation *)invocation{
    [invocation invokeWithTarget:self.target];
}

@end
