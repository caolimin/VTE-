//
//  QuestionCollectionViewCell.m
//  HuaXiHospitalNew
//
//  Created by admin on 2019/3/11.
//  Copyright © 2019年 caolimin. All rights reserved.
//

#import "QuestionCollectionViewCell.h"

@implementation QuestionCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
   // self.questionSelectBtn.userInteractionEnabled = NO;
    // Initialization code
    self.questionSelectBtn.titleLabel.numberOfLines = 0;
   // self.questionSelectBtn.backgroundColor = [UIColor grayColor];
    [self.questionSelectBtn setTitle:@"   你好" forState:UIControlStateNormal];
    [self.questionSelectBtn setImage:[UIImage imageNamed:@"box.png"] forState:UIControlStateNormal];
}
- (IBAction)questionBtnClick:(UIButton *)sender {
//    self.questionSelectBtn.selected = !self.questionSelectBtn.selected;
//    if (self.questionSelectBtn.selected) {
//        [self.questionSelectBtn setImage:[UIImage imageNamed:@"dx_h.png"] forState:UIControlStateSelected];
//    }else
//    {
//        [self.questionSelectBtn setImage:[UIImage imageNamed:@"dx.png"] forState:UIControlStateNormal];
//    }
    self.questionBtnClickBlock(self);
}

@end
