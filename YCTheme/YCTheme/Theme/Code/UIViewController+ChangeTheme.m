//
//  UIViewController+ChangeTheme.m
//  YCTheme
//
//  Created by Air on 2019/8/21.
//  Copyright © 2019 YC. All rights reserved.
//

#import "UIViewController+ChangeTheme.h"
#import "ThemeManager.h"
#import <objc/runtime.h>
#import "MainViewController.h"

@implementation UIViewController (ChangeTheme)

+ (void)load {
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        
        // 替换viewWillAppear
    method_exchangeImplementations(class_getInstanceMethod(self.class,@selector(viewWillAppear:)),
                                       class_getInstanceMethod(self.class,@selector(hook_viewWillAppear:)));
        // 替换viewDidAppear
        method_exchangeImplementations(class_getInstanceMethod(self.class,@selector(viewDidAppear:)),
                                       class_getInstanceMethod(self.class,@selector(hook_viewDidAppear:)));
    });
}

- (void)changeThemeNotification {
    [[ThemeManager sharedInstance] changeThemeWithObject:self.navigationController.navigationBar];
    [[ThemeManager sharedInstance] changeThemeWithObject:self.view];
}

- (void)hook_viewWillAppear:(BOOL)animated {
    [self hook_viewWillAppear:animated];
    if (self.isViewDidAppear) {
        [[ThemeManager sharedInstance] changeThemeWithObject:self.navigationController.navigationBar];
        [[ThemeManager sharedInstance] changeThemeWithObject:self.view];
    } else {
        [[ThemeManager sharedInstance] changeThemeWithObject:self.navigationController.navigationBar];
    }
}

- (void)hook_viewDidAppear:(BOOL)animated {
    [self hook_viewDidAppear:animated];
    self.isViewDidAppear = YES;
}

#pragma mark - 实现增加的类属性的set和get方法

- (void)setIsViewDidAppear:(BOOL)isViewDidAppear {
    objc_setAssociatedObject(self, @selector(isViewDidAppear), @(isViewDidAppear), OBJC_ASSOCIATION_ASSIGN);
}

- (BOOL)isViewDidAppear {
    NSNumber *value = objc_getAssociatedObject(self, @selector(isViewDidAppear));
    if (!value) {
        value = [NSNumber numberWithBool:NO];
    }
    return [value boolValue];
}

@end
