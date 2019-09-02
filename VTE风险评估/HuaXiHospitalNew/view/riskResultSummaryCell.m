//
//  riskResultSummaryCell.m
//  HuaXiHospitalNew
//
//  Created by admin on 2019/3/17.
//  Copyright © 2019年 caolimin. All rights reserved.
//

#import "riskResultSummaryCell.h"
@interface riskResultSummaryCell()
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *projectLabel;
@property (weak, nonatomic) IBOutlet UILabel *socreLabel;
@property (weak, nonatomic) IBOutlet UILabel *riskGradeLabel;
@property (weak, nonatomic) IBOutlet UILabel *structionLabel;
@property (weak, nonatomic) IBOutlet UILabel *badLabel;
@property (weak, nonatomic) IBOutlet UILabel *controlLabel;
@property (weak, nonatomic) IBOutlet UIImageView *contentImgaeView;


@end
@implementation riskResultSummaryCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
//    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(20, 20, WIDTH - 2 * 20, 400)];
//    view.backgroundColor = [UIColor lightGrayColor];
//    view.layer.cornerRadius = 7;
//    view.alpha = 0.3;
//    [self addSubview:view];
//    UIView * lineView = [[UIView alloc] init];
//    lineView.backgroundColor = [UIColor lightGrayColor];
//    lineView.frame = CGRectMake(0, self.frame.size.height -0.5, WIDTH, 0.5);
//    [self addSubview:lineView];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setModel:(PatientModel *)model
{
    _model = model;
    self.timeLabel.text = [NSString stringWithFormat:@"评估时间：%@",model.IN_TIME];
    self.projectLabel.text = [NSString stringWithFormat:@"评估项目：%@",model.DISEASE];
   // self.socreLabel.text = [NSString stringWithFormat:@"评估总分：%@",model.ASSESS_SCORE];
    
    NSString * str1 = [NSString stringWithFormat:@"风险等级：%@",model.RISK_LEVEL];
    NSInteger length1 = str1.length;
    // 创建一个富文本
    NSMutableAttributedString *attri1 =  [[NSMutableAttributedString alloc] initWithString:str1];
    
    // 设置数字为红色
    [attri1 addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(5, length1 - 5)];
    self.riskGradeLabel.attributedText = attri1;
    if ([model.RISK_LEVEL isEqualToString:@"低危"]) {
        self.contentImgaeView.image = [UIImage imageNamed:@"1"];
    }else if ([model.RISK_LEVEL isEqualToString:@"中危"])
    {
        self.contentImgaeView.image = [UIImage imageNamed:@"2"];
    }else if ([model.RISK_LEVEL isEqualToString:@"高危"])
    {
        self.contentImgaeView.image = [UIImage imageNamed:@"3"];
    }else if ([model.RISK_LEVEL isEqualToString:@"极高危"])
    {
        self.contentImgaeView.image = [UIImage imageNamed:@"4"];
    }
    self.structionLabel.text = @"根据您提供的相关信息和临床\n检查结果，您近期罹患静脉血\n栓(VTE)的可能性比较大。";
    self.badLabel.text = @"患者的生命能力下降，导致患\n者死亡风险增加，增加医疗费\n用负担。";
    self.controlLabel.text = @"及时采取有效措施，能很大程\n度控制您的疾病危险因素，防\n治静脉血栓及其后续危害发生。";
    NSString * str = [NSString stringWithFormat:@"评估总分：%@",self.model.ASSESS_SCORE];
    NSInteger length = str.length;
    // 创建一个富文本
    NSMutableAttributedString *attri =  [[NSMutableAttributedString alloc] initWithString:str];
    
    // 设置数字为红色
        [attri addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(5, length - 5)];
        [attri addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:24] range:NSMakeRange(5, length - 5)];
    self.socreLabel.attributedText = attri;
}
@end
