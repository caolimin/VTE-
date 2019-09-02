//
//  NewPatient_seniorSearchView.h
//  HuaXiHospitalNew
//
//  Created by admin on 2019/3/17.
//  Copyright © 2019年 caolimin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KtextFieldView.h"
#import "PatientModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface NewPatient_seniorSearchView : UIView
@property(nonatomic,strong) UIButton * searchBtn;
@property(nonatomic,strong) NSArray * dataArr;
@property (nonatomic,copy) void(^seniorTextfieldBlock)(NSMutableArray * arr,NewPatient_seniorSearchView *,NSInteger tag);
@property(nonatomic,strong) KtextFieldView * nameField;
@property(nonatomic,strong) KtextFieldView * sexField;
@property(nonatomic,strong) KtextFieldView * ageField;
@property(nonatomic,strong) KtextFieldView * officeField;
@property(nonatomic,strong) KtextFieldView * doctorField;
@property(nonatomic,strong) KtextFieldView * NurseField;
@property(nonatomic,strong) KtextFieldView * patientIDField;
@property (nonatomic,copy) void(^textfieldBackWithText)(NSString *str,NSInteger tag);
@property (nonatomic,copy) void(^removePickViewBlock)();
@property (nonatomic,copy) void(^patientIDFlagBlock)();   //用于标记病历号的键盘上升
-(void)reloadTextFieldText;
@end

NS_ASSUME_NONNULL_END
