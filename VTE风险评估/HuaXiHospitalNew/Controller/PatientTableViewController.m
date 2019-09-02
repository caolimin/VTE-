//
//  PatientTableViewController.m
//  HuaXiHospitalNew
//
//  Created by admin on 2019/3/11.
//  Copyright © 2019年 caolimin. All rights reserved.
//

#import "PatientTableViewController.h"
#import "InputCustomCell.h"
#import "PatientCellTableViewCell.h"
#import "NewRiseEvaluationController.h"
#import "riskResultController.h"
#import "PatientSearchRequest.h"
#import "PatientModel.h"

@interface PatientTableViewController ()
@property (nonatomic,assign) int cellCount;
@property(nonatomic,strong) NSString * Type;
@property(nonatomic,strong) NSString * PATIENT_ID;
@property(nonatomic,strong) NSString * PATIENT_NAME;
@property(nonatomic,strong) PatientModel * model;
@property(nonatomic,strong) NSMutableArray * dataArray;
@property(nonatomic,strong) UILabel * contentTitleLabel;
@property(nonatomic,strong) NSMutableArray * factoryDataArray;

@end

@implementation PatientTableViewController
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self loadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"静脉血栓(VTE)风险评估患者列表";
    //    title的颜色
  //  self.cellCount = 3;
    self.view.backgroundColor = [UIColor whiteColor];
    self.tableView.tableFooterView = [[UIView alloc] init];
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    [self.tableView registerNib:[UINib nibWithNibName:@"PatientCellTableViewCell" bundle:nil] forCellReuseIdentifier:@"PatientCellTableViewCellID"];
    [self.tableView registerClass:[InputCustomCell class] forCellReuseIdentifier:@"cell"];
    self.dataArray = [[NSMutableArray alloc] init];
}


-(void)loadData
{
    PatientSearchRequest * request = [[PatientSearchRequest alloc] init];
    request.Type = @"queryVTE_Patient_Info";
    request.ASSESS_FLAG = self.ASSESS_FLAG;
    request.PATIENT_NAME = @"";
    request.PATIENT_ID = @"";
    [request loadDataSuccess:^(id  _Nonnull responseObject) {
       self.dataArray = responseObject;
       // NSDictionary * info = @{@"count":[NSString stringWithFormat:@"%lu",(unsigned long)self.dataArray.count]};
       // [[NSNotificationCenter defaultCenter] postNotificationName:@"count" object:nil userInfo:info];
      //  self.contentTitleLabel.text = [NSString stringWithFormat:@"未评估人数：%lu",(unsigned long)self.dataArray.count];
        [self.tableView reloadData];
    } failure:^(id  _Nonnull error) {
        
    }];
}

#pragma mark - Table view data source


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    }else
    {
        return self.dataArray.count;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        InputCustomCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        NSString * str;
         if ([self.ASSESS_FLAG isEqualToString:@"0"]) {
             str = @"当前未评估人数";
         }else
         {
             str = @"当前已评估人数";
         }
        cell.contentTitleLabel.text = [NSString stringWithFormat:@"%@为：%lu",str,(unsigned long)self.dataArray.count];
        [cell setPatient_idClick:^(NSString * patient_id) {
            self.PATIENT_ID = patient_id;
        }];
        [cell setPatient_nameClick:^(NSString * patient_name) {
            self.PATIENT_NAME = patient_name;
        }];
        [cell setSearchBtnClick:^(InputCustomCell * view) {
            [self.view endEditing:YES];
            PatientSearchRequest * request = [[PatientSearchRequest alloc] init];
            request.Type = @"queryVTE_Patient_Info";
            request.ASSESS_FLAG =self.ASSESS_FLAG;
            request.PATIENT_NAME =UnNil(self.PATIENT_NAME) ;
            request.PATIENT_ID = UnNil(self.PATIENT_ID);
            [request loadDataSuccess:^(id  _Nonnull responseObject) {
                self.dataArray = responseObject;
                //  self.contentTitleLabel.text = [NSString stringWithFormat:@"未评估人数：%lu",(unsigned long)self.dataArray.count];
                [self.tableView reloadData];
            } failure:^(id  _Nonnull error) {
                
            }];
            [self.tableView reloadData];
        }];
        return cell;
    }else
    {
        PatientCellTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"PatientCellTableViewCellID"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        PatientModel * model = self.dataArray[indexPath.row];
        cell.model = model;
        return cell;
    }

}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 350;
    }
    return 250;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section == 0) return;
    if ([self.ASSESS_FLAG isEqualToString:@"0"]) {
        NewRiseEvaluationController * controller = [[NewRiseEvaluationController alloc] init];
        controller.model = self.dataArray[indexPath.row];
        [self.navigationController pushViewController:controller animated:NO];
    }else
    {
        riskResultController * controlller = [[riskResultController alloc] init];
        controlller.model = self.dataArray[indexPath.row];
        [self.navigationController pushViewController:controlller animated:NO];
    }
    
}

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self.view endEditing:YES];
}
#pragma mark----点击事件
-(void)btnClick:(UIButton *)btn
{

}
@end
