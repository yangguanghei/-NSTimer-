//
//  NSTimer+Resolve.h
//  58.NSTimer使用中间代理
//
//  Created by 中创 on 2019/12/18.
//  Copyright © 2019 LS. All rights reserved.
//



#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSTimer (Resolve)

+ (NSTimer *)resolve_scheduledTimerWithTimeInterval:(NSTimeInterval)inerval repeats:(BOOL)repeats block:(void (^)(NSTimer *timer))block;

@end

NS_ASSUME_NONNULL_END
