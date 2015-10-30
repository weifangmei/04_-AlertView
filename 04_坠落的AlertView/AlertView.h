//
//  AlertView.h
//  04_坠落的AlertView
//
//  Created by tarena on 15/9/15.
//  Copyright (c) 2015年 Fx. All rights reserved.
//

#import <UIKit/UIKit.h>

#pragma 定义宏

#define kAlertWidth 245.0f
#define kAlertHeight 160.0f
#define kTitleYOffset 15.0f
#define kTitleHeight 25.0f

#define kContentOffset 30.0f
#define kBetweenLabelOffset 20.0f
#define kSingleButtonWidth 160.0f
#define kCoupleButtonWidth 107.0f
#define kButtonHeight 40.0f
#define kButtonBottomOffset 10.0f




@interface AlertView : UIView

#pragma 定义属性

@property (nonatomic, strong) UILabel *alertTitleLabel;
@property (nonatomic, strong) UILabel *alertContentLabel;
@property (nonatomic, strong) UIButton *Btn;

@property (nonatomic, strong) UIView *backImageView;

- (void)show;
- (id)initWithTitle:(NSString *)title contentText:(NSString *)content ButtonTitle:(NSString *)Title;


@end
