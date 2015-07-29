//
//  HomeViewController.m
//  QQ空间
//
//  Created by Apple on 15/7/29.
//  Copyright (c) 2015年 Apple. All rights reserved.
//

#import "HomeViewController.h"
#import "LUDock.h"
#import "UIView+Extension.h"
#import "Masonry.h"

@interface HomeViewController ()

@property (nonatomic,strong) LUDock * dock;
@property (nonatomic,strong) UIViewController * showingVC;//正在显示的控制器

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置背景色
    self.view.backgroundColor = LuColor(55, 55, 55);
    
    //初始化子控制器
    [self setupChildVcs];
    
    //根据屏幕方向设置dock的属性
    [self willRotateToInterfaceOrientation:self.interfaceOrientation duration:0];
    
    //监听通知：注意监听通知的位置一定要在LUDock初始化之前，否则默认选中第一个Button无法实现。
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(tabBarDidSelect:) name:LuTabBarDidSelectionNotification object:nil];
    
    //默认选中第0个控制器
    [self switchChildVc:0];
    
}

-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
/*
  初始化Dock
 */

-(LUDock *)dock{
    if (!_dock) {
        //创建Dock
        LUDock * dock = [[LUDock alloc] init];
        [self.view addSubview:dock];
        _dock = dock;
    }
    return _dock;
}

-(void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration{
    
    if ( UIInterfaceOrientationIsLandscape(toInterfaceOrientation)) { //横屏
        NSLog(@"横屏");
        self.dock.width = LuDockLW;
        self.dock.height = LuScreenPW;

    } else {//竖屏
        NSLog(@"竖屏");
        self.dock.width = LuDockPW;
        self.dock.height = LuScreenLW;
    }
    
    /* 使用autolayout代替
    self.showingVC.view.x = self.dock.width;
    self.showingVC.view.y = 0;
    
    self.showingVC.view.height = self.view.height;
    self.showingVC.view.width = self.view.width - self.dock.width;
    
//    //控制器的View的autoresizingMask默认值是UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth
//    //即默认情况下，控制器的View会随之父控件的frame的伸缩做自动伸缩。
//    self.showingVC.view.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
    self.showingVC.view.autoresizingMask = UIViewAutoresizingNone;
     */

}

-(void)tabBarDidSelect:(NSNotification *)notification{
    NSDictionary * dic = notification.userInfo;
    int index = [dic[LuTabBarSelectIndex] intValue];
    
    
//    //切换子控制器
//    //移除当前正在显示控制器
//    [self.showingVC.view removeFromSuperview];
//    
//    //显示index对应的子控制器
//    UIViewController *  newVc = self.childViewControllers[index];
//    /*使用autolayout代替
//    newVc.view.y = 0;
//    newVc.view.x = self.dock.width;
//    newVc.view.height = self.view.height;
//    newVc.view.width = self.view.width - self.dock.width;
//    */
//    [self.view addSubview:newVc.view];
//    [newVc.view mas_makeConstraints:^(MASConstraintMaker *make) {
//        /* 该框架直接赋值及额外加值的用法
//         make.width.mas_equalTo(600).width.offset(100);
//         make.width.mas_equalTo(600);
//
//         */
//        make.right.mas_equalTo(self.view.mas_right);
//        make.top.equalTo(self.view.mas_top);
//        make.bottom.equalTo(self.view.mas_bottom);
//        make.left.equalTo(self.dock.mas_right);
//    }];
//    
//   
//    self.showingVC = newVc;
    [self switchChildVc:index];
}

#pragma mark 切换子控制器
-(void)switchChildVc:(int)index{
    
    //移除当前正在显示控制器
    [self.showingVC.view removeFromSuperview];
    
    //显示index对应的子控制器
    UIViewController *  newVc = self.childViewControllers[index];
    /*使用autolayout代替
     newVc.view.y = 0;
     newVc.view.x = self.dock.width;
     newVc.view.height = self.view.height;
     newVc.view.width = self.view.width - self.dock.width;
     */
    [self.view addSubview:newVc.view];
    [newVc.view mas_makeConstraints:^(MASConstraintMaker *make) {
        /* 该框架直接赋值及额外加值的用法
         make.width.mas_equalTo(600).width.offset(100);
         make.width.mas_equalTo(600);
         
         */
        make.right.mas_equalTo(self.view.mas_right);
        make.top.equalTo(self.view.mas_top);
        make.bottom.equalTo(self.view.mas_bottom);
        make.left.equalTo(self.dock.mas_right);
    }];
    
    
    self.showingVC = newVc;
}

#pragma mark 初始化子控制器
-(void)setupChildVcs{

    for (int i = 0;i < 6; i ++) {
        UIViewController * vc = [[UIViewController alloc] init];
        vc.view.backgroundColor = LuRandColor;
        [self addChildViewController:vc];
    }
    
}
@end
