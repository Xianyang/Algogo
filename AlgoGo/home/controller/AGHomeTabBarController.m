//
//  AGHomeTabBarController.m
//  AlgoGo
//
//  Created by JessieYong on 16/9/14.
//  Copyright © 2016年 Axiom. All rights reserved.
//

#import "AGHomeTabBarController.h"
#import "JTNavigationController.h"
#import "AGTradeViewController.h"
#import "AGInfoViewController.h"
#import "AGAccountController.h"

#import "AGTabBar.h"
#import "UIImage+Image.h"

@interface AGHomeTabBarController ()
@end

@implementation AGHomeTabBarController

#pragma mark - 第一次使用当前类的时候对设置UITabBarItem的主题
+ (void)initialize
{
    UITabBarItem *tabBarItem = [UITabBarItem appearanceWhenContainedInInstancesOfClasses:@[self]];
    
    NSMutableDictionary *dictNormal = [NSMutableDictionary dictionary];
    dictNormal[NSForegroundColorAttributeName] = [UIColor grayColor];
    dictNormal[NSFontAttributeName] = [UIFont systemFontOfSize:11];
    
    NSMutableDictionary *dictSelected = [NSMutableDictionary dictionary];
    dictSelected[NSForegroundColorAttributeName] = [UIColor darkGrayColor];
    dictSelected[NSFontAttributeName] = [UIFont systemFontOfSize:11];
    
    [tabBarItem setTitleTextAttributes:dictNormal forState:UIControlStateNormal];
    [tabBarItem setTitleTextAttributes:dictSelected forState:UIControlStateSelected];
    
}


- (void)viewDidLoad{
//    self.title = @"Home";
//    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//    AGTradeViewController *firstVC = [storyboard instantiateViewControllerWithIdentifier:@"tradeController"];
//    UITabBarItem *firstItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemFavorites tag:1];
//    firstVC.title = @"First";
//    firstVC.tabBarItem = firstItem;
//    JTNavigationController *firstNav = [[JTNavigationController alloc] initWithRootViewController:firstVC];
//    firstNav.fullScreenPopGestureEnabled = YES;
//    
//    AGInfoViewController *secondVC = [[AGInfoViewController alloc] init];
//    UITabBarItem *secondItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemTopRated tag:2];
//    secondVC.title = @"Second";
//    secondVC.tabBarItem = secondItem;
//    JTNavigationController *secondNav = [[JTNavigationController alloc] initWithRootViewController:secondVC];
//    secondNav.fullScreenPopGestureEnabled = NO;
//    
//    AGAccountController *thirdVC = [[AGAccountController alloc] init];
//    UITabBarItem *thirdItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemTopRated tag:3];
//    secondVC.title = @"Third";
//    secondVC.tabBarItem = thirdItem;
//    JTNavigationController *thirdNav = [[JTNavigationController alloc] initWithRootViewController:thirdVC];
//    thirdNav.fullScreenPopGestureEnabled = NO;
//    
//    self.viewControllers = @[firstNav, secondNav, thirdNav];
    
    
    //创建自己的tabbar，然后用kvc将自己的tabbar和系统的tabBar替换下
    AGTabBar *tabBar = [[AGTabBar alloc] init];
    //kvc实质是修改了系统的_tabBar
    [self setValue:tabBar forKeyPath:@"tabBar"];
    
    [self setUpAllChildVc];

}

#pragma mark - ------------------------------------------------------------------
#pragma mark - 初始化tabBar上除了中间按钮之外所有的按钮

- (void)setUpAllChildVc
{

    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    AGInfoViewController *infoVC = [storyboard instantiateViewControllerWithIdentifier:@"infoController"];
    [self setUpOneChildVcWithVc:infoVC Image:@"home_normal" selectedImage:@"home_highlight" title:@"资讯"];
    
    AGTradeViewController *firstVC = [storyboard instantiateViewControllerWithIdentifier:@"tradeController"];
    [self setCenterVc:firstVC Image:@"post_normal" selectedImage:@"post_normal" title:@"交易"];
    
    AGAccountController *accountVC = [storyboard instantiateViewControllerWithIdentifier:@"accountController"];
    [self setUpOneChildVcWithVc:accountVC Image:@"account_normal" selectedImage:@"account_highlight" title:@"我的"];
    
    



}

#pragma mark - 初始化设置tabBar上面单个按钮的方法

/**
 *  @author li bo, 16/05/10
 *
 *  设置单个tabBarButton
 *
 *  @param Vc            每一个按钮对应的控制器
 *  @param image         每一个按钮对应的普通状态下图片
 *  @param selectedImage 每一个按钮对应的选中状态下的图片
 *  @param title         每一个按钮对应的标题
 */
- (void)setUpOneChildVcWithVc:(UIViewController *)Vc Image:(NSString *)image selectedImage:(NSString *)selectedImage title:(NSString *)title
{
    JTNavigationController *nav = [[JTNavigationController alloc] initWithRootViewController:Vc];
    
    
    UIImage *myImage = [UIImage imageNamed:image];
    myImage = [myImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    //tabBarItem，是系统提供模型，专门负责tabbar上按钮的文字以及图片展示
    Vc.tabBarItem.image = myImage;
    
    UIImage *mySelectedImage = [UIImage imageNamed:selectedImage];
    mySelectedImage = [mySelectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    Vc.tabBarItem.selectedImage = mySelectedImage;
    
    Vc.tabBarItem.title = title;
    
    Vc.navigationItem.title = title;
    
    [self addChildViewController:nav];
    
}



- (void)setCenterVc:(UIViewController *)Vc Image:(NSString *)image selectedImage:(NSString *)selectedImage title:(NSString *)title
{
    JTNavigationController *nav = [[JTNavigationController alloc] initWithRootViewController:Vc];
    
    
    UIImage *myImage = [UIImage imageNamed:image];
    myImage = [myImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    //tabBarItem，是系统提供模型，专门负责tabbar上按钮的文字以及图片展示
    Vc.tabBarItem.image = myImage;
    
    UIImage *mySelectedImage = [UIImage imageNamed:selectedImage];
    mySelectedImage = [mySelectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    Vc.tabBarItem.selectedImage = mySelectedImage;
    
    //Vc.tabBarItem.title = title;
    
    Vc.navigationItem.title = title;
    
    [self addChildViewController:nav];
    
}





#pragma mark - ------------------------------------------------------------------
#pragma mark - LBTabBarDelegate
////点击中间按钮的代理方法
//- (void)tabBarPlusBtnClick:(AGTabBar *)tabBar
//{
//    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//    AGTradeViewController *firstVC = [storyboard instantiateViewControllerWithIdentifier:@"tradeController"];
//    JTNavigationController *navVc = [[JTNavigationController alloc] initWithRootViewController:firstVC];
//    [self.navigationController pushViewController:navVc animated:YES];
//    [self presentViewController:navVc animated:YES completion:nil];
//    
//}



@end
