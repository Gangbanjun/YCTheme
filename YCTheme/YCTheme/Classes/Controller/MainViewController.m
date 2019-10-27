//
//  MainViewController.m
//  YCTheme
//
//  Created by Air on 2019/8/20.
//  Copyright © 2019 YC. All rights reserved.
//

#import "MainViewController.h"
#import "NextViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor] theme:ThemeNormal];
    [self.view setBackgroundColor:[UIColor blackColor] theme:ThemeNight];
    [self.view setBackgroundColor:[UIColor yellowColor] theme:ThemeCoustom];
    
    UIButton *nextBut = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 80, 40)];
    
    [nextBut setBackgroundColor:[UIColor blackColor] theme:ThemeNormal];
    [nextBut setBackgroundColor:[UIColor whiteColor] theme:ThemeNight];
    [nextBut setBackgroundColor:[UIColor greenColor] theme:ThemeCoustom];
    
    [nextBut setBorderColor:[UIColor redColor] theme:ThemeNormal];
    [nextBut setBorderColor:[UIColor whiteColor] theme:ThemeNight];
    [nextBut setBorderColor:[UIColor blueColor] theme:ThemeCoustom];
    
    [nextBut setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal theme:ThemeNormal];
    [nextBut setTitleColor:[UIColor blackColor] forState:UIControlStateNormal theme:ThemeNight];
    [nextBut setTitleColor:[UIColor blueColor] forState:UIControlStateNormal theme:ThemeCoustom];
    
    nextBut.layer.borderWidth = 1;
    [nextBut setTitle:@"下一页" forState:UIControlStateNormal];
    [nextBut addTarget:self action:@selector(nextButClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:nextBut];
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:nextBut];
    self.navigationItem.rightBarButtonItem = rightItem;
    
    UILabel *contentLab = [[UILabel alloc] initWithFrame:CGRectMake(30, 150, ScreenWith - 60, 40)];
    contentLab.text = @"轻量级主题切换";
    contentLab.font = [UIFont systemFontOfSize:15];
    contentLab.textAlignment = NSTextAlignmentCenter;
    [contentLab setTextColor:[UIColor blackColor] theme:ThemeNormal];
    [contentLab setTextColor:[UIColor whiteColor] theme:ThemeNight];
    [contentLab setTextColor:[UIColor blueColor] theme:ThemeCoustom];
    [self.view addSubview:contentLab];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)nextButClick {
    NextViewController *nextVC = [[NextViewController alloc] init];
    [self.navigationController pushViewController:nextVC animated:YES];
}
@end
