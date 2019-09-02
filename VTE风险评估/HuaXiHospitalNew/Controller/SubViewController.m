//
//  SubViewController.m
//  HuaXiHospitalNew
//
//  Created by admin on 2019/3/11.
//  Copyright © 2019年 caolimin. All rights reserved.
//

#import "SubViewController.h"

@interface SubViewController ()

@end

@implementation SubViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIFont *font = [UIFont systemFontOfSize:20];
    NSDictionary *dict = [NSDictionary dictionaryWithObject:font forKey:NSFontAttributeName];
    self.navigationController.navigationBar.titleTextAttributes = dict;
}


@end
