//
//  riskResultController.m
//  HuaXiHospitalNew
//
//  Created by admin on 2019/3/12.
//  Copyright © 2019年 caolimin. All rights reserved.
//

#import "riskResultController.h"
#import "riskImageTableViewCell.h"
#import "PatientCellTableViewCell.h"
#import "AskPatientRequest.h"
#import "riskResultSummaryCell.h"
#import "RiskResultFactoryTCell.h"
#import "RiskResultAdviceCell.h"

@interface riskResultController ()
@property(nonatomic,strong) NSMutableArray * dataArray;
@end

@implementation riskResultController

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self loadData];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataArray = [[NSMutableArray alloc] init];
    self.title = @"风险评估报告";
    [self.tableView registerNib:[UINib nibWithNibName:@"PatientCellTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell0"];
    [self.tableView registerNib:[UINib nibWithNibName:@"riskImageTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell2"];
    [self.tableView registerNib:[UINib nibWithNibName:@"riskResultSummaryCell" bundle:nil] forCellReuseIdentifier:@"cell4"];
    [self.tableView registerClass:[RiskResultFactoryTCell class] forCellReuseIdentifier:@"cell5"];
    [self.tableView registerClass:[RiskResultAdviceCell class] forCellReuseIdentifier:@"cell6"];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.tableFooterView = [[UIView alloc] init];
}

-(void)loadData
{
    AskPatientRequest * request = [[AskPatientRequest alloc] init];
    request.Type = @"queryVTE_Patient_Factor";
    request.PATIENT_ID = self.model.PATIENT_ID;
    [request loadDataSuccess:^(id  _Nonnull responseObject) {
        self.dataArray = responseObject;
        [self.tableView reloadData];
    } failure:^(id  _Nonnull error) {

    }];

}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 6;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0) {
        PatientCellTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell0"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.model = self.model;
        return cell;
    }else if (indexPath.row == 1)
    {
        riskResultSummaryCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell4"];
        cell.model = self.model;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
        
    }else if (indexPath.row == 2)
    {
//        RiskResultFactoryTCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell5"];
//        cell.factoryArr = self.dataArray;
//        cell.selectionStyle = UITableViewCellSelectionStyleNone;
//        return cell;
        RiskResultAdviceCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell6"];
        cell.adviceLabel.text = @"风险因素:";
        NSMutableArray * strArr = [[NSMutableArray alloc] init];
        [self.dataArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            PatientModel * model = self.dataArray[idx];
            [strArr addObject: model.FACTOR];
        }];
        NSString * str = [strArr componentsJoinedByString:@"、"];
        cell.adviceContentLabel.text = [NSString stringWithFormat:@"%@",str];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    
    }else if (indexPath.row == 3)
    {
        RiskResultAdviceCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell6"];
        cell.adviceLabel.text = @"预防处置建议:";
        cell.adviceContentLabel.text = [NSString stringWithFormat:@"%@",self.model.DOCTOR_ADVICE];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    else if (indexPath.row == 4)
    {
        RiskResultAdviceCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell6"];
        cell.adviceLabel.text = @"护理处置建议:";
        cell.adviceContentLabel.text = [NSString stringWithFormat:@"%@",self.model.NURSE_ADVICE];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    else if (indexPath.row == 5)
    {
        RiskResultAdviceCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell6"];
        cell.adviceLabel.text = @"注意事项和温馨提示:";
        cell.adviceContentLabel.text = [NSString stringWithFormat:@"%@",self.model.PATIENT_ADVICE];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
    return nil;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return 100;
    }else if (indexPath.row == 1)
    {
        return 430;
    }
//    else if (indexPath.row == 2)
//    {
//        //labelH（40） * label数量 + label数量 *间隔（20）+ 多出来的一个间隔 +  tittlelabel的高度和一个间隔
//         return (self.dataArray.count + 1)/2*(50 + 20) + 20 + 60;
//       // return 250;
//    }
    return 90;
}


@end
