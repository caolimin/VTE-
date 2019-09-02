//
//  PatientHeaderView.h
//  HuaXiHospitalNew
//
//  Created by admin on 2019/3/16.
//  Copyright © 2019年 caolimin. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PatientHeaderView : UIView
@property(nonatomic,strong) UILabel  * numLabel;
@property(nonatomic,strong) NSMutableArray * labelArr;
@property(nonatomic,strong) UITextField * searchField;
@property (nonatomic,copy) void(^searchBtnClick)();
@property (nonatomic,copy) void(^seniorBtnClick)();
@end

NS_ASSUME_NONNULL_END
