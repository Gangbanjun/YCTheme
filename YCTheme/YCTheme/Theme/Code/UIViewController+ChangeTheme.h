//
//  UIViewController+ChangeTheme.h
//  YCTheme
//
//  Created by Air on 2019/8/21.
//  Copyright © 2019 YC. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

static NSString *const ChangeThemeNotificationName;

@interface UIViewController (ChangeTheme)

@property (nonatomic, assign) BOOL isViewDidAppear;

@end

NS_ASSUME_NONNULL_END
