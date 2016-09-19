//
//  AGStrategyViewController.m
//  AlgoGo
//
//  Created by JessieYong on 16/9/14.
//  Copyright © 2016年 Axiom. All rights reserved.
//

#import "AGStrategyViewController.h"
#import "AGChartViewController.h"

@implementation AGStrategyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Strategy";
    //self.navigationController.navigationBar.barTintColor = [UIColor randomColor];
    //self.view.backgroundColor = [UIColor randomColor];
    UIControl *control = [[UIControl alloc] initWithFrame:self.view.frame];
    [self.view addSubview:control];
    [control addTarget:self action:@selector(didTapNextButton) forControlEvents:UIControlEventTouchDown];
    //self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Next" style:UIBarButtonItemStylePlain target:self action:@selector(didTapNextButton)];

    //    self.jt_fullScreenPopGestureEnabled = NO; //关闭当前控制器的全屏返回手势
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleDefault;
}

- (void)didTapNextButton {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    AGChartViewController *chartViewController = [storyboard instantiateViewControllerWithIdentifier:@"chartController"];
    chartViewController.hidesBottomBarWhenPushed = NO;
    [self.navigationController pushViewController:chartViewController animated:YES];
}

@end
