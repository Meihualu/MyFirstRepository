//
//  LUDock.m
//  QQ空间
//
//  Created by Apple on 15/7/29.
//  Copyright (c) 2015年 Apple. All rights reserved.
//

#import "LUDock.h"
#import "LuIconView.h"
#import "LuTabBar.h"
#import "LuToolBar.h"



@interface LUDock()
@property (nonatomic,strong) LuIconView * iconView;
@property (nonatomic,strong) LuTabBar * tabBar;
@property (nonatomic,strong) LuToolBar * toolBar;

@end

@implementation LUDock

-(instancetype)initWithFrame:(CGRect)frame{

    if (self =[super initWithFrame:frame]) {
        
        //创建头像
        LuIconView * iconView = [[LuIconView alloc] init];
        [self addSubview:iconView];
        self.iconView = iconView;
        
        //创建abBar
        LuTabBar * tabBar = [[LuTabBar alloc] init];
        [self addSubview:tabBar];
        self.tabBar = tabBar;
        
        //创建toolbar
        LuToolBar * toolBar = [[LuToolBar alloc] init];
        [self addSubview:toolBar];
        self.toolBar = toolBar;
        
    }
    return self;
}

-(void)layoutSubviews{
    
    [super layoutSubviews];
    self.toolBar.width = self.width;
    self.tabBar.width = self.width;
    self.tabBar.height = self.tabBar.subviews.count * LuDockPW;
    
    if (Lanscape) {
        NSLog(@"横屏");
        self.toolBar.height = self.width / self.toolBar.subviews.count;
        
        self.iconView.width = self.width * 0.4;
        self.iconView.height = self.iconView.width + 30;
        self.iconView.x = (self.width - self.iconView.width ) / 2;
        self.iconView.y = (self.width - self.iconView.height - 20) / 2;
    } else {
        NSLog(@"竖屏");
        self.toolBar.height = self.width * self.toolBar.subviews.count;
        
        self.iconView.x = 5;
        self.iconView.y = 50;
        self.iconView.width = self.width - 2 * self.iconView.x;
        self.iconView.height = self.iconView.width;
    }
    
    self.toolBar.y = self.height - self.toolBar.height;
    self.tabBar.y = self.toolBar.y - self.tabBar.height;
}

@end
