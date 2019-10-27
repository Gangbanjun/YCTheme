//
//  UIButton+Theme.m
//  YCTheme
//
//  Created by Air on 2019/8/27.
//  Copyright © 2019 YC. All rights reserved.
//

#import "UIButton+Theme.h"

static NSString * const BackgroundImageType = @"BackgroundImageType";
static NSString * const ImageType = @"ImageType";
static NSString * const TitleColorType = @"TitleColorType";

@implementation UIButton (Theme)

#pragma mark - BackgroundImage

- (void)setBackgroundImageName:(NSString *)imageName forState:(UIControlState)state theme:(ThemeType)theme {
    NSString *key = [self getKeyWithType:BackgroundImageType state:state theme:theme];
    [self.themePropertyContainer setObject:imageName forKey:key];
    if ([ThemeManager sharedInstance].currentTheme == theme) {
        UIImage *image = [UIImage imageNamed:imageName];
        [self setBackgroundImage:image forState:state];
    }
}

- (UIImage *)getBackgroundImageWithTheme:(ThemeType)theme forState:(UIControlState)state {
    NSString *key = [self getKeyWithType:BackgroundImageType state:state theme:theme];
    NSString *imageName = [self.themePropertyContainer objectForKey:key];
    UIImage *image = [UIImage imageNamed:imageName];
    return image;
}

#pragma mark - Image

- (void)setImageName:(NSString *)imageName forState:(UIControlState)state theme:(ThemeType)theme {
    NSString *key = [self getKeyWithType:ImageType state:state theme:theme];
    [self.themePropertyContainer setObject:imageName forKey:key];
    if ([ThemeManager sharedInstance].currentTheme == theme) {
        UIImage *image = [UIImage imageNamed:imageName];
        [self setImage:image forState:state];
    }
}

- (UIImage *)getImageWithTheme:(ThemeType)theme forState:(UIControlState)state {
    NSString *key = [self getKeyWithType:ImageType state:state theme:theme];
    NSString *imageName = [self.themePropertyContainer objectForKey:key];
    UIImage *image = [UIImage imageNamed:imageName];
    return image;
}

#pragma mark - TitleColor

- (void)setTitleColor:(UIColor *)color forState:(UIControlState)state theme:(ThemeType)theme {
    NSString *key = [self getKeyWithType:TitleColorType state:state theme:theme];
    [self.themePropertyContainer setObject:color forKey:key];
    if ([ThemeManager sharedInstance].currentTheme == theme) {
        [self setTitleColor:color forState:state];
    }
}

- (UIColor *)getTitleColorWithTheme:(ThemeType)theme forState:(UIControlState)state {
    NSString *key = [self getKeyWithType:TitleColorType state:state theme:theme];
    UIColor *color = [self.themePropertyContainer objectForKey:key];
    return color;
}

- (void)changeTheme {
    [super changeTheme];
    
    ThemeType currentTheme = [ThemeManager sharedInstance].currentTheme;
    UIControlState controlState[4] = {UIControlStateNormal,UIControlStateHighlighted,UIControlStateDisabled,UIControlStateSelected};
    
    for (int i=0; i<4; i++) {
        UIControlState state = controlState[i];
        // BackgroundImage
        UIImage *backgroundImage = [self getBackgroundImageWithTheme:currentTheme forState:state];
        if (backgroundImage) {
            [self setBackgroundImage:backgroundImage forState:state];
        }
        
        // Image
        UIImage *image = [self getImageWithTheme:currentTheme forState:state];
        if (image) {
            [self setImage:image forState:state];
        }
        
        // TitleColor
        UIColor *color = [self getTitleColorWithTheme:currentTheme forState:state];
        if (color) {
            [self setTitleColor:color forState:state];
        }
    }
}

#pragma mark - 获取key

- (NSString *)getKeyWithType:(NSString *)type state:(UIControlState)controlState theme:(ThemeType)theme {
    NSString *key = [NSString stringWithFormat:@"%lu%lu%@",(unsigned long)theme,(unsigned long)controlState,type];
    
    return key;
}

@end
