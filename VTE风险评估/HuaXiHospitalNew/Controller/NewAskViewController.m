//
//  NewAskViewController.m
//  HuaXiHospitalNew
//
//  Created by admin on 2019/3/17.
//  Copyright © 2019年 caolimin. All rights reserved.
//

#import "NewAskViewController.h"
#import "NewAskView.h"
#import "askViewModel.h"
#import "MCAlertView.h"
#import "SavePatientRequest.h"

@interface NewAskViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) NSMutableArray * dataArray;
@property(nonatomic,strong) NewAskView * contentView;
@end

@implementation NewAskViewController
-(NSArray *)selectArray
{
    if (!_selectArray) {
        _selectArray = [[NSArray alloc] init];
    }
    return _selectArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"静脉血栓(VTE)风险个人评估报告";
    [self loadData];
    [self setupUI];
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
-(void)setupUI
{
    CGFloat viewH = 550;
    if (self.selectArray.count > 6) {
        viewH += 300;
    }else
    {
        viewH = viewH + self.selectArray.count * 50;
    }
    NewAskView * view = [[NewAskView alloc] initWithFrame:CGRectMake(0, 100, WIDTH, viewH)];
    view.factoryArr = self.selectArray;
    self.contentView = view;
    view.tableView.delegate = self;
    view.tableView.dataSource = self;
    view.tableView.tableFooterView = [[UIView alloc] init];
    [view.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellID"];
    [view setRemakeBtnClick:^{
        NSString *string = @"现在重新进行评估";
        [[MCAlertView alert:string withCancel:@"否" submit:@"是"] setClickButtonBlock:^(MCAlertView *alert, NSInteger idx){
            if (idx) {
                    [self.navigationController popViewControllerAnimated:NO];
                }
            }];
    }];
    [view setSaveBtnClick:^{
        NSString *string = @"现在提交并保存";
        [[MCAlertView alert:string withCancel:@"否" submit:@"是"] setClickButtonBlock:^(MCAlertView *alert, NSInteger idx){
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
    }];
    view.scoreLabel.text = [NSString stringWithFormat:@"评估总分：%@分",self.scoreString];
    int x = [self.scoreString intValue];
    askViewModel * model = [[askViewModel alloc] init];
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
    view.riskGradeContentLabel.text= [NSString stringWithFormat:@"   %@",model.risk];
    view.DVTLabelContentLabel.text = [NSString stringWithFormat:@"   %@",model.probability];
    view.solutionContentLabel.text = [NSString stringWithFormat:@"   %@",model.solution];
    [self.view addSubview:view];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.selectArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //1.创建cell
    static NSString * ID = @"cellID";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    //2.设置cell数据
    cell.textLabel.text = self.selectArray[indexPath.row];
    cell.textLabel.font = [UIFont systemFontOfSize:20];
    cell.textLabel.numberOfLines = 0;
    cell.textLabel.textColor = [UIColor grayColor];
    cell.contentView.backgroundColor = [UIColor contentLightColor];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}
@end
