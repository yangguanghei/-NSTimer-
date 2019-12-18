//
//  LSObjectProxy.h
//  58.NSTimer使用中间代理
//
//  Created by 中创 on 2019/12/17.
//  Copyright © 2019 LS. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LSObjectProxy : NSObject

+ (instancetype)proxyWithTarget:(id)target;
@property (nonatomic, weak) id target;

@end

NS_ASSUME_NONNULL_END
