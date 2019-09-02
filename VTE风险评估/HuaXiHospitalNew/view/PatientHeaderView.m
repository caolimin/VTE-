//
//  PatientHeaderView.m
//  HuaXiHospitalNew
//
//  Created by admin on 2019/3/16.
//  Copyright © 2019年 caolimin. All rights reserved.
//

#import "PatientHeaderView.h"

@implementation PatientHeaderView

-(NSMutableArray *)labelArr
{
    if (!_labelArr) {
        _labelArr = [[NSMutableArray alloc] init];
    }
    return _labelArr;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //人数
        CGFloat numLabelX = 30;
        CGFloat numLabelY = 40;
        CGFloat numLabelW = 80;
        CGFloat numLabelH = 30;
        UILabel * numLabel = [[UILabel alloc] initWithFrame:CGRectMake(numLabelX, numLabelY, numLabelW, numLabelH)];
        numLabel.text = @"全部3人";
        numLabel.textColor = [UIColor lightGrayColor];
        self.numLabel = numLabel;
        [self addSubview:numLabel];
        
        //搜索textfield
        CGFloat searchFieldY = numLabelY;
        CGFloat searchFieldW = 150;
        CGFloat searchFieldH = 30;
        
        //搜索和高级搜索按钮的宽高
        CGFloat searchBtnH = 30;
        CGFloat searchBtnW = 80;
        CGFloat marginX = 20;

        //搜索textfield
        UITextField * searchField = [[UITextField alloc] init];
        self.searchField = searchField;
        searchField.frame = CGRectMake(WIDTH - searchFieldW - searchBtnW * 2 - marginX * 3, searchFieldY, searchFieldW, searchFieldH);
        searchField.backgroundColor = [UIColor colorWithHEX:0xe4e4e4];
        [self addSubview:searchField];
        
        //搜索btn
        CGRect searchFrame = CGRectMake(CGRectGetMaxX(searchField.frame) + marginX, searchFieldY, searchBtnW, searchBtnH);
        UIButton * searchBtn = [UIButton buttonWithFrame:searchFrame BackgroundColor:[UIColor lightPurpleColor] Tittle:@"搜索" TittleColor:[UIColor whiteColor] target:self action:@selector(searchBtnClick:)];
        searchBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        [self addSubview:searchBtn];
        
        //高级
        //搜索btn
        CGRect seniorBtnFrame = CGRectMake(CGRectGetMaxX(searchBtn.frame) + marginX, searchFieldY, searchBtnW, searchBtnH);
        UIButton * seniorBtn = [UIButton buttonWithFrame:seniorBtnFrame BackgroundColor:[UIColor lightGreenColor] Tittle:@"高级" TittleColor:[UIColor whiteColor] target:self action:@selector(seniorBtnClick:)];
        seniorBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        [self addSubview:seniorBtn];
        
        UIView * lineView = [[UIView alloc] init];
        lineView.backgroundColor = [UIColor lightGrayColor];
        lineView.frame = CGRectMake(0, CGRectGetMaxY(numLabel.frame)+ 10, WIDTH, 1);
        [self addSubview:lineView];
        //CGFloat labelW = 30;
        CGFloat labelH = 40;
        // CGFloat marginX = (WIDTH - 8*labelW)/9;
        CGFloat labelMarginX = 10;
        CGFloat labelMarginY = 20;
        CGFloat labelW  = (WIDTH - labelMarginX * 9)/8;
        labelW = floor(labelW);
        CGFloat labelY = CGRectGetMaxY(numLabel.frame) + labelMarginY;
        [self.labelArr removeAllObjects];
        NSArray * tittleArr = @[@"姓名",@"性别",@"年龄",@"科室",@"主管医生",@"主管护士",@"病历号",@"评估状态"];
        for (int i = 0; i<8; i++) {
            UILabel * label = [[UILabel alloc] init];
            //label.backgroundColor  = [UIColor lightGrayColor];
            label.frame = CGRectMake(labelMarginX + (labelW + labelMarginX) * i, labelY, labelW, labelH);
            label.text = tittleArr[i];
            label.textAlignment = NSTextAlignmentCenter;
            [self addSubview:label];
            [self.labelArr addObject:label];
        }
        
    }
    return self;
}

-(void)searchBtnClick:(UIButton *)btn
{
    if (self.searchBtnClick) {
        self.searchBtnClick();
    }
}

-(void)seniorBtnClick:(UIButton *)btn
{
    if (self.seniorBtnClick) {
        self.seniorBtnClick();
    }
}



@end
