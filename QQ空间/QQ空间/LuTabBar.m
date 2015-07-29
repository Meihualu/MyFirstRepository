//
//  LuTabBar.m
//  QQ空间
//
//  Created by Apple on 15/7/29.
//  Copyright (c) 2015年 Apple. All rights reserved.
//

#import "LuTabBar.h"
#import "LuTabbarButton.h"

@interface LuTabBar()

@property (nonatomic,strong) LuTabbarButton * selectedBtn;

@end

@implementation LuTabBar

-(instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        //创建按钮
        //默认选中第一个Button
        LuTabbarButton * button = [self setupButton:@"tab_bar_friend_icon" title:@"aaa"];
//        [self buttonClick:button]; 最好不要在一开始就模拟点击，否则将会在第一个发出通知时导致死循环。
        button.enabled = NO;
        self.selectedBtn = button;
        
        [self setupButton:@"tab_bar_friend_icon"  title:@"bbb"];
        [self setupButton:@"tab_bar_friend_icon"  title:@"ccc"];
        [self setupButton:@"tab_bar_friend_icon" title:@"ddd"];
        [self setupButton:@"tab_bar_friend_icon"  title:@"eee"];
        [self setupButton:@"tab_bar_friend_icon"  title:@"fff"];
        
    }
    return self;
    
}

-(LuTabbarButton *)setupButton:(NSString *)icon title:(NSString *)title{
    LuTabbarButton * button = [[LuTabbarButton alloc] init];
    [button setImage:[UIImage imageNamed:icon] forState:UIControlStateNormal];
    [button setTitle:title forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:button];
    return button;
}

#pragma mark 选中按钮不能再点击
-(void)buttonClick:(LuTabbarButton *)button{
    self.selectedBtn.enabled = YES;
    button.enabled = NO;
    self.selectedBtn = button;
    
    //发出通知
    [[NSNotificationCenter defaultCenter] postNotificationName:LuTabBarDidSelectionNotification object:nil userInfo:@{LuTabBarSelectIndex:@(button.tag)}];
    
}

-(void)layoutSubviews{

    [super layoutSubviews];
    long count = self.subviews.count;
    for (int i = 0; i < count; i ++) {
        LuTabbarButton * button = self.subviews[i];
        button.height = self.height  / count;
        button.width = self.width;
        button.x = 0;
        button.y = button.height * i;
        button.tag = i;
    }
    
}

@end
