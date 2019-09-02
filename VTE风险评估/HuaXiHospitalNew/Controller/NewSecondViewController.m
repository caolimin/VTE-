//
//  NewSecondViewController.m
//  HuaXiHospitalNew
//
//  Created by admin on 2019/3/16.
//  Copyright © 2019年 caolimin. All rights reserved.
//

#import "NewSecondViewController.h"
#import "NewPatientTableViewController.h"

#import "PatientTableViewController.h"
#import "MCAlertView.h"
@interface NewSecondViewController ()

@end

@implementation NewSecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"静脉血栓(VTE)风险管理";
    [self setupUI];
}

-(void)setupUI
{
    self.view.backgroundColor = [UIColor contentLightColor];
    CGFloat contViewH = 500;
    CGFloat contViewW = 500;
    UIView * contView = [[UIView alloc] init];
    //contView.alpha = 0.5;
    contView.frame = CGRectMake(0, 0, contViewW, contViewH);
    contView.center = self.view.center;
    contView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:contView];
    
    CGFloat Btn1W = 400;
    CGFloat Btn1H = 60;
    CGFloat Btn1Y = 150;
    CGFloat margin = 30;
//    UIButton * Btn1 = [[UIButton alloc] init];
//    [Btn1 setBackgroundColor:[UIColor navigationBarColor]];
//    [Btn1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    Btn1.titleLabel.font = [UIFont systemFontOfSize:20];
//    [Btn1 setTitle:@"评估问卷" forState:UIControlStateNormal];
//    Btn1.frame = CGRectMake((contViewW - Btn1W)/2, Btn1Y, Btn1W, Btn1H);
//    [Btn1 addTarget:self action:@selector(Btn1Click:) forControlEvents:UIControlEventTouchUpInside];
    
    CGRect btn1Frame = CGRectMake((contViewW - Btn1W)/2, Btn1Y, Btn1W, Btn1H);
    UIButton * btn1 = [UIButton buttonWithFrame:btn1Frame BackgroundColor:[UIColor lightGreenColor] Tittle:@"评估问卷" TittleColor:[UIColor whiteColor] target:self action:@selector(Btn1Click:)];
    [contView addSubview:btn1];
    
    CGRect btn2Frame = CGRectMake(CGRectGetMinX(btn1.frame), CGRectGetMaxY(btn1.frame) +margin
                                  , Btn1W, Btn1H);
    UIButton * btn2 = [UIButton buttonWithFrame:btn2Frame BackgroundColor:[UIColor lightGreenColor] Tittle:@"报告查看" TittleColor:[UIColor whiteColor] target:self action:@selector(btn2Click:)];
    [contView addSubview:btn2];
    
    CGRect btn3Frame = CGRectMake(CGRectGetMinX(btn2.frame), CGRectGetMaxY(btn2.frame) +margin
                                  , Btn1W, Btn1H);
    UIButton * btn3 = [UIButton buttonWithFrame:btn3Frame BackgroundColor:[UIColor lightGreenColor] Tittle:@"监控管理" TittleColor:[UIColor whiteColor] target:self action:@selector(btn3Click:)];
    [contView addSubview:btn3];
}

-(void)Btn1Click:(UIButton *)btn
{
    NewPatientTableViewController * controller = [[NewPatientTableViewController alloc] init];
    controller.ASSESS_FLAG = @"0";
    [self.navigationController pushViewController:controller animated:NO];
}

-(void)btn2Click:(UIButton *)btn
{
    NewPatientTableViewController * controller = [[NewPatientTableViewController alloc] init];
    controller.ASSESS_FLAG = @"1";
    [self.navigationController pushViewController:controller animated:NO];
}

-(void)btn3Click:(UIButton *)btn
{
    [MCAlertView alert:@"暂未开通该服务"];
}

@end
