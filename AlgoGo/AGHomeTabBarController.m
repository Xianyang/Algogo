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

@implementation AGHomeTabBarController

- (void)viewDidLoad{
    self.title = @"Home";
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    AGTradeViewController *firstVC = [storyboard instantiateViewControllerWithIdentifier:@"tradeController"];
    UITabBarItem *firstItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemFavorites tag:1];
    firstVC.title = @"First";
    firstVC.tabBarItem = firstItem;
    JTNavigationController *firstNav = [[JTNavigationController alloc] initWithRootViewController:firstVC];
    firstNav.fullScreenPopGestureEnabled = YES;
    
    AGTradeViewController *secondVC = [[AGTradeViewController alloc] init];
    UITabBarItem *secondItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemTopRated tag:2];
    secondVC.title = @"Second";
    secondVC.tabBarItem = secondItem;
    JTNavigationController *secondNav = [[JTNavigationController alloc] initWithRootViewController:secondVC];
    secondNav.fullScreenPopGestureEnabled = NO;
    
    self.viewControllers = @[firstNav, secondNav];
}



@end
