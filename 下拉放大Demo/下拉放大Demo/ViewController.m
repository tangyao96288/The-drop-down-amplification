//
//  ViewController.m
//  下拉放大Demo
//
//  Created by 唐姚 on 16/4/18.
//  Copyright © 2016年 唐姚. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(nonatomic, strong) UIView * view;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self pullDownEnlargeViewWithImage:@"18_2" height:150];
    
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapEventFire:)];
    [self.tableView addGestureRecognizer:tap];
    
}

- (void) tapEventFire:(UITapGestureRecognizer *)tag
{
    self.pullDownEnlargeViewHeight = 200;
    //    self.pullDownEnlargeViewHeight = 0;
}


#pragma mark - UITableViewDataSources
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 50;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * ID = @"category";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"测试数据%ld", indexPath.row];
    
    return cell;
}

@end
