//
//  UINavigationBar+Theme.m
//  YCTheme
//
//  Created by Air on 2019/8/28.
//  Copyright © 2019 YC. All rights reserved.
//

#import "UINavigationBar+Theme.h"

static NSString * const BarTinColorType = @"BarTinColorType";
static NSString * const TinColorType = @"TinColorType";

@implementation UINavigationBar (Theme)

#pragma mark - BarTinColor

- (void)setBarTinColor:(UIColor *)color theme:(ThemeType)theme {
    NSString *key = [self getKeyWithType:BarTinColorType theme:theme];
    [self.themePropertyContainer setObject:color forKey:key];
    if ([ThemeManager sharedInstance].currentTheme == theme) {
        self.barTintColor = color;
    }
}

- (UIColor *)getBarTinColorWithTheme:(ThemeType)theme {
    NSString *key = [self getKeyWithType:BarTinColorType theme:theme];
    UIColor *color = [self.themePropertyContainer objectForKey:key];
    return color;
}

#pragma mark - TinColor

- (void)setTinColor:(UIColor *)color theme:(ThemeType)theme {
    NSString *key = [self getKeyWithType:TinColorType theme:theme];
    [self.themePropertyContainer setObject:color forKey:key];
    if ([ThemeManager sharedInstance].currentTheme == theme) {
        self.tintColor = color;
    }
}

- (UIColor *)getTinColorWithTheme:(ThemeType)theme {
    NSString *key = [self getKeyWithType:TinColorType theme:theme];
    UIColor *color = [self.themePropertyContainer objectForKey:key];
    return color;
}

- (void)changeTheme {
    ThemeType currentTheme = [ThemeManager sharedInstance].currentTheme;
    
    // barTintColor
    UIColor *barTintColor = [self getBarTinColorWithTheme:currentTheme];
    if (barTintColor) {
        self.barTintColor = barTintColor;
    }
    
    // tintColor
    UIColor *tintColor = [self getTinColorWithTheme:currentTheme];
    if (tintColor) {
        self.tintColor = tintColor;
    }
}
@end
