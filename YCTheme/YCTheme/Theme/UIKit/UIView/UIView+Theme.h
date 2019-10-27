//
//  UIView+Theme.h
//  YCTheme
//
//  Created by Air on 2019/8/20.
//  Copyright © 2019 YC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ThemeManager.h"

NS_ASSUME_NONNULL_BEGIN

@class ThemeMaker;

@interface UIView (Theme)

/** 视图主题属性值存放容器 */
@property (nonatomic, strong)NSMutableDictionary *themePropertyContainer;

/** 设置视图背景颜色 */
- (void)setBackgroundColor:(UIColor *)color theme:(ThemeType)theme;
/** 设置视图边框颜色 */
- (void)setBorderColor:(UIColor *)color theme:(ThemeType)theme;
/** 刷新视图主题属性 */
- (void)changeTheme;
/**
 * 获取缓存视图主题属性的key值
 *
 * @param type 视图属性类型
 * @param theme 指定的主题
 */
- (NSString *)getKeyWithType:(NSString *)type theme:(ThemeType)theme;

@end

NS_ASSUME_NONNULL_END
