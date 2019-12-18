//
//  NSTimer+Resolve.m
//  58.NSTimer使用中间代理
//
//  Created by 中创 on 2019/12/18.
//  Copyright © 2019 LS. All rights reserved.
//

#import "NSTimer+Resolve.h"



@implementation NSTimer (Resolve)

+ (NSTimer *)resolve_scheduledTimerWithTimeInterval:(NSTimeInterval)inerval repeats:(BOOL)repeats block:(void (^)(NSTimer *timer))block{

    return [NSTimer scheduledTimerWithTimeInterval:inerval target:self selector:@selector(resolve_blcokInvoke:) userInfo:[block copy] repeats:repeats];

}

+ (void)resolve_blcokInvoke:(NSTimer *)timer {

    void (^block)(NSTimer *timer) = timer.userInfo;

    if (block) {

        block(timer);

    }

}

@end
