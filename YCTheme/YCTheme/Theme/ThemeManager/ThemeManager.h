//
//  ThemeManager.h
//  YCTheme
//
//  Created by Air on 2019/8/20.
//  Copyright © 2019 YC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/** 主题种类 */
typedef NS_ENUM(NSUInteger,ThemeType) {
    /** 白天主题 */
    ThemeNormal = 1,
    /** 晚上主题 */
    ThemeNight,
    /** 自定义主题 */
    ThemeCoustom
};

@interface ThemeManager : NSObject
/** 当前主题 */
@property (nonatomic, assign) ThemeType currentTheme;

+ (instancetype)sharedInstance;

/**
 * 切换主题
 *
 * @param theme 将要切换的主题
 */
- (void)switchTheme:(ThemeType)theme;

/**
 * 刷新指定视图主题
 *
 * @param object 指定刷新主题的视图
 */
- (void)changeThemeWithObject:(UIView *)object;
@end

NS_ASSUME_NONNULL_END
