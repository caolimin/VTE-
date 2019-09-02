//
//  RiskResultFactoryTCell.m
//  HuaXiHospitalNew
//
//  Created by admin on 2019/3/17.
//  Copyright © 2019年 caolimin. All rights reserved.
//

#import "RiskResultFactoryTCell.h"
#import "PatientModel.h"
@implementation RiskResultFactoryTCell
//-(NSArray *)factoryArr
//{
//    if (!_factoryArr) {
//        _factoryArr = [[NSArray alloc] init];
//    }
//    return _factoryArr;
//}
-(void)setFactoryArr:(NSArray *)factoryArr
{
    CGFloat titleLabelW =  250;
    CGFloat titleLabelH =  40;
    CGFloat titleLabelX = 70;
    CGFloat titleLabelY = 20;
    UILabel * titleLabel = [[UILabel alloc] init];
    titleLabel.frame = CGRectMake(titleLabelX, titleLabelY, titleLabelW, titleLabelH);
    titleLabel.text = @"风险因素:";
    [self addSubview:titleLabel];
    _factoryArr = factoryArr;
    CGFloat factoryLabelW =  200;
    CGFloat factoryLabelH =  50;
    CGFloat marginX = (WIDTH - 2*factoryLabelW)/3;
    CGFloat marginY = 20;
    CGFloat factoryLabelY = CGRectGetMaxY(titleLabel.frame) + marginY;
    for (int i = 0; i<self.factoryArr.count; i++) {
        PatientModel *model =self.factoryArr[i];
        UILabel * factoryLabel = [[UILabel alloc] init];
        factoryLabel.numberOfLines = 0;
        factoryLabel.frame = CGRectMake(marginX + i%2*(marginX + factoryLabelW), factoryLabelY + i/2*(marginY + factoryLabelH), factoryLabelW, factoryLabelH);
        factoryLabel.text = [NSString stringWithFormat:@"%@",model.FACTOR];
        [self addSubview:factoryLabel];
    }
    
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
