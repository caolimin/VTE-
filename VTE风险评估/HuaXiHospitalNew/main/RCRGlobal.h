//
//  RCRGlobal.h
//  lbt
//
//  Created by gaoxin on 16/7/16.
//  Copyright © 2016年 gx. All rights reserved.
//

#ifndef RCRGlobal_h
#define RCRGlobal_h


// color

#define kColor_viewbg_f1f1f1   @"#f1f1f1"
#define kColor_Text_31c27b     @"#31c27b"
#define kColor_Text_333333     @"#333333"
#define kColor_Text_666666     @"#666666"
#define kColor_Text_ffffff     @"#ffffff"
#define kColor_Line_cccccc     @"#cccccc"
#define kColor_Line_c8c8c8     @"#c8c8c8"
#define kColor_Text_000000     @"#000000"
#define kColor_Text_f96666     @"#f96666"
#define kColor_Text_aeacb5     @"#aeacb5"




// font
#define kFontSize10  10
#define kFontSize11  11
#define kFontSize12  12
#define kFontSize13  13
#define kFontSize14  14
#define kFontSize15  15
#define kFontSize18  18
#define kFontSize20  20
#define kFontSize21  21
#define kFontSize24  24




#define WeakSelf  __weak typeof(self)weakSelf = self

#define IsValidString(object) (object && ([object isKindOfClass:[NSString class]]) && ([object length] > 0))

#define WIDTH [UIScreen mainScreen].bounds.size.width
#define HEIGHT [UIScreen mainScreen].bounds.size.height

// http://sr.second-vision.net/XiaoYiRobotSer/HospitalDoctorRobot?Type=queryFacePic&MERCHANT_ID=&SITE_ID=
#define BaseUrlRequest(str) [NSString stringWithFormat:@"http://220.194.46.204/XiaoYiRobotSer/%@",str]
#define BaseUrl @"http://sr.second-vision.net/XiaoYiRobotSer/"
#define BaseUrlnNew @"http://rbst.second-vision.net/XiaoYiRobotSer/"
#define LoacalBaseUrl @"http://220.194.46.204/XiaoYiRobotSer/"
//#define LoacalBaseUrl @"http://192.168.1.222:9090/XiaoYiRobotSer/"
//#define kMarkTextListArray {@"音高了",@"音低了",@"快练",@"慢练",@"错音",@"渐强",@"渐弱",@"其他"}
//#define kMarkTextListArray {@"音高了",@"音低了",@"快练",@"慢练",@"错音",@"渐强",@"渐弱",@"其他"}
//self.voiceImageView.tag = 20;
//_markTypeView.tag = 30;
//self.voiceSaveView.tag = 40;
//  _textListView.tag = 50;
// _textImageView.tag = 60;
//_saveImageView.tag = 70;






#endif /* RCRGlobal_h */
