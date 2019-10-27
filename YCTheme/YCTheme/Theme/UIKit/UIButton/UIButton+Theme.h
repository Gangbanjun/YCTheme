//
//  UIButton+Theme.h
//  YCTheme
//
//  Created by Air on 2019/8/27.
//  Copyright © 2019 YC. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (Theme)

/** 设置指定主题下背景图片 */
- (void)setBackgroundImageName:(NSString *)imageName forState:(UIControlState)state theme:(ThemeType)theme;
/** 设置指定主题下前景图片 */
- (void)setImageName:(NSString *)imageName forState:(UIControlState)state theme:(ThemeType)theme;
/** 设置指定主题下文字颜色 */
- (void)setTitleColor:(UIColor *)color forState:(UIControlState)state theme:(ThemeType)theme;

@end

NS_ASSUME_NONNULL_END
