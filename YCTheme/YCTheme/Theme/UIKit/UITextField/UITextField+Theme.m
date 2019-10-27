//
//  UITextField+Theme.m
//  YCTheme
//
//  Created by Air on 2019/8/27.
//  Copyright © 2019 YC. All rights reserved.
//

#import "UITextField+Theme.h"

static NSString * const TextColorType = @"TextColorType";
static NSString * const PlaceholderColorType = @"PlaceholderColorType";

@implementation UITextField (Theme)

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

#pragma mark - PlaceholderColor

- (void)setPlaceholder:(NSString *)text color:(UIColor *)color theme:(ThemeType)theme {
    NSString *key = [self getKeyWithType:PlaceholderColorType theme:theme];
    [self.themePropertyContainer setObject:color forKey:key];
    if ([ThemeManager sharedInstance].currentTheme == theme) {
        NSDictionary *textAttributes = @{NSForegroundColorAttributeName:color};
        self.attributedPlaceholder = [[NSAttributedString alloc] initWithString:text attributes:textAttributes];
    }
}

- (UIColor *)getPlaceholderColorWithTheme:(ThemeType)theme {
    NSString *key = [self getKeyWithType:PlaceholderColorType theme:theme];
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
    
    // PlaceholderColor
    UIColor *PlaceholderColor = [self getTextColorWithTheme:currentTheme];
    if (PlaceholderColor) {
        NSDictionary *textAttributes = @{NSForegroundColorAttributeName:PlaceholderColor};
        self.attributedPlaceholder = [[NSAttributedString alloc] initWithString:self.text attributes:textAttributes];
    }
}
@end
