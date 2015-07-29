//
//  LuTabbarButton.m
//  QQ空间
//
//  Created by Apple on 15/7/29.
//  Copyright (c) 2015年 Apple. All rights reserved.
//

#import "LuTabbarButton.h"

@implementation LuTabbarButton


-(instancetype)initWithFrame:(CGRect)frame{

    if (self =[super initWithFrame:frame]) {
        
        self.imageView.contentMode = UIViewContentModeCenter;
        [self setBackgroundImage:[UIImage imageNamed:@"tabbar_separate_selected_bg"] forState:UIControlStateDisabled];
        //按下为弹起时，imageview不要有改变
        self.adjustsImageWhenDisabled = NO;
        self.adjustsImageWhenHighlighted = NO;
    }
    return self;
}

//-(void)setHighlighted:(BOOL)highlighted{}

-(void)layoutSubviews{
    
    [super layoutSubviews];
    if (Lanscape) {
        
        self.imageView.height = self.height;
        self.imageView.width = self.width * 0.4;
        self.imageView.x = 0;
        self.imageView.y = 0;
        
        self.titleLabel.hidden = NO;
        self.titleLabel.y = 0;
        self.titleLabel.x = self.imageView.width;
        self.titleLabel.width = self.width - self.imageView.width;
        self.titleLabel.height = self.height;
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        
    } else {
        self.titleLabel.hidden = YES;
        self.imageView.frame = self.bounds;
    }
    
}
@end
