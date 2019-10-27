//
//  UITextField+Theme.h
//  YCTheme
//
//  Created by Air on 2019/8/27.
//  Copyright © 2019 YC. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITextField (Theme)

/** 设置指定主题下的文字颜色 */
- (void)setTextColor:(UIColor *)color theme:(ThemeType)theme;
/** 设置指定主题下占位字颜色 */
- (void)setPlaceholder:(NSString *)text color:(UIColor *)color theme:(ThemeType)theme;

@end

NS_ASSUME_NONNULL_END
