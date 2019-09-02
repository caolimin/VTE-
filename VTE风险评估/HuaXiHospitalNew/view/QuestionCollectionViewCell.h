//
//  QuestionCollectionViewCell.h
//  HuaXiHospitalNew
//
//  Created by admin on 2019/3/11.
//  Copyright © 2019年 caolimin. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface QuestionCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIButton *questionSelectBtn;
@property (nonatomic,copy)  void(^questionBtnClickBlock)(QuestionCollectionViewCell *);
@end

NS_ASSUME_NONNULL_END
