//
//  UIColor+UIColorExetnsion.m
//  HealthChat
//
//  Created by 苗宁 on 12-3-3.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "UIColor+UIColorExetnsion.h"
CGFloat flashColor(int color) {
    return color / 255.0f;
}

@implementation UIColor (UIColorExetnsion)
+(id)colorWithHEX:(uint)color{
    return [self colorWithHEX:color alpha:1.0f];
}
+ (id)colorWithHEX:(uint)color alpha:(CGFloat)alpha {
    float r = (color&0xFF0000) >> 16;
    float g = (color&0xFF00) >> 8;
    float b = (color&0xFF);
    return [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:alpha];
}

+(UIColor *)randomColor{
    float r = (double)arc4random()/0x100000000;
    float g = (double)arc4random()/0x100000000;
    float b = (double)arc4random()/0x100000000;
    return [UIColor colorWithRed:r green:g blue:b alpha:1];
}

+(id)flashColorWithRed:(uint)red green:(uint)green blue:(uint)blue alpha:(float)alpha{
    float r = red/255.0f;
    float g = green/255.0f;
    float b = blue/255.0f;
    return [UIColor colorWithRed:r green:g blue:b alpha:alpha];
}

+(UIColor *)currentTitleColor { //深灰色 标题颜色
    return [UIColor colorWithHEX:0x333333];
}

+ (UIColor *)promptContentColor{ //橘黄色
    return [UIColor colorWithHEX:0x907a4c];
}

+ (UIColor *)promptBlueColor { // 蓝色
    return [UIColor colorWithHEX:0x136dd7];
}

+ (UIColor *)promptGreentColor { //深绿色
    return [UIColor flashColorWithRed:0 green:196 blue:189 alpha:1.0f];
}
+(UIColor *)normalTextColor {
    return [UIColor colorWithHEX:0x656565];
}

//+ (UIColor *)lightTextColor {
//    return [UIColor colorWithHEX:0x989898];
//}

+(UIColor *)textGrayColor{
    return [UIColor colorWithRed:0.549f green:0.549f blue:0.549f alpha:1.0f];
}

+(UIColor *)textBlackColor{
    return [UIColor colorWithRed:0.062745f green:0.16078f blue:0.2f alpha:1.0f];
}

+(UIColor *)textOrangeColor{
    return [UIColor colorWithRed:0.5647 green:0.4784 blue:0.298 alpha:1];
}

+ (UIColor *)promptTitleColor{
    return [UIColor flashColorWithRed:37 green:37 blue:36 alpha:1];
}

+(UIColor *)systemTexture {
    static UIColor *color = nil;
    if (!color) {
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"背景纹理" ofType:@"png"];
        UIImage *image = [UIImage imageWithContentsOfFile:filePath];
        color = [UIColor colorWithPatternImage:image];
    }
    return color;
}

+ (UIColor *)defaltBackgroundColor {
    return [UIColor whiteColor];
//    return [UIColor colorWithRed:0.95294 green:0.96078 blue:0.94117 alpha:1];
}

+ (UIColor *)listTitleColor{
    return [UIColor flashColorWithRed:51 green:51 blue:51 alpha:1];
}

+ (UIColor *)listSubTitleColor{
    return [UIColor flashColorWithRed:144 green:122 blue:76 alpha:1];
}
+ (UIColor *)contentTextColor{//灰色
    return [UIColor colorWithHEX:0x4b4b4b];
}

+ (UIColor *)listRedColor{
    return [UIColor flashColorWithRed:250 green:120 blue:5 alpha:1];
}

+ (UIColor *)lightTextColor{
    return [UIColor flashColorWithRed:153 green:153 blue:153 alpha:1];
}
+ (UIColor *)lightTextColor1{
    return [UIColor colorWithHEX:0x79c8ff];
}
+ (UIColor *)navigationBarColor {
//    return [UIColor colorWithHEX:0x39ced8];
    return [UIColor colorWithHEX:0x41b8b6];
}
+ (UIColor *)lightGreenColor {
    //    return [UIColor colorWithHEX:0x39ced8];
    return [UIColor colorWithHEX:0x2EC7C9];
}
+ (UIColor *)contentLightColor {
    //    return [UIColor colorWithHEX:0x39ced8];
    return [UIColor colorWithHEX:0xf3f3f3];
}
+ (UIColor *)lightPurpleColor {
    //    return [UIColor colorWithHEX:0x39ced8];
    return [UIColor colorWithHEX:0x735FDE];
}

@end
