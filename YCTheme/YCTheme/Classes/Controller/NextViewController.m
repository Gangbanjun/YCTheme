//
//  NextViewController.m
//  YCTheme
//
//  Created by Air on 2019/8/22.
//  Copyright © 2019 YC. All rights reserved.
//

#import "NextViewController.h"

@interface NextViewController ()

@end

@implementation NextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor] theme:ThemeNormal];
    [self.view setBackgroundColor:[UIColor blackColor] theme:ThemeNight];
    [self.view setBackgroundColor:[UIColor yellowColor] theme:ThemeCoustom];
    
    self.title = @"二级页面";
    
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(30, 150, ScreenWith - 60, 40)];
    textField.layer.borderWidth = 1;
    [textField setPlaceholder:@"占位文本" color:[UIColor grayColor] theme:ThemeNormal];
    [textField setPlaceholder:@"占位文本" color:[UIColor lightTextColor] theme:ThemeNight];
    [textField setPlaceholder:@"占位文本" color:[UIColor greenColor] theme:ThemeCoustom];
    [textField setTextColor:[UIColor blackColor] theme:ThemeNormal];
    [textField setTextColor:[UIColor whiteColor] theme:ThemeNight];
    [textField setTextColor:[UIColor redColor] theme:ThemeCoustom];
    [textField setBorderColor:[UIColor blueColor] theme:ThemeNormal];
    [textField setBorderColor:[UIColor whiteColor] theme:ThemeNight];
    [textField setBorderColor:[UIColor redColor] theme:ThemeCoustom];

    [self.view addSubview:textField];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}
@end
