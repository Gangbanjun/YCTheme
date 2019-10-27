//
//  UIImageView+Theme.h
//  YCTheme
//
//  Created by Air on 2019/8/27.
//  Copyright © 2019 YC. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImageView (Theme)

/** 设置指定主题下的图片 */
- (void)setImageWithName:(NSString *)name theme:(ThemeType)theme;

@end

NS_ASSUME_NONNULL_END
