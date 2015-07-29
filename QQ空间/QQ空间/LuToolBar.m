//
//  LuToolBar.m
//  QQ空间
//
//  Created by Apple on 15/7/29.
//  Copyright (c) 2015年 Apple. All rights reserved.
//

#import "LuToolBar.h"

/* 
  底部工具条
*/
@implementation LuToolBar

-(instancetype)initWithFrame:(CGRect)frame{

    if (self = [super initWithFrame:frame]) {
        //创建按钮
        [self setupButton:@"tabbar_photo"];
        [self setupButton:@"tabbar_mood"];
        [self setupButton:@"tabbar_blog"];
    }
    return self;
    
}

-(void)setupButton:(NSString *)icon{
    UIButton * button = [[UIButton alloc] init];
    [button setImage:[UIImage imageNamed:icon] forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:@"tabbar_separate_selected_bg"] forState:UIControlStateHighlighted];
    [self addSubview:button];
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    long count = self.subviews.count;
    
    if (Lanscape) {
        for (int i = 0; i < count; i ++) {
            UIButton * button = self.subviews[i];
            button.height = self.height;
            button.width = self.width / count;
            button.y = 0;
            button.x = button.width * i;
        }
    } else {
        for (int i = 0; i < count; i ++) {
            UIButton * button = self.subviews[i];
            button.height = self.height / count;
            button.width = self.width;
            button.x = 0;
            button.y = button.height * i;
        }
    }

}
@end
