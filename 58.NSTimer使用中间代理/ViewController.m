//
//  ViewController.m
//  58.NSTimer使用中间代理
//
//  Created by 中创 on 2019/12/17.
//  Copyright © 2019 LS. All rights reserved.
//

#import "ViewController.h"

#import "NextViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor yellowColor];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self presentViewController:[NextViewController new] animated:YES completion:nil];
}


@end
