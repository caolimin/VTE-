//
//  NewPatientTableViewController.m
//  HuaXiHospitalNew
//
//  Created by admin on 2019/3/16.
//  Copyright © 2019年 caolimin. All rights reserved.
//

#import "NewPatientTableViewController.h"
#import "NewPatientCellTableViewCell.h"
#import "PatientHeaderView.h"
#import "PatientSearchRequest.h"
#import "PatientModel.h"
#import "NewRiseEvaluationController.h"
#import "riskResultController.h"
#import "NewPatient_seniorSearchView.h"
#import "ZHPickView.h"
#import "MCAlertView.h"
#define NewPatientCellTableViewCellID @"NewPatientCellTableViewCell"
#define hearderViewH 130
#define seniorBtnH  420
#define seniorBtnX  240
#define seniorBtnY  80
#define seniorBtnW WIDTH - 2*seniorBtnX
@interface NewPatientTableViewController ()<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate,ZHPickViewDelegate>
@property(nonatomic,strong) UITableView * tableView;
@property(nonatomic,strong) NSMutableArray * dataArray;
@property(nonatomic,strong) NSMutableArray * gloabalArray;
@property(nonatomic,strong) NSString * PATIENT_ID;
@property(nonatomic,strong) NSString * PATIENT_NAME;
@property(nonatomic,strong) PatientHeaderView * headerView;
@property(nonatomic,strong) NewPatient_seniorSearchView * seniorBtn;
@property(nonatomic,strong) NSString * SEARCH;
@property(nonatomic,strong) NSString * STPATIENT_AGE;
@property(nonatomic,strong) NSString * ETPATIENT_AGE;
@property(nonatomic,strong) NSString * IN_OFFICE;
@property(nonatomic,strong) NSString * PATIENT_SEX;
@property(nonatomic,strong) NSString * DOCTOR_NAME;
@property(nonatomic,strong) NSString * NURSE_NAME;
@property(nonatomic,strong)ZHPickView *pickview;
@property(nonatomic,strong)NSIndexPath *indexPath;
@property (nonatomic,assign) NSInteger tag;
@property (nonatomic, strong) UIView * bgView;
@property (nonatomic,assign) BOOL patientIDFlag; //用于记录键盘弹起时高级搜索框是否上移

@end

@implementation NewPatientTableViewController

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self loadDataWithASSESS_FLAG:self.ASSESS_FLAG PATIENT_NAME:@"" PATIENT_ID:@"" SEARCH:@"" STPATIENT_AGE:@"" ETPATIENT_AGE:@"" IN_OFFICE:@"" PATIENT_SEX:@"" DOCTOR_NAME:@"" NURSE_NAME:@""];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"静脉血栓(VTE)风险评估患者列表";
    [self setUpData];
    [self setupTableView];
    [self setupHeaderView];
    [self setupSeniorBtnUI];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillChangeFrame:) name:UIKeyboardWillChangeFrameNotification object:nil];
}

-(void)setUpData
{
    self.dataArray = [[NSMutableArray alloc] init];
    self.gloabalArray = [[NSMutableArray alloc] init];
    self.PATIENT_NAME = @"";
    self.PATIENT_ID = @"";
    self.SEARCH = @"";
    self.STPATIENT_AGE = @"";
    self.ETPATIENT_AGE = @"";
    self.IN_OFFICE = @"";
    self.PATIENT_SEX = @"";
    self.DOCTOR_NAME = @"";
    self.NURSE_NAME = @"";
    self.patientIDFlag = NO;
}

-(void)setupSeniorBtnUI
{
    //高级搜索view
    NewPatient_seniorSearchView * seniorBtn = [[NewPatient_seniorSearchView alloc] initWithFrame:CGRectMake(seniorBtnX, seniorBtnY, seniorBtnW, seniorBtnH)];
    [seniorBtn.searchBtn addTarget:self action:@selector(seniorBtnViewSubBtn) forControlEvents:UIControlEventTouchUpInside];
    self.seniorBtn = seniorBtn;
    seniorBtn.dataArr = self.gloabalArray;
    [seniorBtn setRemovePickViewBlock:^{
        if (self.pickview) {
            [self.pickview remove];
        }
    }];
    [seniorBtn setPatientIDFlagBlock:^{
        self.patientIDFlag = YES;
    }];
    [seniorBtn setTextfieldBackWithText:^(NSString * _Nonnull str, NSInteger tag) {
        if (tag == 100) {
            self.PATIENT_NAME = str;
        }else if (tag == 106)
        {
            self.PATIENT_ID = str;
        }
    }];
    [seniorBtn setSeniorTextfieldBlock:^(NSMutableArray * _Nonnull arr, NewPatient_seniorSearchView * seniorBtnView,NSInteger tag) {
        self.tag = tag;
        [self.pickview remove];
        self.pickview=[[ZHPickView alloc] initPickviewWithArray:arr isHaveNavControler:NO];
        self.pickview.delegate=self;
        [self.pickview show];
    }];
    [self setSeniorBtnHidden:YES];
    [self.view addSubview:seniorBtn];
}

-(void)setSeniorBtnHidden:(BOOL)isHidden
{
    self.seniorBtn.hidden = isHidden;
    if (isHidden == YES && self.pickview) {
        [self.pickview removeFromSuperview];
    }
    if (isHidden == YES && self.bgView) {
        [self.bgView removeFromSuperview];
    }
    if (isHidden == YES) [self.view endEditing:YES];
}

-(void)setupHeaderView
{
    //界面表头
    CGRect headerViewFrame = CGRectMake(0, 34, WIDTH, hearderViewH);
    PatientHeaderView * hearderView = [[PatientHeaderView alloc] initWithFrame:headerViewFrame];
    self.headerView = hearderView;
    hearderView.searchField.delegate = self;
    hearderView.backgroundColor = [UIColor whiteColor];
    [hearderView setSearchBtnClick:^{
        [self.view endEditing:YES];
        [self loadDataWithASSESS_FLAG:self.ASSESS_FLAG PATIENT_NAME:self.PATIENT_NAME PATIENT_ID:@"" SEARCH:self.SEARCH STPATIENT_AGE:@"" ETPATIENT_AGE:@"" IN_OFFICE:@"" PATIENT_SEX:@"" DOCTOR_NAME:@"" NURSE_NAME:@""];
    }];
    //高级搜素按钮点击
    [hearderView setSeniorBtnClick:^{
        if (self.gloabalArray.count == 0) {
            [MCAlertView alert:@"暂无患者数据提供高级搜索"];
            return ;
        }
        UIView* bgView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT)];
        bgView.backgroundColor=[UIColor darkGrayColor];
        bgView.alpha=0.5;
        bgView.userInteractionEnabled = YES;
        UITapGestureRecognizer * gecongizeer = [[UITapGestureRecognizer alloc] init];
        [gecongizeer addTarget:self action:@selector(gecongizeerTap)];
        [bgView addGestureRecognizer:gecongizeer];
        [self.view addSubview:bgView];
        self.bgView=bgView;
        [self.view bringSubviewToFront:self.seniorBtn];
        self.seniorBtn.hidden = NO;
    }];
    [self.view addSubview:hearderView];
}

-(void)setupTableView
{
    UITableView * tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    self.tableView = tableView;
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    [self.tableView registerClass:[NewPatientCellTableViewCell class] forCellReuseIdentifier:NewPatientCellTableViewCellID];
    self.tableView.tableFooterView = [[UIView alloc] init];
    tableView.showsVerticalScrollIndicator = NO;
    self.tableView.contentInset = UIEdgeInsetsMake(hearderViewH - 60, 0, 0, 0);
}


-(void)loadDataWithASSESS_FLAG:(NSString *)ASSESS_FLAG PATIENT_NAME:(NSString *)PATIENT_NAME PATIENT_ID:(NSString *)PATIENT_ID SEARCH:(NSString *)SEARCH STPATIENT_AGE:(NSString *)STPATIENT_AGE ETPATIENT_AGE:(NSString *)ETPATIENT_AGE IN_OFFICE:(NSString *)IN_OFFICE PATIENT_SEX:(NSString *)PATIENT_SEX DOCTOR_NAME:(NSString *)DOCTOR_NAME NURSE_NAME:(NSString *)NURSE_NAME
{
    
    PatientSearchRequest * request = [[PatientSearchRequest alloc] init];
    request.Type = @"queryVTE_Patient_Info";
    request.ASSESS_FLAG = ASSESS_FLAG;
    request.PATIENT_NAME = PATIENT_NAME;
    request.PATIENT_ID = PATIENT_ID;
    request.SEARCH = SEARCH;
    request.STPATIENT_AGE = STPATIENT_AGE;
    request.ETPATIENT_AGE = ETPATIENT_AGE;
    request.IN_OFFICE = IN_OFFICE;
    request.PATIENT_SEX = PATIENT_SEX;
    request.DOCTOR_NAME = DOCTOR_NAME;
    request.NURSE_NAME = NURSE_NAME;
    [request loadDataSuccess:^(id  _Nonnull responseObject) {
        self.dataArray = responseObject;
        if (self.gloabalArray.count == 0) {
            self.gloabalArray = responseObject;
        }
        // NSDictionary * info = @{@"count":[NSString stringWithFormat:@"%lu",(unsigned long)self.dataArray.count]};
        // [[NSNotificationCenter defaultCenter] postNotificationName:@"count" object:nil userInfo:info];
        //  self.contentTitleLabel.text = [NSString stringWithFormat:@"未评估人数：%lu",(unsigned long)self.dataArray.count];
        self.seniorBtn.dataArr = self.dataArray;
        self.headerView.numLabel.text = [NSString stringWithFormat:@"全部%lu人",(unsigned long)self.dataArray.count];
        [self.tableView reloadData];
    } failure:^(id  _Nonnull error) {
        
    }];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
        return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    _indexPath = indexPath;
    NewPatientCellTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:NewPatientCellTableViewCellID];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    PatientModel * model = self.dataArray[indexPath.row];
    cell.model = model;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
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

-(void)textFieldDidEndEditing:(UITextField *)textField
{
    self.SEARCH = textField.text;
}
//高级搜索界面中的搜素按钮
-(void)seniorBtnViewSubBtn
{
    [self.seniorBtn reloadTextFieldText];
    [self setSeniorBtnHidden:YES] ;
    [self loadDataWithASSESS_FLAG:self.ASSESS_FLAG PATIENT_NAME:self.PATIENT_NAME PATIENT_ID:self.PATIENT_ID SEARCH:@"" STPATIENT_AGE:self.STPATIENT_AGE ETPATIENT_AGE:self.ETPATIENT_AGE IN_OFFICE:self.IN_OFFICE PATIENT_SEX:self.PATIENT_SEX DOCTOR_NAME:self.DOCTOR_NAME NURSE_NAME:self.NURSE_NAME];
    [self.tableView reloadData];
}

#pragma mark ZhpickVIewDelegate

-(void)toobarDonBtnHaveClick:(ZHPickView *)pickView resultString:(NSString *)resultString{
    UITextField * textfield = [self.view viewWithTag:self.tag];
    textfield.text = resultString;
    if (self.tag == 100) {
        self.PATIENT_NAME = resultString;
    }else if (self.tag == 101)
    {
        self.PATIENT_SEX = resultString;
    }else if (self.tag == 102)
    {
        self.STPATIENT_AGE = resultString;
        self.ETPATIENT_AGE = resultString;
        
    }else if (self.tag == 103)
    {
        self.IN_OFFICE = resultString;
    }else if (self.tag == 104)
    {
        self.DOCTOR_NAME = resultString;
    }else if (self.tag == 105)
    {
        self.NURSE_NAME = resultString;
    }else if (self.tag == 106)
    {
        self.PATIENT_ID = resultString;
    }
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40.0f;
}

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self.view endEditing:YES];
}
- (void)keyboardWillChangeFrame:(NSNotification *)note
{
    if (!self.patientIDFlag)  return;
    // 键盘显示\隐藏完毕的frame
    CGRect frame = [note.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    // 动画时间
    
    CGRect frame1 = self.seniorBtn.frame;
    CGFloat aa = CGRectGetMaxY(frame1);
    CGFloat bb = HEIGHT  - aa;
    CGFloat disY = bb - frame.size.height;
    CGFloat duration = [note.userInfo[UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    // 动画
    [UIView animateWithDuration:duration animations:^{
        if (frame.origin.y == HEIGHT) {
            self.seniorBtn.transform = CGAffineTransformIdentity;
            self.patientIDFlag = NO;
        }else
        {
            self.seniorBtn.transform = CGAffineTransformMakeTranslation(0, disY );
        }
    }];
}

-(void)gecongizeerTap
{
    [self setSeniorBtnHidden:YES];
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
