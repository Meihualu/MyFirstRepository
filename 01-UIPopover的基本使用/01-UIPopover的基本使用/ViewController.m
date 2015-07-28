//
//  ViewController.m
//  01-UIPopover的基本使用
//
//  Created by Apple on 15/7/28.
//  Copyright (c) 2015年 Apple. All rights reserved.
//

#import "ViewController.h"
#import "LuMenuViewController.h"

@interface ViewController ()

- (IBAction)popMenu:(id)sender;

@property (nonatomic,strong) UIPopoverController * pop;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

/**
 弹出UIPopover菜单栏
 */
- (IBAction)popMenu:(id)sender {
    
    //0.创建内容控制器
    LuMenuViewController * menu = [[LuMenuViewController alloc] init];
    //1.创建一个popover
    UIPopoverController * pop = [[UIPopoverController alloc] initWithContentViewController:[[UINavigationController alloc] initWithRootViewController:menu]];
    self.pop = pop;
    //2.确定内容
//    pop.contentViewController = [[LuMenuViewController alloc] init];
    //3.设置尺寸
    pop.popoverContentSize = CGSizeMake(320, 44*4);
    //4.从哪里显示出来
    [pop presentPopoverFromBarButtonItem:sender permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
}

@end
