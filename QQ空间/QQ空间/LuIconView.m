//
//  LuIconView.m
//  QQ空间
//
//  Created by Apple on 15/7/29.
//  Copyright (c) 2015年 Apple. All rights reserved.
//

#import "LuIconView.h"

@implementation LuIconView

-(instancetype)initWithFrame:(CGRect)frame{

    if (self = [super initWithFrame:frame]) {
        [self setImage:[UIImage imageNamed:@"lufy"] forState:UIControlStateNormal];
        [self setTitle:@"路飞" forState:UIControlStateNormal];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.imageView.layer.cornerRadius = 10;
    }
    return self;
}


-(void)layoutSubviews{
    
    [super layoutSubviews];
    
    if (Lanscape) {
        self.imageView.y = 0;
        self.imageView.width = self.width;
        self.imageView.height = self.width;
        
        self.titleLabel.hidden = NO;
        self.titleLabel.x = 0;
        self.titleLabel.y = self.imageView.height;
        self.titleLabel.height = self.height - self.imageView.height;
        self.titleLabel.width = self.width;
    } else {
        self.titleLabel.hidden = YES;
        self.imageView.frame = self.bounds;
    }
}
@end
