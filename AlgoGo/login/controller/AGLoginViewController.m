//
//  AGLoginViewController.m
//  AlgoGo
//
//  Created by JessieYong on 16/9/14.
//  Copyright © 2016年 Axiom. All rights reserved.
//

#import "AGLoginViewController.h"
#import "AGHomeTabBarController.h"

@implementation AGLoginViewController

- (IBAction)clickTest:(id)sender {
    AGHomeTabBarController *tabbarController =[[AGHomeTabBarController alloc] init];
    [self showViewController:tabbarController sender:sender];
}

@end
