//
//  InputCustomCell.h
//  HuaXiHospitalNew
//
//  Created by admin on 2019/3/14.
//  Copyright © 2019年 caolimin. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface InputCustomCell : UITableViewCell
@property (nonatomic,copy) void(^searchBtnClick)(InputCustomCell *);
@property(nonatomic,strong) UILabel * contentTitleLabel;
@property (nonatomic,copy) void(^patient_idClick)(NSString *);
@property (nonatomic,copy) void(^Patient_nameClick)(NSString *);
@end

NS_ASSUME_NONNULL_END
