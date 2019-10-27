//
//  UINavigationBar+Theme.h
//  YCTheme
//
//  Created by Air on 2019/8/28.
//  Copyright © 2019 YC. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UINavigationBar (Theme)

/** 设置制定主题下的背景颜色 */
- (void)setBarTinColor:(UIColor *)color theme:(ThemeType)theme;
/** 设置指定主题下的TinColor */
- (void)setTinColor:(UIColor *)color theme:(ThemeType)theme;

@end

NS_ASSUME_NONNULL_END
