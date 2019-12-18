//
//  NextViewController.m
//  58.NSTimer使用中间代理
//
//  Created by 中创 on 2019/12/17.
//  Copyright © 2019 LS. All rights reserved.
//

#import "NextViewController.h"

#import "LSProxy.h"
#import "LSObjectProxy.h"
#import "LSTimer.h"
#import "NSTimer+Resolve.h"

@interface NextViewController ()
// 即使是weak修饰NSTimer也不行
@property (nonatomic, strong) NSTimer * timer;
@property (nonatomic, strong) LSObjectProxy * objP;
@property (nonatomic, strong) LSProxy * proxy;

@end

@implementation NextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor greenColor];
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:[LSObjectProxy proxyWithTarget:self] selector:@selector(timerAction) userInfo:nil repeats:YES];
    
    /* 测试消息转发
    self.objP = [LSObjectProxy proxyWithTarget:self];
    [self.objP performSelector:@selector(timerAction)];
    self.proxy = [LSProxy proxyWithTarget:self];
    [self.proxy performSelector:@selector(timerAction)];
     */
   
    
    /* 此方法不能解决循环引用
    __weak typeof(self) weakSelf = self;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerAction) userInfo:nil repeats:YES];
    */
    
    
    
    /*  此方法可解决循环引用且不用在dealloc方法中让self.Timer失效
        __weak typeof(self) weakSelf = self;
        self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 repeats:YES block:^(NSTimer * _Nonnull timer) {
            [weakSelf timerAction];
        }];
     */
    
    
    /*
    __weak typeof(self) weakSelf = self;
    self.timer = [NSTimer resolve_scheduledTimerWithTimeInterval:1.0 repeats:YES block:^(NSTimer * _Nonnull timer) {
        [weakSelf timerAction];
    }];
     */
    
}
- (void)timerAction{
    NSLog(@"%s", __func__);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)dealloc{
    [self.timer invalidate];
    NSLog(@"%s", __func__);
    self.timer = nil;
    NSLog(@"self.timer:%@",self.timer);
}

@end
