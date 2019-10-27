//
//  ThemeManager.m
//  YCTheme
//
//  Created by Air on 2019/8/20.
//  Copyright © 2019 YC. All rights reserved.
//

#import "ThemeManager.h"
#import "UIViewController+ChangeTheme.h"

@interface ThemeManager()



@end

@implementation ThemeManager

+ (instancetype)sharedInstance {
    static ThemeManager *thememanager;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        thememanager = [[ThemeManager alloc] init];
    });
    return thememanager;
}

- (instancetype)init {
    if ((self = [super init])) {
        _currentTheme = ThemeNormal;
    }
    return self;
}

#pragma mark - 切换主题

- (void)switchTheme:(ThemeType)theme {
    if (_currentTheme == theme) {
        return;
    }
    
    _currentTheme = theme;
    UIWindow *window = [[[UIApplication sharedApplication] delegate] window];
    [self changeThemeWithObject:window.subviews.lastObject];
}

#pragma mark - 刷新指定视图主题

- (void)changeThemeWithObject:(UIView *)object {
    if ([object respondsToSelector:@selector(changeTheme)]) {
        [object performSelector:@selector(changeTheme) withObject:nil];
    }
    
    if ([object respondsToSelector:@selector(subviews)]) {
        if (![object subviews]) {
            return;
        }
        for (UIView *subview in [object subviews]) {
            [self changeThemeWithObject:subview];
        }
    }
}
@end
