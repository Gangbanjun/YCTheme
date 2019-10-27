//
//  UIView+Theme.m
//  YCTheme
//
//  Created by Air on 2019/8/20.
//  Copyright © 2019 YC. All rights reserved.
//

#import "UIView+Theme.h"
#import <objc/runtime.h>

static NSString * const BackgroundColorType = @"BackgroundColorType";
static NSString * const BorderColorType = @"BorderColorType";

@implementation UIView (Theme)

#pragma mark - 设置视图背景颜色

- (void)setBackgroundColor:(UIColor *)color theme:(ThemeType)theme {
    NSString *key = [self getKeyWithType:BackgroundColorType theme:theme];
    [self.themePropertyContainer setObject:color forKey:key];
    if ([ThemeManager sharedInstance].currentTheme == theme) {
        self.backgroundColor = color;
    }
}

- (UIColor *)getBackgroundColorWithTheme:(ThemeType)theme {
    NSString *key = [self getKeyWithType:BackgroundColorType theme:theme];
    UIColor *color = [self.themePropertyContainer objectForKey:key];
    return color;
}

#pragma mark - 设置视图边框颜色

- (void)setBorderColor:(UIColor *)color theme:(ThemeType)theme {
    NSString *key = [self getKeyWithType:BorderColorType theme:theme];
    [self.themePropertyContainer setObject:color forKey:key];
    if ([ThemeManager sharedInstance].currentTheme == theme) {
        self.layer.borderColor = color.CGColor;
    }
}

- (UIColor *)getBorderColorWithTheme:(ThemeType)theme {
    NSString *key = [self getKeyWithType:BorderColorType theme:theme];
    UIColor *color = [self.themePropertyContainer objectForKey:key];
    return color;
}

#pragma mark - 获取key

- (NSString *)getKeyWithType:(NSString *)type theme:(ThemeType)theme {
    NSString *key = [NSString stringWithFormat:@"%lu%@",(unsigned long)theme,type];
    return key;
}

#pragma mark - 刷新视图主题属性

- (void)changeTheme {
    // 背景颜色
    UIColor *backgroundColor = [self getBackgroundColorWithTheme:[ThemeManager sharedInstance].currentTheme];
    if (backgroundColor) {
        self.backgroundColor = backgroundColor;
    }
    // 边框颜色
    UIColor *borderColor = [self getBorderColorWithTheme:[ThemeManager sharedInstance].currentTheme];
    if (borderColor) {
        self.layer.borderColor = borderColor.CGColor;
    }
}

#pragma mark - 实现增加的类属性的set和get方法

- (void)setThemePropertyContainer:(NSMutableDictionary *)themePropertyContainer {
    objc_setAssociatedObject(self, @selector(themePropertyContainer), themePropertyContainer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSMutableDictionary *)themePropertyContainer {
    NSMutableDictionary *dict = objc_getAssociatedObject(self, @selector(themePropertyContainer));
    if (dict == nil) {
        dict = [[NSMutableDictionary alloc] initWithCapacity:1];
        [self setThemePropertyContainer:dict];
    }
    return dict;
}

@end
