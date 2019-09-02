
//
//  NewAskView.m
//  HuaXiHospitalNew
//
//  Created by admin on 2019/3/17.
//  Copyright © 2019年 caolimin. All rights reserved.
//

#import "NewAskView.h"

@implementation NewAskView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

-(void)setFactoryArr:(NSArray *)factoryArr
{
    _factoryArr = factoryArr;
    //评估总分
    CGFloat marginY = 20;
    CGFloat marginX = 5;
    CGFloat scoreLabelY = 15;
    CGFloat scoreLabelW = 200;
    CGFloat scoreLabelH = 50;
    CGFloat scoreLabelX = (WIDTH - scoreLabelW)/2;
    UILabel * scoreLabel = [[UILabel alloc] initWithFrame:CGRectMake(scoreLabelX, scoreLabelY, scoreLabelW, scoreLabelH)];
    self.scoreLabel = scoreLabel;
    scoreLabel.font = [UIFont systemFontOfSize:28];
    scoreLabel.textColor = [UIColor blackColor];
    scoreLabel.text = @"评估总分：2分";
    [self addSubview:scoreLabel];
    
    //风险因素
    CGFloat riskFactorLabelY = CGRectGetMaxY(scoreLabel.frame) + marginY*1.5;
    CGFloat riskFactorLabelW = 170;
    CGFloat riskFactorContentLabelW = 200;
    CGFloat riskFactorLabelH = 40;
    CGFloat riskFactorLabelX = 220;
    UILabel * riskFactorLabel = [[UILabel alloc] initWithFrame:CGRectMake(riskFactorLabelX, riskFactorLabelY, riskFactorLabelW, riskFactorLabelH)];
    riskFactorLabel.font = [UIFont systemFontOfSize:20];
    riskFactorLabel.textColor = [UIColor grayColor];
    riskFactorLabel.text = @"风险因素：";
    riskFactorLabel.textAlignment = NSTextAlignmentRight;
    [self addSubview:riskFactorLabel];
    
    //风险因素内容
    CGFloat tableViewY = CGRectGetMinY(riskFactorLabel.frame);
    CGFloat tableViewW = 400;
    
    CGFloat tableViewX = CGRectGetMaxX(riskFactorLabel.frame) + marginX;
    CGFloat tableViewH;
    if (self.factoryArr.count > 6) {
        tableViewH = 300;
    }else
    {
        tableViewH = self.factoryArr.count * 50;
    }
    CGRect tableViewFrame = CGRectMake(tableViewX, tableViewY, tableViewW, tableViewH);
    UITableView * tableView = [[UITableView alloc] initWithFrame:tableViewFrame];
    self.tableView = tableView;
    [self addSubview:tableView];
    
    //风险等级
    CGFloat riskGradeLabelY = CGRectGetMaxY(tableView.frame) + marginY;
    CGFloat riskGradeLabelW = riskFactorLabelW;
    CGFloat riskGradeLabelH = 40;
    CGFloat riskGradeLabelX = CGRectGetMinX(riskFactorLabel.frame);
    UILabel * riskGradeLabel = [[UILabel alloc] initWithFrame:CGRectMake(riskGradeLabelX, riskGradeLabelY, riskGradeLabelW, riskGradeLabelH)];
    riskGradeLabel.font = [UIFont systemFontOfSize:20];
    riskGradeLabel.textColor = [UIColor grayColor];
    riskGradeLabel.text = @"风险等级：";
    riskGradeLabel.textAlignment = NSTextAlignmentRight;
    [self addSubview:riskGradeLabel];
    
    
    CGFloat riskGradeContentLabelY = CGRectGetMinY(riskGradeLabel.frame);
    CGFloat riskGradeContentLabelH = 40;
    CGFloat riskGradeContentLabelW = tableViewW;
    CGFloat riskGradeContentLabelX = CGRectGetMaxX(riskGradeLabel.frame) + marginX;
    UILabel * riskGradeContentLabel = [[UILabel alloc] initWithFrame:CGRectMake(riskGradeContentLabelX, riskGradeContentLabelY, riskGradeContentLabelW, riskGradeContentLabelH)];
    self.riskGradeContentLabel = riskGradeContentLabel;
    riskGradeContentLabel.font = [UIFont systemFontOfSize:20];
    riskGradeContentLabel.textColor = [UIColor grayColor];
    riskGradeContentLabel.backgroundColor = [UIColor contentLightColor];
    riskGradeContentLabel.text = @"中危";
    [self addSubview:riskGradeContentLabel];
    
    //DVT发生率
    CGFloat DVTLabelY = CGRectGetMaxY(riskGradeLabel.frame) + marginY;
    CGFloat DVTLabelW = riskGradeLabelW;
    CGFloat DVTLabelH = 40;
    CGFloat DVTLabelX = CGRectGetMinX(riskGradeLabel.frame);
    UILabel * DVTLabel = [[UILabel alloc] initWithFrame:CGRectMake(DVTLabelX, DVTLabelY, DVTLabelW, DVTLabelH)];
    DVTLabel.font = [UIFont systemFontOfSize:20];
    DVTLabel.textColor = [UIColor grayColor];
    DVTLabel.text = @"DVT发生率：";
    DVTLabel.textAlignment = NSTextAlignmentRight;
    [self addSubview:DVTLabel];
    
    
    CGFloat DVTLabelContentLabelY = CGRectGetMinY(DVTLabel.frame);
    CGFloat DVTLabelContentLabelH = 40;
    CGFloat DVTLabelContentLabelW = riskGradeContentLabelW;
    CGFloat DVTLabelContentLabelX = CGRectGetMaxX(DVTLabel.frame) + marginX;
    UILabel * DVTLabelContentLabel = [[UILabel alloc] initWithFrame:CGRectMake(DVTLabelContentLabelX, DVTLabelContentLabelY, DVTLabelContentLabelW, DVTLabelContentLabelH)];
    self.DVTLabelContentLabel = DVTLabelContentLabel;
    DVTLabelContentLabel.font = [UIFont systemFontOfSize:20];
    DVTLabelContentLabel.textColor = [UIColor grayColor];
    DVTLabelContentLabel.backgroundColor = [UIColor contentLightColor];
    DVTLabelContentLabel.text = @"10-20%";
    [self addSubview:DVTLabelContentLabel];
    //推荐预防方案
    CGFloat solutionLabelY = CGRectGetMaxY(DVTLabel.frame) + marginY;
    CGFloat solutionLabelW = 170;
    CGFloat solutionLabelH = 40;
    CGFloat solutionLabelX = CGRectGetMinX(DVTLabel.frame);
    UILabel * solutionLabel = [[UILabel alloc] initWithFrame:CGRectMake(solutionLabelX, solutionLabelY, solutionLabelW, solutionLabelH)];
    solutionLabel.font = [UIFont systemFontOfSize:20];
    solutionLabel.textColor = [UIColor grayColor];
    solutionLabel.text = @"推荐预防方案：";
    solutionLabel.textAlignment = NSTextAlignmentRight;
    [self addSubview:solutionLabel];
    
    
    CGFloat solutionContentLabelY = CGRectGetMinY(solutionLabel.frame);
    CGFloat solutionContentLabelH = 40;
    CGFloat solutionContentLabelW = DVTLabelContentLabelW;
    CGFloat solutionContentLabelX = CGRectGetMaxX(solutionLabel.frame) + marginX;
    UILabel * solutionContentLabel = [[UILabel alloc] initWithFrame:CGRectMake(solutionContentLabelX, solutionContentLabelY, solutionContentLabelW, solutionContentLabelH)];
    self.solutionContentLabel = solutionContentLabel;
    solutionContentLabel.font = [UIFont systemFontOfSize:20];
    solutionContentLabel.textColor = [UIColor grayColor];
    solutionContentLabel.backgroundColor = [UIColor contentLightColor];
    solutionContentLabel.text = @"早期活动";
    [self addSubview:solutionContentLabel];
    
    
    
    //重做
    CGFloat remakeBtnW = 150;
    CGFloat remakeBtnH = 40;
    CGFloat remakeBtnX =( WIDTH - 2*remakeBtnW)/3 + 100;
    CGFloat remakeBtnY = CGRectGetMaxY(solutionLabel.frame) + 2*marginY;
    CGRect remakeFrame = CGRectMake(remakeBtnX, remakeBtnY, remakeBtnW, remakeBtnH);
    UIButton * remakeBtn = [UIButton buttonWithFrame:remakeFrame BackgroundColor:[UIColor lightGreenColor] Tittle:@"重做" TittleColor:[UIColor whiteColor] target:self action:@selector(remakeBtnClick:)];
    remakeBtn.layer.cornerRadius = 7;
    remakeBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [self addSubview:remakeBtn];
    
    //提交
    CGFloat saveBtnW = remakeBtnW;
    CGFloat saveBtnH = remakeBtnH;
    CGFloat saveBtnX =( WIDTH - 2*remakeBtnW)/3 *2 ;
    CGFloat saveBtnY = CGRectGetMinY(remakeBtn.frame);
    CGRect saveFrame = CGRectMake(saveBtnX + 50, saveBtnY, saveBtnW, saveBtnH);
    UIButton * saveBtn = [UIButton buttonWithFrame:saveFrame BackgroundColor:[UIColor lightPurpleColor] Tittle:@"提交" TittleColor:[UIColor whiteColor] target:self action:@selector(saveBtnClick:)];
    saveBtn.layer.cornerRadius = 7;
    saveBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [self addSubview:saveBtn];

}

-(void)remakeBtnClick:(UIButton *)btn
{
    self.remakeBtnClick();
}

-(void)saveBtnClick:(UIButton *)btn
{
    self.saveBtnClick();
}


@end
