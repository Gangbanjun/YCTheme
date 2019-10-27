//
//  SettingViewController.m
//  YCTheme
//
//  Created by Air on 2019/8/20.
//  Copyright © 2019 YC. All rights reserved.
//

#import "SettingViewController.h"

@interface SettingViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *dataSource;
@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor] theme:ThemeNormal];
    [self.view setBackgroundColor:[UIColor blackColor] theme:ThemeNight];
    [self.view setBackgroundColor:[UIColor yellowColor] theme:ThemeCoustom];
    
    _dataSource = @[@{@"title":@"白色主题",@"theme":@(ThemeNormal)},
                    @{@"title":@"黑色主题",@"theme":@(ThemeNight)},
                    @{@"title":@"黄色主题",@"theme":@(ThemeCoustom)}];
    
    [self createTableView];
}

- (void)createTableView {
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, NaviBarAndStatusBarHeight, ScreenWith, SaveAreaHeight) style:UITableViewStylePlain];
    _tableView.rowHeight = 50;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellID = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        cell.backgroundColor = [UIColor clearColor];
        [cell.textLabel setTextColor:[UIColor blackColor] theme:ThemeNormal];
        [cell.textLabel setTextColor:[UIColor whiteColor] theme:ThemeNight];
        [cell.textLabel setTextColor:[UIColor blueColor] theme:ThemeCoustom];
    }
    
    NSDictionary *dataDict = _dataSource[indexPath.row];
    cell.textLabel.text = dataDict[@"title"];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *dataDict = _dataSource[indexPath.row];
    NSNumber * selectThemeNum = dataDict[@"theme"];
    ThemeType selectTheme = [selectThemeNum integerValue];
    [[ThemeManager sharedInstance] switchTheme:selectTheme];
}
@end
