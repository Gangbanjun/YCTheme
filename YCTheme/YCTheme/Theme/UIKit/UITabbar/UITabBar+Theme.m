//
//  UITabBar+Theme.m
//  YCTheme
//
//  Created by Air on 2019/8/28.
//  Copyright © 2019 YC. All rights reserved.
//

#import "UITabBar+Theme.h"

static NSString * const BarTinColorType = @"BarTinColorType";
static NSString * const TinColorType = @"TinColorType";
static NSString * const ImagesType = @"ImagesKey";
static NSString * const SelectedImagesType = @"SelectedImagesType";

@implementation UITabBar (Theme)

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

#pragma mark - 设置图片

- (void)setImageNames:(NSArray *)images selectedImageNames:(NSArray *)selectedImages theme:(ThemeType)theme{
    NSString *imageKey = [self getKeyWithType:ImagesType theme:theme];
    [self.themePropertyContainer setObject:images ? : @[] forKey:imageKey];
    
    NSString *selectedKey = [self getKeyWithType:SelectedImagesType theme:theme];
    [self.themePropertyContainer setObject:selectedImages ? : @[] forKey:selectedKey];
    
    if ([ThemeManager sharedInstance].currentTheme == theme) {
        [self setImageWithImageNames:images selectedImageNames:selectedImages];
    }
}

- (NSArray *)getImageNamesWithType:(NSString *)type theme:(ThemeType)theme {
    NSString *key = [self getKeyWithType:type theme:theme];
    NSArray *names = [self.themePropertyContainer objectForKey:key];
    return names;
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
    
    // 设置图片
    NSArray *imageNames = [self getImageNamesWithType:ImagesType theme:currentTheme];
    NSArray *selectedImageNames = [self getImageNamesWithType:SelectedImagesType theme:currentTheme];
    [self setImageWithImageNames:imageNames selectedImageNames:selectedImageNames];
}

#pragma mark - 设置tabbar图片

- (void)setImageWithImageNames:(NSArray *)imageNames selectedImageNames:(NSArray *)selectedImageNames {
    for (int i=0; i<self.items.count; i++) {
        UITabBarItem *item = self.items[i];
        NSString *imageName = imageNames.count > i ? imageNames[i] : nil;
        NSString *selectedImageName = selectedImageNames.count > i ? selectedImageNames[i] : nil;
        item.image = imageName ? [UIImage imageNamed:imageName] : nil;
        item.selectedImage = selectedImageName ? [UIImage imageNamed:imageName] : nil;
    }
}
@end
