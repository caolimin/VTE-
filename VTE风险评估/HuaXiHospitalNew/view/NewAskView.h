//
//  NewAskView.h
//  HuaXiHospitalNew
//
//  Created by admin on 2019/3/17.
//  Copyright © 2019年 caolimin. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NewAskView : UIView
@property(nonatomic,strong) UITableView * tableView;
@property(nonatomic,strong) UILabel * scoreLabel;
@property(nonatomic,strong) UILabel * riskGradeContentLabel;
@property(nonatomic,strong) UILabel * DVTLabelContentLabel;
@property(nonatomic,strong) UILabel * solutionContentLabel;
@property (nonatomic,copy) void(^remakeBtnClick)();
@property (nonatomic,copy) void(^saveBtnClick)();
@property(nonatomic,strong) NSArray * factoryArr;
@end

NS_ASSUME_NONNULL_END
