//
//  UIColor+UIColorExetnsion.h
//  HealthChat
//
//  Created by 苗宁 on 12-3-3.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
CGFloat flashColor(int color);
#define ADOBE_COLOR(r, g, b, a) [UIColor flashColorWithRed:r green:g blue:b alpha:a]
@interface UIColor (UIColorExetnsion)
+ (id)colorWithHEX:(uint)color;
+ (id)colorWithHEX:(uint)color alpha:(CGFloat)alpha;
+ (id)flashColorWithRed:(uint)red green:(uint)green blue:(uint)blue alpha:(float)alpha;
+ (UIColor *)randomColor;
+ (UIColor *)textBlackColor;
+ (UIColor *)textGrayColor;
+ (UIColor *)textOrangeColor;
+ (UIColor *)promptGreentColor;
+(UIColor *)currentTitleColor;
//我的医生,我的患者提示语颜色
+ (UIColor *)promptTitleColor;
+ (UIColor *)promptContentColor;
+ (UIColor *)promptBlueColor;
+ (UIColor *)systemTexture;
+ (UIColor *)defaltBackgroundColor;
+ (UIColor *)contentTextColor;
+ (UIColor *)listTitleColor;
+ (UIColor *)listSubTitleColor;
+ (UIColor *)listRedColor;
+ (UIColor *)lightTextColor;
+ (UIColor *)navigationBarColor;
+(UIColor *)normalTextColor;
+(UIColor *)lightTextColor1;
+ (UIColor *)lightGreenColor;
+ (UIColor *)contentLightColor;
+ (UIColor *)lightPurpleColor;
@end
