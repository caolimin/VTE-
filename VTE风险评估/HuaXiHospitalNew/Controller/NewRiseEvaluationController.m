//
//  NewRiseEvaluationController.m
//  HuaXiHospitalNew
//
//  Created by admin on 2019/3/11.
//  Copyright © 2019年 caolimin. All rights reserved.
//

#import "NewRiseEvaluationController.h"
#import "QuestionCollectionViewCell.h"
#import "XibCustomReusableView.h"
#import "AskPatientRequest.h"
#import "NewAskViewController.h"

#define viewH  80

@interface NewRiseEvaluationController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@property(nonatomic,strong)  UICollectionView* collectionView;
@property(nonatomic,strong) NSArray * titleArray;
@property(nonatomic,strong) NSMutableArray * dataArray;
@property(nonatomic,assign) int totalScore;
@property(nonatomic,strong) UILabel * totalScoreLabel;
@property(nonatomic,strong) NSMutableArray * disaserArr;
@property(nonatomic,strong) NSMutableArray * selectArray;//选中需要传给后台的数组
@property(nonatomic,strong) NSMutableArray  * containArr; // 防重复加分标志
@end

@implementation NewRiseEvaluationController

-(NSArray *)titleArray
{
    if (!_titleArray) {
        _titleArray = [[NSArray alloc] init];
    }
    return _titleArray;
}

-(NSMutableArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = [[NSMutableArray alloc] init];
    }
    return _dataArray;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"风险评估";
    self.disaserArr = [[NSMutableArray alloc] init];//进来查询用户已经有的风险因素的 数组
    self.selectArray = [[NSMutableArray alloc] init];
    self.containArr = [[NSMutableArray alloc] init];
    self.totalScore = 0;
    [self setupCollectionView];
    [self loadData];
    [self setFootView];
}

-(void)setFootView
{
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, HEIGHT - viewH, WIDTH, viewH)];
    view.backgroundColor = [UIColor contentLightColor];
    CGFloat titleLabelH = 40;
    CGFloat titleLabelW = 200;
    CGFloat btnW = 200;
    CGFloat titleLabelX = (WIDTH - 2*titleLabelW)/3;
    UILabel * titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(titleLabelX, 10, titleLabelW, titleLabelH)];
    self.totalScoreLabel = titleLabel;
    titleLabel.layer.backgroundColor = [UIColor lightGreenColor].CGColor;
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.layer.cornerRadius = 7;
    titleLabel.font = [UIFont systemFontOfSize:20];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.text = [NSString stringWithFormat:@"风险因素总分：%d",self.totalScore];
    [view addSubview:titleLabel];
    
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(CGRectGetMaxX(titleLabel.frame) + titleLabelX, 10, btnW, 40);
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [btn setTitle:@"查看评估结果" forState:UIControlStateNormal];
    [btn setBackgroundColor:[UIColor lightPurpleColor]];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btn .layer.cornerRadius = 7;
    [view addSubview:btn];
    
    [self.view addSubview:view];
}

-(void)loadData
{
    self.titleArray = @[@"以下每项风险因素记1分",@"以下每项风险因素记2分",@"以下每项风险因素记3分",@"以下每项风险因素记5分"];
    NSArray * firstDataArray = @[@"年龄为41-60岁",@"下肢水肿（现患）",@"静脉曲张",@"肥胖（BMI>=25）",@"计划小手术",@"严重肺部疾病、含肺炎（<1月）",@"服避孕药或雌激素替代治疗",@"妊娠期或产后",@"急性心肌梗塞",@"充血性心力衰竭(<1个月)",@"卧床内科患者",@"炎症性肠病史",@"大手术史（<1月）",@"肺功能异常（COPO）",@"不明原因死产，习惯性流产（>=3次），早产伴有新生儿二毒血症或发育受限"];
    NSMutableArray * firstArr = [[NSMutableArray alloc] init];
    for (NSString * str in firstDataArray) {
        NSMutableDictionary * dic = [[NSMutableDictionary alloc] init];
        [dic setValue:@"NO" forKey:@"state"];
        [dic setValue:str forKey:@"str"];
        [firstArr addObject:dic];
    }
    NSArray * secondDataArray = @[@"年龄60-64岁",@"中心静脉置管",@"关节镜手术",@"大手术（45分）",@"恶性肿瘤（既往或现患）",@"腹腔镜手术数（>45分）",@"患者需要卧床（>72小时）",@"石膏固定（<1个月）"];
    NSMutableArray * secondArr = [[NSMutableArray alloc] init];
    for (NSString * str in secondDataArray) {
        NSMutableDictionary * dic = [[NSMutableDictionary alloc] init];
        [dic setValue:@"NO" forKey:@"state"];
        [dic setValue:str forKey:@"str"];
        [secondArr addObject:dic];
    }
    NSArray * thirdDataArray = @[@"年龄>=75岁",@"血栓家庭病史",@"DVT/PE患者史",@"凝血酶原20120A阳性",@"因子VLeiden阳性",@"抗性磷脂抗体升高",@"其他先天或后天血栓形成",@"狼疮抗凝物阳性",@"血清同型半胱氨酸升高",@"肝素引起的血小板减少（HIT）（不可使用肝素或者任何低分子肝素）"];
    NSMutableArray * thirdArr = [[NSMutableArray alloc] init];
    for (NSString * str in thirdDataArray) {
        NSMutableDictionary * dic = [[NSMutableDictionary alloc] init];
        [dic setValue:@"NO" forKey:@"state"];
        [dic setValue:str forKey:@"str"];
        [thirdArr addObject:dic];
    }
    NSArray * fourthDataArray = @[@"脑卒中（<1个月）",@"多发性创伤（<1个月）",@"选择性下肢关节置换术",@"髋关节、骨盆或下肢骨折",@"畸形骨髓损伤（瘫痪）（<1个月）"];
    NSMutableArray * fourthArr = [[NSMutableArray alloc] init];
    for (NSString * str in fourthDataArray) {
        NSMutableDictionary * dic = [[NSMutableDictionary alloc] init];
        [dic setValue:@"NO" forKey:@"state"];
        [dic setValue:str forKey:@"str"];
        [fourthArr addObject:dic];
    }
    [self.dataArray addObject:firstArr];
    [self.dataArray addObject:secondArr];
    [self.dataArray addObject:thirdArr];
    [self.dataArray addObject:fourthArr];
    //获得年龄选中
    [self getAgeSelect:self.model.PATIENT_AGE];
    [self getSelectIndexWithFirstArray:firstDataArray secondArray:secondDataArray  thirdArr:thirdDataArray forthArr:fourthDataArray];
}

-(void)getAgeSelect:(NSString *)ageStr
{
    NSInteger age = [ageStr integerValue];
    if (40<age && age <= 60) {
        NSMutableArray * brr = self.dataArray[0];
        NSMutableDictionary * dic = brr[0];
        [dic setObject:@"YES" forKey:@"state"];
        [brr replaceObjectAtIndex:0 withObject:dic];
        [self.dataArray replaceObjectAtIndex:0 withObject:brr];
        
    }else if (age>60 && age<64)
    {
        NSMutableArray * brr = self.dataArray[1];
        NSMutableDictionary * dic = brr[0];
        [dic setObject:@"YES" forKey:@"state"];
        [brr replaceObjectAtIndex:0 withObject:dic];
        [self.dataArray replaceObjectAtIndex:0 withObject:brr];
        
    }else if (age>= 75)
    {
        NSMutableArray * brr = self.dataArray[2];
        NSMutableDictionary * dic = brr[0];
        [dic setObject:@"YES" forKey:@"state"];
        [brr replaceObjectAtIndex:0 withObject:dic];
        [self.dataArray replaceObjectAtIndex:0 withObject:brr];
    }
}

-(void)getSelectIndexWithFirstArray:(NSArray *)firstArr secondArray:(NSArray *)secondArr thirdArr:(NSArray *)thirdArr forthArr:(NSArray *)fourthArr
{
    AskPatientRequest * request = [[AskPatientRequest alloc] init];
    request.Type = @"queryVTE_Patient_Factor";
    request.PATIENT_ID = self.model.PATIENT_ID;
    [request loadDataSuccess:^(id  _Nonnull responseObject) {
        self.disaserArr = responseObject;
        for (PatientModel * model in self.disaserArr) {
            [self.dataArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx1, BOOL * _Nonnull stop) {
               NSMutableArray * brr = self.dataArray[idx1];
                [brr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                    NSString * str = brr[idx][@"str"];
                    if ([str isEqualToString:model.FACTOR]) {
                        [brr replaceObjectAtIndex:idx withObject:@{@"str":str,@"state":@"YES"}];
                        [self.dataArray replaceObjectAtIndex:idx1 withObject:brr];
                    }
                }];
            }];
        }
        [self.collectionView reloadData];
    } failure:^(id  _Nonnull error) {
        
    }];
    
}

-(void)setupCollectionView
{
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
       flowLayout.itemSize = CGSizeMake((self.view.bounds.size.width-50*3)/2, 100);
    //
    //        flowLayout.minimumInteritemSpacing = 10;
    //
    //        flowLayout.minimumLineSpacing = 20;
    //
    //        flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    UICollectionView *collView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
    collView.delegate = self;
    collView.dataSource = self;
    self.collectionView = collView;
    self.collectionView.backgroundColor = [UIColor whiteColor];
    [collView registerNib:[UINib nibWithNibName:@"QuestionCollectionViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:@"QuestionCollectionViewCell"];
    // Xib
    // 头标
    [collView registerNib:[UINib nibWithNibName:@"XibCustomReusableView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"viewId"];
    // 尾标
    [collView registerNib:[UINib nibWithNibName:@"XibCustomReusableView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"viewId"];
    [self.view addSubview:collView];
    self.collectionView.contentInset = UIEdgeInsetsMake(0, 0, viewH, 0);
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 4;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    NSArray * arr = self.dataArray[section];
    return arr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * identifier = [NSString stringWithFormat:@"%ld%ld",(long)indexPath.section,(long)indexPath.row];
    [collectionView registerNib:[UINib nibWithNibName:@"QuestionCollectionViewCell" bundle:[NSBundle mainBundle]] forCellWithReuseIdentifier:identifier];
    QuestionCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    if (indexPath.row == 0) {
        cell.userInteractionEnabled = NO;
    }
    NSArray * arr = [NSArray arrayWithArray:self.dataArray[indexPath.section]];
    NSDictionary * dic = arr[indexPath.row];
    [cell.questionSelectBtn setTitle:[NSString stringWithFormat:@"  %@",dic[@"str"]] forState:UIControlStateNormal];
    int score = indexPath.section == 0 ? 1 : indexPath.section == 1? 2 : indexPath.section == 2 ? 3 : 5;
    
    //判断进来时候是否已经选中
    if ([dic[@"state"] isEqualToString:@"YES"] ) {
        [self getCellStateWithCell:cell withScore:score withFlag:YES withContent:dic[@"str"]];
    }
    // UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    // cell.contentView.backgroundColor = [UIColor greenColor];
    [cell setQuestionBtnClickBlock:^(QuestionCollectionViewCell * cell) {
        //     if (indexPath.row == 0) return ;
        [self getCellStateWithCell:cell withScore:score withContent1:dic[@"str"]];
    }];
    
    return cell;
}

// 设置分组的头标和脚标
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    // 系统的
    static NSString * viewId = @"viewId";
    // Xib
    XibCustomReusableView * view = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:viewId forIndexPath:indexPath];
    view.titleLabel.textColor = [UIColor blackColor];
    view.titleLabel.font = [UIFont systemFontOfSize:20];
    view.titleLabel.text = self.titleArray[indexPath.section];
    view.backgroundColor = [UIColor contentLightColor];
    return view;
}


-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    
    return CGSizeMake(self.view.frame.size.width, 50);
}

// 设置每个视图与其他视图的间距
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    // 上左下右
    return UIEdgeInsetsMake(30, 30, 30, 30);
}

// 设置每个item的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    // 默认大小 50 * 50
    
    return CGSizeMake((WIDTH-50*3)/2, 50);
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
}


//cell选中和打分
-(void)getCellStateWithCell:(QuestionCollectionViewCell *)cell withScore:(int)score withContent1:content
{
    cell.questionSelectBtn.selected = !cell.questionSelectBtn.selected;
    if (cell.questionSelectBtn.selected) {
        [cell.questionSelectBtn setImage:[UIImage imageNamed:@"box2.png"] forState:UIControlStateSelected];
    }else
    {
        [cell.questionSelectBtn setImage:[UIImage imageNamed:@"box.png"] forState:UIControlStateNormal];
    }
    NSString * str = cell.questionSelectBtn.titleLabel.text;
    if (cell.questionSelectBtn.selected) {
        self.totalScore+=score;
        [self.selectArray addObject:content];
    }else
    {
        self.totalScore-=score;
        [self.selectArray removeObject:content];
    }
    self.totalScoreLabel.text = [NSString stringWithFormat:@"风险因素总分：%d",self.totalScore];
}

-(void)getCellStateWithCell:(QuestionCollectionViewCell *)cell withScore:(int)score withFlag:(BOOL)falg withContent:(NSString *)content
{
    cell.questionSelectBtn.selected = YES;
    if (cell.questionSelectBtn.selected) {
        [cell.questionSelectBtn setImage:[UIImage imageNamed:@"box2.png"] forState:UIControlStateSelected];
    }else
    {
        [cell.questionSelectBtn setImage:[UIImage imageNamed:@"box.png"] forState:UIControlStateNormal];
    }
    if (![self.containArr containsObject:content]) {
        NSString * str = cell.questionSelectBtn.titleLabel.text;
        if (cell.questionSelectBtn.selected) {
            self.totalScore+=score;
            [self.selectArray addObject:content];
        }else
        {
            self.totalScore-=score;
            [self.selectArray removeObject:content];
        }
        [self.containArr addObject:content];
        
    }
    self.totalScoreLabel.text = [NSString stringWithFormat:@"风险因素总分：%d",self.totalScore];
}

#pragma mark-----点击事件
-(void)btnClick:(UIButton *)btn
{
    NewAskViewController * controller = [[NewAskViewController alloc] init];
    controller.scoreString = [NSString stringWithFormat:@"%d",self.totalScore];
    controller.model = self.model;
    controller.selectArray = self.selectArray;
    [self.navigationController pushViewController:controller animated:NO];
    
    //    NSString * str = [[NSString alloc] init];
    //    for (NSString * subStr in self.selectArray) {
    //        NSString * string = [NSString stringWithFormat:@"%@\n",subStr];
    //        str = [str stringByAppendingString:string];
    //    }
    //    AskViewController * controller = [[AskViewController alloc] init];
    //    controller.scoreString = [NSString stringWithFormat:@"%d",self.totalScore];
    //    controller.factorStr = str;
    //    controller.model = self.model;
    //    controller.selectArray = self.selectArray;
    //    [self.navigationController pushViewController:controller animated:NO];
}
@end
