//
//  SecondViewController.m
//  HuaXiHospitalNew
//
//  Created by admin on 2019/3/11.
//  Copyright © 2019年 caolimin. All rights reserved.
//

#import "SecondViewController.h"
#import "PatientTableViewController.h"
#import "MCAlertView.h"

@interface SecondViewController ()
@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"静脉血栓(VTE)风险管理";
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)evaluationAskBtnClick:(UIButton *)sender {
    PatientTableViewController * controller = [[PatientTableViewController alloc] init];
    controller.ASSESS_FLAG = @"0";
    [self.navigationController pushViewController:controller animated:NO];
}
- (IBAction)presentationLookBtnClick:(UIButton *)sender {
    PatientTableViewController * controller = [[PatientTableViewController alloc] init];
    controller.ASSESS_FLAG = @"1";
    [self.navigationController pushViewController:controller animated:NO];
}
- (IBAction)statisticsBtnClick:(UIButton *)sender {
    [MCAlertView alert:@"暂未开通该服务"];
//    PatientTableViewController * controller = [[PatientTableViewController alloc] init];
//    [self.navigationController pushViewController:controller animated:NO];
}

@end
