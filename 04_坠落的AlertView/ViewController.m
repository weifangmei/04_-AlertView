//
//  ViewController.m
//  04_坠落的AlertView
//
//  Created by tarena on 15/9/15.
//  Copyright (c) 2015年 Fx. All rights reserved.
//

#import "ViewController.h"
#import "AlertView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(self.view.frame.size.width / 3, self.view.frame.size.height / 3, 150, 30)];
    
    [btn setTitle:@"弹出AleatView" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(showAleatView) forControlEvents:UIControlEventTouchDown];
    
    [self.view addSubview:btn];
    
    
    
}

-(void)showAleatView {
    
    NSLog(@"1111");
    
    AlertView *alertView = [[AlertView alloc]initWithTitle:@"小提示" contentText:@"这个视图具有着落的效果" ButtonTitle:@"see you"];
    [alertView show];
}





@end
