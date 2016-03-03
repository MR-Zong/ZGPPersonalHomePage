//
//  ViewController.m
//  ZGTestTableView
//
//  Created by Zong on 16/3/2.
//  Copyright © 2016年 Zong. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) UIImageView *headerView;

@property (weak, nonatomic) UITableView *tableView;

@property (weak, nonatomic) UIView *tableViewHeaderView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UITableView *tableView = [[UITableView alloc] init];
    self.tableView = tableView;
    
    tableView.backgroundColor = [UIColor redColor];
    
    tableView.frame = self.view.bounds;
    
    tableView.dataSource = self;
    tableView.delegate = self;
    
    
    UIView *headerView = [[UIView alloc] init];
    self.tableViewHeaderView = headerView;
    headerView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 250);
    headerView.backgroundColor = [UIColor clearColor];
    
    UIImageView *headerViewWant = [[UIImageView alloc] init];
    self.headerView = headerViewWant;
    
    headerViewWant.image = [UIImage imageNamed:@"headerImage.jpg"];
    headerViewWant.contentMode = UIViewContentModeScaleAspectFill;
    headerViewWant.clipsToBounds = YES;
    headerViewWant.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 250);
    headerViewWant.backgroundColor = [UIColor yellowColor];
    
    
    [tableView addSubview:headerViewWant];
    
    tableView.tableHeaderView = headerView;
    
    [self.view addSubview:tableView];
    
}



#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 50;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TestCell"];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"TestCell"];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"%zd-%zd",indexPath.section,indexPath.row];
    cell.backgroundColor = [UIColor clearColor];
    
    return cell;
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView.contentOffset.y > 0) {
        return;
    }
    self.headerView.frame = CGRectMake(0,scrollView.contentOffset.y, [UIScreen mainScreen].bounds.size.width + (- scrollView.contentOffset.y), -scrollView.contentOffset.y + 250);
    self.headerView.center = CGPointMake([UIScreen mainScreen].bounds.size.width / 2.0, self.headerView.center.y);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
