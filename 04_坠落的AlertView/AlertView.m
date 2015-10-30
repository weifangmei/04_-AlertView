//
//  AlertView.m
//  04_坠落的AlertView
//
//  Created by tarena on 15/9/15.
//  Copyright (c) 2015年 Fx. All rights reserved.
//

#import "AlertView.h"

@implementation AlertView
/* 功能初始化警告视图*/
- (id)initWithTitle:(NSString *)title
        contentText:(NSString *)content
        ButtonTitle:(NSString *)Title{
    
    if (self = [super init]) {
        self.layer.cornerRadius = 5.0;
        //设置背景颜色
        self.backgroundColor = [UIColor whiteColor];
        //创建并设置标签对象， 用来显示警告视图的标题
        self.alertTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, kTitleYOffset, kAlertWidth, kTitleHeight)];
        self.alertTitleLabel.font = [UIFont boldSystemFontOfSize:20.0f];
        
        //设置字体
        self.alertTitleLabel.textColor = [UIColor colorWithRed:56.0/255.0 green:64.0/255.0 blue:71.0/255.0 alpha:1];
        //添加到视图对象
        [self addSubview:self.alertTitleLabel];
        
        CGFloat contentLabelWidth = kAlertWidth - 16;
        
        //创建并设置标签栏、 用来显示警告视图的信息
        self.alertContentLabel = [[UILabel alloc] initWithFrame:CGRectMake((kAlertWidth - contentLabelWidth) * 0.5, CGRectGetMaxY(self.alertTitleLabel.frame), contentLabelWidth, 60)];
        //设置行数
        self.alertContentLabel.numberOfLines = 0;
        self.alertContentLabel.textAlignment =self.alertTitleLabel.textAlignment = NSTextAlignmentCenter;
        self.alertContentLabel.textColor = [UIColor colorWithRed:127.0/255.0 green:127.0/255.0 blue:127.0/255.0 alpha:1];
        self.alertContentLabel.font = [UIFont systemFontOfSize:15.0f];
 
        [self addSubview:self.alertContentLabel];
        
        CGRect BtnFrame;
        
        
        BtnFrame = CGRectMake((kAlertWidth - kSingleButtonWidth) * 0.5, kAlertHeight - kButtonBottomOffset - kButtonHeight, kSingleButtonWidth, kButtonHeight);
        self.Btn = [UIButton buttonWithType:UIButtonTypeCustom];
        //设置框架
        self.Btn.frame = BtnFrame;
        
    }
    //设置文本颜色
    [self.Btn setBackgroundColor:[UIColor colorWithRed:227.0/255.0 green:100.0/255.0 blue:83.0/255.0 alpha:1]];
    //设置按钮Title
    [self.Btn setTitle:Title forState:UIControlStateNormal];
    //设置按钮字体大小
    self.Btn.titleLabel.font  = [UIFont boldSystemFontOfSize:14];
    //设置按钮颜色
    [self.Btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    //设置按钮触发方法
    [self.Btn addTarget:self action:@selector(BtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    //设置圆角半径
    self.Btn.layer.cornerRadius = 3.0;
    //把按钮添加到视图上
    [self addSubview:self.Btn];
    
    //设置警告框的标签文字
    self.alertTitleLabel.text = title;
    //设置警告框的内容文字
    self.alertContentLabel.text = content;
    
    
    //创建弹出警告框右上角的按钮
    UIButton *xButton = [UIButton buttonWithType:UIButtonTypeCustom];
    //设置按钮显示的图片
    [xButton setImage:[UIImage imageNamed:@"1.png"] forState:UIControlStateNormal];
    [xButton setImage:[UIImage imageNamed:@"2.png"] forState:UIControlStateHighlighted];
    
    [xButton setTitle:@"0" forState:UIControlStateNormal];
    
    //设置位置
    xButton.frame = CGRectMake(kAlertWidth - 32, 0, 32, 32);
    //把按钮添加到警告框视图上面
    [self addSubview:xButton];
    //点击这个Button触发的方法
    [xButton addTarget:self action:@selector(dismissAlert) forControlEvents:UIControlEventTouchUpInside];
    return self;

}

//单击按钮，实现关闭警告视图的功能
- (void)BtnClicked:(id)sender
{
    
    [self dismissAlert];
    

}
//显示警告视图
- (void)show
{
    UIWindow *shareWindow = [UIApplication sharedApplication].keyWindow;
    self.frame = CGRectMake((CGRectGetWidth(shareWindow.bounds) - kAlertWidth) * 0.5, - kAlertHeight - 30, kAlertWidth, kAlertHeight);
    //设置框架
    [shareWindow addSubview:self];

}
//隐藏警告视图
- (void)dismissAlert
{
    [self removeFromSuperview];//移除

}
//移除当前
- (void)removeFromSuperview
{
    [self.backImageView removeFromSuperview];
    self.backImageView = nil;
    UIWindow *shareWindow = [UIApplication sharedApplication].keyWindow;
    CGRect afterFrame = CGRectMake((CGRectGetWidth(shareWindow.bounds) - kAlertWidth) * 0.5, CGRectGetHeight(shareWindow.bounds), kAlertWidth, kAlertHeight);
    
    //设置坠落的动画效果
    [UIView animateWithDuration:0.35f delay:0.0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        //设置框架
        self.frame = afterFrame;
        
        //设置旋转
        self.transform = CGAffineTransformMakeRotation(M_1_PI / 1.5);
    } completion:^(BOOL finished) {
        //从父视图移除
        [super removeFromSuperview];
    }];
}


// 在视图移动前 调用、将父视图改变为指定的父视图
- (void)willMoveToSuperview:(UIView *)newSuperview
{
    if (newSuperview == nil) {
        return;
    }
    UIWindow *shareWindow = [UIApplication sharedApplication].keyWindow;
    
    if (!self.backImageView) {
        //实例化
        self.backImageView = [[UIView alloc] initWithFrame:shareWindow.bounds];
    }
    //设置背景色
    self.backImageView.backgroundColor = [UIColor greenColor];
    //设置背景色的透明度
    self.backImageView.alpha = 0.6f;
    //添加视图对象
    [shareWindow addSubview:self.backImageView];
    
    self.transform = CGAffineTransformMakeRotation(-M_1_PI / 2);
    CGRect afterFrame = CGRectMake((CGRectGetWidth(shareWindow.bounds) - kAlertWidth) * 0.5, (CGRectGetHeight(shareWindow.bounds) - kAlertHeight) * 0.5, kAlertWidth, kAlertHeight);
    //设置坠落动画效果
    [UIView animateWithDuration:0.35f delay:0.0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        self.transform = CGAffineTransformMakeRotation(0);
        //设置框架
        self.frame = afterFrame;
    } completion:^(BOOL finished) {
    }];
    [super willMoveToSuperview:newSuperview];

}




@end
