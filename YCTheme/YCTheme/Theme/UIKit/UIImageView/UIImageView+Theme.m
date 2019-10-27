//
//  UIImageView+Theme.m
//  YCTheme
//
//  Created by Air on 2019/8/27.
//  Copyright © 2019 YC. All rights reserved.
//

#import "UIImageView+Theme.h"

static NSString * const ImageType = @"ImageType";

@implementation UIImageView (Theme)

#pragma mark - image

- (void)setImageWithName:(NSString *)name theme:(ThemeType)theme {
    NSString *key = [self getKeyWithType:ImageType theme:theme];
    [self.themePropertyContainer setObject:name forKey:key];
    if ([ThemeManager sharedInstance].currentTheme == theme) {
        self.image = [UIImage imageNamed:name];
    }
}

- (UIImage *)getBarTinColorWithTheme:(ThemeType)theme {
    NSString *key = [self getKeyWithType:ImageType theme:theme];
    NSString *name = [self.themePropertyContainer objectForKey:key];
    return [UIImage imageNamed:name];
}

- (void)changeTheme {
    [super changeTheme];
    ThemeType currentTheme = [ThemeManager sharedInstance].currentTheme;
    
    // image
    UIImage *image = [self getBarTinColorWithTheme:currentTheme];
    if (image) {
        self.image = image;
    }
}
@end
