//
//  UIColor+HGJ.m
//  Selene
//
//  Created by zhaoqiang on 16/3/31.
//  Copyright © 2016年 hairun. All rights reserved.
//

#import "UIColor+HGJ.h"
#import "HeaderFile.h"

@implementation UIColor (HGJ)

#pragma mark - Hex
+ (UIColor *)colorWithHex:(int)hexValue alpha:(CGFloat)alpha {
    return [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/255.0
                           green:((float)((hexValue & 0xFF00) >> 8))/255.0
                            blue:((float)(hexValue & 0xFF))/255.0
                           alpha:alpha];
}

+ (UIColor *)colorWithHex:(int)hexValue {
    return [UIColor colorWithHex:hexValue alpha:1.0];
}

+ (UIColor *)colorWithHexString:(NSString *)color {
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) {
        return [UIColor clearColor];
    }
    
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"])
        cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"])
        cString = [cString substringFromIndex:1];
    if ([cString length] != 6)
        return [UIColor clearColor];
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    
    // r
    NSString *rString = [cString substringWithRange:range];
    
    // g
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    // b
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f) green:((float) g / 255.0f) blue:((float) b / 255.0f) alpha:1.0f];
}

+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha {
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) {
        return [UIColor clearColor];
    }
    
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"])
        cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"])
        cString = [cString substringFromIndex:1];
    if ([cString length] != 6)
        return [UIColor clearColor];
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    
    // r
    NSString *rString = [cString substringWithRange:range];
    
    // g
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    // b
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f) green:((float) g / 255.0f) blue:((float) b / 255.0f) alpha:alpha];
}

+ (UIColor *)getColorByTeetype:(NSString *)typeString {
    UIColor *teeColor = nil;
    
    if ([typeString isEqualToString:@"1"]) {
        teeColor = [self colorWithHexString:@"#E53432"];
    } else if([typeString isEqualToString:@"2"]){
        teeColor = [UIColor whiteColor];
    } else if([typeString isEqualToString:@"3"]){
        teeColor = [self colorWithHexString:@"#3B91DA"];
    } else if([typeString isEqualToString:@"4"]){
        teeColor = [self colorWithHexString:@"#E6C100"];
    } else if([typeString isEqualToString:@"5"]){
        teeColor = [self colorWithHexString:@"#444646"];
    } else if([typeString isEqualToString:@"6"]){
        teeColor = [self colorWithHexString:@"#FBF700"];
    }
    
    return teeColor;
}

#pragma mark - theme colors
+ (UIColor *)themeColor {
    return [UIColor colorWithHexString:@"#f4f8fb"];
}

+ (UIColor *)nameColor {
    return [UIColor colorWithHex:0x087221];
}

+ (UIColor *)titleColor {
    return [UIColor blackColor];
}

+ (UIColor *)separatorColor {
    return Color(217.0f, 217.0f, 223.0f);
}

+ (UIColor *)cellsColor {
    return [UIColor whiteColor];
}

+ (UIColor *)titleBarColor {
    return [UIColor colorWithHex:0xE1E1E1];
}

+ (UIColor *)contentTextColor {
    return [UIColor colorWithHex:0x272727];
}

+ (UIColor *)selectTitleBarColor {
    return [UIColor colorWithHex:0xE1E1E1];
}

+ (UIColor *)navigationBarColor {
    return Color(251, 158, 151);
}

+ (UIColor *)selectCellColor {
    return Color(203.0f, 203.0f, 203.0f);
}

+ (UIColor *)labelTextColor {
    return [UIColor whiteColor];
}

+ (UIColor *)themeRedColor {
    return [UIColor colorWithHexString:@"#ff4466"];
}

+ (UIColor *)routePlanColor {
    return [UIColor colorWithHexString:@"#46B5FF"];
}

+ (UIColor *)infosBackViewColor {
    return [UIColor clearColor];
}

+ (UIColor *)lineColor {
    return [UIColor colorWithHex:0x2bc157];
}

+ (UIColor *)borderColor {
    return [UIColor lightGrayColor];
}

+ (UIColor *)refreshControlColor {
    return [UIColor colorWithHex:0x21B04B];
}

+ (UIColor *)text32Color {
    return [UIColor colorWithHexString:@"#323232"];
}

+ (UIColor *)text64Color {
    return [UIColor colorWithHexString:@"#646464"];
}

+ (UIColor *)tabbarNormalColor {
    return [UIColor colorWithHexString:@"#a7a7a7"];
}

+ (UIColor *)tabbarSelectedColor {
    return [UIColor colorWithHexString:@"#ff5675"];
}

+ (UIColor *)text8cColor {
    return [UIColor colorWithHexString:@"#8c8c8c"];
}

+ (UIColor *)text8aColor {
    return [UIColor colorWithHexString:@"#8a8a8a"];
}

+ (UIColor *)navDiscoverySelectedColor {
    return [UIColor colorWithHexString:@"#fecfcd"];
}

+ (UIColor *)text34Color {
    return [UIColor colorWithHexString:@"#343434"];
}

+ (UIColor *)forgetWordColor {
    return [UIColor colorWithHexString:@"#9ac2fd"];
}

+ (UIColor *)benefitColor {
    return [UIColor colorWithHexString:@"#fd9e9a"];
}

+ (UIColor *)picLineColor {
    return [UIColor colorWithHexString:@"#e6e6e6"];
}

+ (UIColor *)textb7Color {
    return [UIColor colorWithHexString:@"#b7b7b7"];
}

+ (UIColor *)texf0Color {
    return [UIColor colorWithHexString:@"#f0f0f0"];
}

+ (UIColor *)statusOrangeColor {
    return [UIColor colorWithHexString:@"#f7b162"];
}

+ (UIColor *)statusGreenColor {
    return [UIColor colorWithHexString:@"#9ad1ab"];
}

+ (UIColor *)text5dColor {
    return [UIColor colorWithHexString:@"#5d5d5d"];
}

+ (UIColor *)text1fColor {
    return [UIColor colorWithHexString:@"#1f1f1f"];
}

+ (UIColor *)text98Color {
    return [UIColor colorWithHexString:@"#989898"];
}

+ (UIColor *)text5aColor {
    return [UIColor colorWithHexString:@"#5a5a5a"];
}

+ (UIColor *)textebColor {
    return [UIColor colorWithHexString:@"#ebebeb"];
}

+ (UIColor *)text90Color {
    return [UIColor colorWithHexString:@"#909090"];
}

+ (UIColor *)bdcColor {
    return [UIColor colorWithHexString:@"#bdc4ca"];
}

+ (UIColor *)textf0Color {
    return [UIColor colorWithHexString:@"#f0f0f0"];
}

+ (UIColor *)textccColor {
    return [UIColor colorWithHexString:@"#cccccc"];
}

+ (UIColor *)textaaColor {
    return [UIColor colorWithHexString:@"#aaaaaa"];
}

@end
