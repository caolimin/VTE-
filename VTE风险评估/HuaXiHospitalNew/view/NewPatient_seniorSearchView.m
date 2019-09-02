//
//  NewPatient_seniorSearchView.m
//  HuaXiHospitalNew
//
//  Created by admin on 2019/3/17.
//  Copyright © 2019年 caolimin. All rights reserved.
//

#import "NewPatient_seniorSearchView.h"
@interface NewPatient_seniorSearchView()<UITextFieldDelegate>
@end
@implementation NewPatient_seniorSearchView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        CGFloat  nameFieldY = 20;
        CGFloat  nameFieldW = 500;
        CGFloat  nameFieldX = 40;
        CGFloat  nameFieldH = 40;
        CGFloat marginY = 10;
        KtextFieldView * nameField = [[KtextFieldView alloc] initWithFrame:CGRectMake(nameFieldX, nameFieldY, nameFieldW, nameFieldH) title:@"姓名："];
        self.nameField = nameField;
        nameField.textField.delegate = self;
        nameField.textField.tag = 100;
        [self addSubview:nameField];
        
        KtextFieldView * sexField = [[KtextFieldView alloc] initWithFrame:CGRectMake(nameFieldX, CGRectGetMaxY(nameField.frame)+marginY, nameFieldW, nameFieldH) title:@"性别："];
        sexField.textField.delegate = self;
        self.sexField = sexField;
        sexField.textField.tag = 101;
        [self addSubview:sexField];
        
        KtextFieldView * ageField = [[KtextFieldView alloc] initWithFrame:CGRectMake(nameFieldX, CGRectGetMaxY(sexField.frame) + marginY, nameFieldW, nameFieldH) title:@"年龄："];
        self.ageField = ageField;
        ageField.textField.delegate = self;
        ageField.textField.tag = 102;
        [self addSubview:ageField];
        
        KtextFieldView * officeField = [[KtextFieldView alloc] initWithFrame:CGRectMake(nameFieldX, CGRectGetMaxY(ageField.frame) + marginY, nameFieldW, nameFieldH) title:@"科室："];
        officeField.textField.delegate = self;
        self.officeField = officeField;
        officeField.textField.tag = 103;
        [self addSubview:officeField];
        
        KtextFieldView * doctorField = [[KtextFieldView alloc] initWithFrame:CGRectMake(nameFieldX, CGRectGetMaxY(officeField.frame) + marginY, nameFieldW, nameFieldH) title:@"主管医生："];
        doctorField.textField.delegate = self;
        self.doctorField = doctorField;
        doctorField.textField.tag = 104;
        [self addSubview:doctorField];
        
        KtextFieldView * NurseField = [[KtextFieldView alloc] initWithFrame:CGRectMake(nameFieldX, CGRectGetMaxY(doctorField.frame) + marginY, nameFieldW, nameFieldH) title:@"主管护士："];
        NurseField.textField.delegate = self;
        self.NurseField = NurseField;
        NurseField.textField.tag = 105;
        [self addSubview:NurseField];
        
        KtextFieldView * patientIDField = [[KtextFieldView alloc] initWithFrame:CGRectMake(nameFieldX, CGRectGetMaxY(NurseField.frame) + marginY, nameFieldW, nameFieldH) title:@"病历号："];
        patientIDField.textField.delegate = self;
        self.patientIDField = patientIDField;
        patientIDField.textField.tag = 106;
        [self addSubview:patientIDField];
        
        CGFloat searchBtnW = 150;
        CGFloat searchBtnX = (frame.size.width - searchBtnW)/2;
        CGFloat searchBtnY = CGRectGetMaxY(patientIDField.frame) + marginY;
        CGFloat searchBtnH = 40;
        UIButton * searchBtn = [[UIButton alloc] initWithFrame:CGRectMake(searchBtnX, searchBtnY, searchBtnW, searchBtnH)];
        self.searchBtn = searchBtn;
        [searchBtn setTitle:@"搜索" forState:UIControlStateNormal];
        searchBtn.titleLabel.textColor = [UIColor whiteColor];
        searchBtn.backgroundColor = [UIColor lightPurpleColor];
        searchBtn.layer.cornerRadius = 7;
        [self addSubview:searchBtn];
        self.backgroundColor = [UIColor whiteColor];
        
        self.userInteractionEnabled = YES;
        UITapGestureRecognizer * gestureRecognizer = [[UITapGestureRecognizer alloc] init];
        [self addGestureRecognizer:gestureRecognizer];
        [gestureRecognizer addTarget:self action:@selector(gestureRecognizerTap)];
    }
    return self;
}

-(void)gestureRecognizerTap
{
    [self endEditing:YES];
}

-(void)setDataArr:(NSArray *)dataArr
{
    _dataArr = dataArr;
}


-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    NSMutableArray * array = [[NSMutableArray alloc] init];
    [array removeAllObjects];
    
    if (textField.tag == 100) {
        if (self.removePickViewBlock) {
            self.removePickViewBlock();
        }
        return YES;
//        for (PatientModel * model in self.dataArr) {
//            [array addObject:model.PATIENT_NAME];
//        }
    }else if (textField.tag == 101)
    {
        [array addObject:@"男"];
        [array addObject:@"女"];
    }else if (textField.tag == 102)
    {
        for (int i  = 0; i<120; i++) {
            [array addObject:[NSString stringWithFormat:@"%d",i]];
        }
        
    }else if (textField.tag == 103)
    {
        for (PatientModel * model in self.dataArr) {
            if ([array containsObject:model.IN_OFFICE]) continue;
            [array addObject:model.IN_OFFICE];
        }
    }else if (textField.tag == 104)
    {
        for (PatientModel * model in self.dataArr) {
            if ([array containsObject:model.DOCTOR_NAME]) continue;
            [array addObject:model.DOCTOR_NAME];
        }
    }else if (textField.tag == 105)
    {
        for (PatientModel * model in self.dataArr) {
            if ([array containsObject:model.NURSE_NAME]) continue;
            [array addObject:model.NURSE_NAME];
        }
    }else if (textField.tag == 106)
    {
        if (self.patientIDFlagBlock) {
            self.patientIDFlagBlock();
        }
        if (self.removePickViewBlock) {
            self.removePickViewBlock();
        }
        return YES;
//        for (PatientModel * model in self.dataArr) {
//            if ([array containsObject:model.PATIENT_ID]) continue;
//            [array addObject:model.PATIENT_ID];
//        }
    }
    [self endEditing:YES];
    if (self.seniorTextfieldBlock) {
        self.seniorTextfieldBlock(array, self,textField.tag);
    }

    return NO;
}

-(void)textFieldDidEndEditing:(UITextField *)textField
{
    if (self.textfieldBackWithText) {
        self.textfieldBackWithText(textField.text,textField.tag);
    }
}

-(void)reloadTextFieldText
{
    self.nameField.textField.text = @"";
    self.sexField.textField.text = @"";
    self.ageField.textField.text = @"";
    self.officeField.textField.text = @"";
    self.doctorField.textField.text = @"";
    self.NurseField.textField.text = @"";
    self.patientIDField.textField.text = @"";
}
@end
