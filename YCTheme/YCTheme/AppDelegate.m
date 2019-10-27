//
//  AppDelegate.m
//  YCTheme
//
//  Created by Air on 2019/8/20.
//  Copyright © 2019 YC. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"
#import "SettingViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    _window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    MainViewController *mainVC = [[MainViewController alloc] init];
    mainVC.title = @"首页";
    SettingViewController *settingVC = [[SettingViewController alloc] init];
    settingVC.title = @"设置";
    
    UINavigationController *navigation1 = [[UINavigationController alloc] initWithRootViewController:mainVC];
    UINavigationController *navigation2 = [[UINavigationController alloc] initWithRootViewController:settingVC];
    
    // 设置导航栏不同主题下的TinColor
    [navigation1.navigationBar setTinColor:[UIColor yellowColor] theme:ThemeNormal];
    [navigation1.navigationBar setTinColor:[UIColor blackColor] theme:ThemeNight];
    [navigation1.navigationBar setTinColor:[UIColor redColor] theme:ThemeCoustom];
    
    UITabBarController *tabbar = [[UITabBarController alloc] init];
    tabbar.viewControllers = @[navigation1,navigation2];
    // 设置标签栏不同主题下的BarTinColor
    [tabbar.tabBar setBarTinColor:[UIColor whiteColor] theme:ThemeNormal];
    [tabbar.tabBar setBarTinColor:[UIColor blackColor] theme:ThemeNight];
    [tabbar.tabBar setBarTinColor:[UIColor greenColor] theme:ThemeCoustom];
    // 设置标签栏不同主题下的选中与未选中图片
    [tabbar.tabBar setImageNames:@[@"main_normal_normal",@"setting_normal_normal"] selectedImageNames:@[@"main_select_normal",@"setting_select_normal"] theme:ThemeNormal];
    [tabbar.tabBar setImageNames:@[@"main_normal_night",@"setting_normal_night"] selectedImageNames:@[@"main_select_night",@"setting_select_night"] theme:ThemeNight];
    [tabbar.tabBar setImageNames:@[@"main_normal_normal",@"setting_normal_normal"] selectedImageNames:@[@"main_normal_normal",@"setting_normal_normal"] theme:ThemeCoustom];
    // 设置标签栏不同主题下TinColor
    [tabbar.tabBar setTinColor:[UIColor redColor] theme:ThemeNormal];
    [tabbar.tabBar setTinColor:[UIColor greenColor] theme:ThemeNight];
    [tabbar.tabBar setTinColor:[UIColor blueColor] theme:ThemeCoustom];
    
    _window.rootViewController = tabbar;
    [_window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
