//
//  UILabel+Theme.m
//  YCTheme
//
//  Created by Air on 2019/8/27.
//  Copyright © 2019 YC. All rights reserved.
//

#import "UILabel+Theme.h"

static NSString * const TextColorType = @"TextColorType";
static NSString * const AttributedTextType = @"AttributedTextType";

@implementation UILabel (Theme)

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

#pragma mark - attributedText

- (void)setAttributedText:(NSString *)text color:(UIColor *)color theme:(ThemeType)theme {
    NSString *key = [self getKeyWithType:AttributedTextType theme:theme];
    [self.themePropertyContainer setObject:color forKey:key];
    if ([ThemeManager sharedInstance].currentTheme == theme) {
        NSDictionary *textAttributes = @{NSForegroundColorAttributeName:color};
        self.attributedText = [[NSAttributedString alloc] initWithString:text attributes:textAttributes];
    }
}

- (UIColor *)getAttributedTextColorWithTheme:(ThemeType)theme {
    NSString *key = [self getKeyWithType:AttributedTextType theme:theme];
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
    
    // attributedText
    UIColor *attributedTextColor = [self getTextColorWithTheme:currentTheme];
    if (attributedTextColor) {
        NSDictionary *textAttributes = @{NSForegroundColorAttributeName:attributedTextColor};
        self.attributedText = [[NSAttributedString alloc] initWithString:self.text attributes:textAttributes];
    }
}

@end
