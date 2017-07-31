//
//  UIColor+HGJ.h
//  Selene
//
//  Created by zhaoqiang on 16/3/31.
//  Copyright © 2016年 hairun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (HGJ)

#pragma mark - 颜色转换 IOS中十六进制的颜色转换为UIColor
+ (UIColor *)colorWithHexString:(NSString *)color;
+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;
+ (UIColor *)getColorByTeetype:(NSString *)teeType;

+ (UIColor *)colorWithHex:(int)hexValue alpha:(CGFloat)alpha;
+ (UIColor *)colorWithHex:(int)hexValue;

+ (UIColor *)themeColor;
+ (UIColor *)nameColor;
+ (UIColor *)titleColor;
+ (UIColor *)separatorColor;
+ (UIColor *)cellsColor;
+ (UIColor *)titleBarColor;
+ (UIColor *)selectTitleBarColor;
+ (UIColor *)navigationBarColor;
+ (UIColor *)selectCellColor;
+ (UIColor *)labelTextColor;
+ (UIColor *)themeRedColor;
+ (UIColor *)routePlanColor;
+ (UIColor *)infosBackViewColor;
+ (UIColor *)lineColor;
+ (UIColor *)contentTextColor;
+ (UIColor *)borderColor;
+ (UIColor *)refreshControlColor;
+ (UIColor *)text32Color;
+ (UIColor *)text64Color;
+ (UIColor *)tabbarNormalColor;
+ (UIColor *)tabbarSelectedColor;
+ (UIColor *)text34Color;
+ (UIColor *)navDiscoverySelectedColor;
+ (UIColor *)forgetWordColor;
+ (UIColor *)text8cColor;
+ (UIColor *)text8aColor;
+ (UIColor *)benefitColor;
+ (UIColor *)picLineColor;
+ (UIColor *)textb7Color;
+ (UIColor *)texf0Color;
+ (UIColor *)statusOrangeColor;
+ (UIColor *)statusGreenColor;
+ (UIColor *)text5dColor;
+ (UIColor *)text1fColor;
+ (UIColor *)text98Color;
+ (UIColor *)text5aColor;
+ (UIColor *)textebColor;
+ (UIColor *)text90Color;
+ (UIColor *)bdcColor;
+ (UIColor *)textf0Color;
+ (UIColor *)textccColor;
+ (UIColor *)textaaColor;

@end
