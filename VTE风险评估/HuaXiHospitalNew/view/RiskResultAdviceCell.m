//
//  RiskResultAdviceCell.m
//  HuaXiHospitalNew
//
//  Created by admin on 2019/3/17.
//  Copyright © 2019年 caolimin. All rights reserved.
//

#import "RiskResultAdviceCell.h"

@implementation RiskResultAdviceCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        CGFloat adviceLabelH = 20;
        CGFloat adviceLabelX = 70;
        CGFloat adviceLabelW = WIDTH - 2*adviceLabelX;
        CGFloat adviceLabelY = 10;
        UILabel * adviceLabel = [[UILabel alloc] init];
        self.adviceLabel = adviceLabel;
        adviceLabel.frame = CGRectMake(adviceLabelX, adviceLabelY, adviceLabelW, adviceLabelH);
        [self addSubview:adviceLabel];
        
        CGFloat adviceContentLabelW = adviceLabelW;
        CGFloat adviceContentLabelH = 60;
        CGFloat adviceContentLabelX = CGRectGetMinX(adviceLabel.frame);
        CGFloat adviceContentLabelY = CGRectGetMaxY(adviceLabel.frame) ;
        CGRect adviceContentLabelFrame = CGRectMake(adviceContentLabelX, adviceContentLabelY, adviceContentLabelW, adviceContentLabelH);
        UILabel * adviceContentLabel = [[UILabel alloc] init];
        adviceContentLabel.numberOfLines = 0;
        self.adviceContentLabel = adviceContentLabel;
        adviceContentLabel.frame = adviceContentLabelFrame;
        [self addSubview:adviceContentLabel];
        
        UIView * lineView = [[UIView alloc] init];
        lineView.backgroundColor = [UIColor lightGrayColor];
        lineView.frame = CGRectMake(0, 0.5, WIDTH, 0.5);
        [self addSubview:lineView];
    }
    return  self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)drawRect:(CGRect)rect
{
    CGRect frame = CGRectMake(55, 15, 10, 10);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [[UIColor whiteColor] set];
    CGContextFillRect(context, rect);
    
    CGContextAddEllipseInRect(context, frame);
    [[UIColor redColor] set];
    CGContextFillPath(context);
}

@end
