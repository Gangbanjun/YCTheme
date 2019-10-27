//
//  UITextView+Theme.m
//  YCTheme
//
//  Created by Air on 2019/9/2.
//  Copyright © 2019 YC. All rights reserved.
//

#import "UITextView+Theme.h"

static NSString * const TextColorType = @"TextColorType";

@implementation UITextView (Theme)

#pragma mark - TextColor

- (void)setTextColor:(UIColor *)color theme:(ThemeType)theme {
    NSString *key = [self getKeyWithType:TextColorType theme:theme];
    [self.themePropertyContainer setObject:color forKey:key];
    if ([ThemeManager sharedInstance].currentTheme == theme) {
        self.textColor = color;
    }
}

- (UIColor *)getTextColorWithTheme:(ThemeType)theme {
    NSString *key = [self getKeyWithType:TextColorType theme:theme];
    UIColor *color = [self.themePropertyContainer objectForKey:key];
    return color;
}

- (void)changeTheme {
    [super changeTheme];
    ThemeType currentTheme = [ThemeManager sharedInstance].currentTheme;
    
    // textColor
    UIColor *textColor = [self getTextColorWithTheme:currentTheme];
    if (textColor) {
        self.textColor = textColor;
    }
}

@end
