//
//  AGChartViewController.m
//  AlgoGo
//
//  Created by JessieYong on 16/9/14.
//  Copyright © 2016年 Axiom. All rights reserved.
//

#import "AGChartViewController.h"

@implementation AGChartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Chart";
    //self.navigationController.navigationBar.barTintColor = [UIColor randomColor];
    //self.view.backgroundColor = [UIColor randomColor];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Next" style:UIBarButtonItemStylePlain target:self action:@selector(didTapNextButton)];
    
    //    self.jt_fullScreenPopGestureEnabled = NO; //关闭当前控制器的全屏返回手势
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleDefault;
}

- (void)didTapNextButton {
//    AGChartViewController *viewController = [[AGChartViewController alloc] init];
//    viewController.hidesBottomBarWhenPushed = YES;
//    [self.navigationController pushViewController:viewController animated:YES];
}

@end
