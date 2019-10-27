//
//  UITextView+Theme.h
//  YCTheme
//
//  Created by Air on 2019/9/2.
//  Copyright © 2019 YC. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITextView (Theme)

/** 设置指定主题下的文字颜色 */
- (void)setTextColor:(UIColor *)color theme:(ThemeType)theme;

@end

NS_ASSUME_NONNULL_END
