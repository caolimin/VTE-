//
//  AskViewController.m
//  HuaXiHospitalNew
//
//  Created by admin on 2019/3/12.
//  Copyright © 2019年 caolimin. All rights reserved.
//

#import "AskViewController.h"
#import "askViewModel.h"
#import "SavePatientRequest.h"
#import "MCAlertView.h"

@interface AskViewController ()
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *riskGrade;
@property (weak, nonatomic) IBOutlet UILabel *occurrenceProbabilityLabel;
@property (weak, nonatomic) IBOutlet UILabel *solutionLabel;
@property(nonatomic,strong) NSMutableArray * dataArray;
@property (weak, nonatomic) IBOutlet UILabel *factorContentLabel;
@end

@implementation AskViewController
-(NSArray *)selectArray
{
    if (!_selectArray) {
        _selectArray = [[NSArray alloc] init];
    }
    return _selectArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"评估结果";
    [self loadData];
    self.scoreLabel.text = self.scoreString;
    int x = [self.scoreString intValue];
    askViewModel * model;
    if (0<= x&& x<=1)
    {
        model = self.dataArray[0];
    }else if (x==2)
    {
        model = self.dataArray[1];
    }
    else if (3<=x && x<=4)
    {
        model = self.dataArray[2];
    }
    else if (x>=5)
    {
        model = self.dataArray[3];
    }
    self.riskGrade.text= model.risk;
    self.occurrenceProbabilityLabel.text = model.probability;
    self.solutionLabel.text = model.solution;
    self.factorContentLabel.text = self.factorStr;
}

-(void)loadData
{
    self.dataArray = [[NSMutableArray alloc] init];
    [self.dataArray addObject:[self createModelWithRisk:@"低危" probability:@"<10%" solution:@"早期活动"]];
    [self.dataArray addObject:[self createModelWithRisk:@"中危" probability:@"10-20%" solution:@"早期活动"]];
    [self.dataArray addObject:[self createModelWithRisk:@"高危" probability:@"20-40%" solution:@"早期活动"]];
    [self.dataArray addObject:[self createModelWithRisk:@"极高危" probability:@"DVT发生率40-80%，死亡率1-5%" solution:@"药物预防和物理预防"]];

}

-(askViewModel *)createModelWithRisk:(NSString *)risk probability:(NSString *)probability solution:(NSString *)solution
{
    askViewModel * model = [[askViewModel alloc] init];
    model.risk = risk;
    model.probability = probability;
    model.solution = solution;
    return model;
}
- (IBAction)saveFactor:(UIButton *)sender {
    NSString *string = @"是否确定保存";
    [[MCAlertView alert:string withCancel:@"取消" submit:@"确定"] setClickButtonBlock:^(MCAlertView *alert, NSInteger idx){
        if (idx) {
            //    保存风险选项
            //http://localhost:9090/XiaoYiRobotSer/RobotSer?Type=savePingguBG&ASSESS_SCORE=(评分)&FACTOR=(危险因素，用json打包成数组，按照顺序传过来)&PATIENT_ID=
            SavePatientRequest *request = [[SavePatientRequest alloc] init];
            request.Type = @"savePingguBG";
            request.ASSESS_SCORE = [NSString stringWithFormat:@"%@",self.scoreString];
            // request.ASSESS_SCORE = @"2";
            request.PATIENT_ID = self.model.PATIENT_ID;
            // request.PATIENT_ID = @"M10002";
            request.FACTOR = self.selectArray;
            // request.FACTOR = @[@"年龄为41-46岁",@"下肢水肿(现隐)",@"败血症"];
            [request loadDataSuccess:^(id  _Nonnull responseObject) {
                [MCAlertView alert:@"保存成功"];
                NSInteger index = (NSInteger)[[self.navigationController viewControllers] indexOfObject:self];
                if (index > 2) {
                    [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:(index-2)] animated:YES];
                }else{
                    [self.navigationController popToRootViewControllerAnimated:YES];
                }
                
            } failure:^(id  _Nonnull error) {
                
            }];
        }
        
    }];
  
}
- (IBAction)remakeBtn:(id)sender {
    [self.navigationController popViewControllerAnimated:NO];
}


@end
