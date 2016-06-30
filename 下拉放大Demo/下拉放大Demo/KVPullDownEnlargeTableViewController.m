//
//  KVPullDownEnlargeTableViewController.m
//  01-Cell的定制
//
//  Created by 唐姚 on 16/4/18.
//  Copyright © 2016年 唐姚. All rights reserved.
//

#import "KVPullDownEnlargeTableViewController.h"

@interface KVPullDownEnlargeTableViewController()<UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate>

@property (nonatomic,weak) UIImageView * pullDownEnlargeImageView;

@property (nonatomic,assign) UITableViewStyle style;

@end

@implementation KVPullDownEnlargeTableViewController
#pragma mark - setter

/**
 *  下拉放大区域高度
 */
- (void) setPullDownEnlargeViewHeight:(CGFloat)pullDownEnlargeViewHeight
{
    _pullDownEnlargeViewHeight = pullDownEnlargeViewHeight;
    
    // 更改下拉放大imageView的高
    CGRect frame = self.pullDownEnlargeImageView.frame;
    frame.size.height = _pullDownEnlargeViewHeight;
    self.pullDownEnlargeImageView.frame = frame;
    
    // 使tableView偏移
    self.tableView.contentInset = UIEdgeInsetsMake(self.pullDownEnlargeViewHeight, 0, 0, 0);
    self.tableView.contentOffset = CGPointMake(0, -self.pullDownEnlargeViewHeight);
}

/**
 *  下拉放大图片名
 */
- (void) setPullDownEnlargeImageName:(NSString *)pullDownEnlargeImageName
{
    _pullDownEnlargeImageName = pullDownEnlargeImageName;
    
    // 更改下拉放大的图片
    self.pullDownEnlargeImageView.image = [UIImage imageNamed:_pullDownEnlargeImageName];
}


#pragma mark - 系统方法

- (void)loadView
{
    [super loadView];
    
    // 创建内部的tableView（默认为stylePlain）
    UITableView * tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:self.style];
    
    // 设置代理
    tableView.delegate = self;
    tableView.dataSource = self;
    
    // 添加到视图
    [self.view addSubview:tableView];
    
    // 设置为全局属性
    self.tableView = tableView;
}

- (instancetype)initWithStyle:(UITableViewStyle)style
{
    if (self = [super init]) {
        self.style = style;
        self.clearsSelectionOnViewWillAppear = YES;
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    // 是否重新加载数据
    if (self.clearsSelectionOnViewWillAppear == YES) {
        [self.tableView reloadData];
    }
}

#pragma mark - 自定义方法

/**
 *  设置下拉放大
 *
 *  @param image  下拉放大的图片
 *  @param height 下拉放大显示图片的高度
 */
- (void)pullDownEnlargeViewWithImage:(NSString *)image height:(CGFloat)height;
{
    // 保存到对应属性
    self.pullDownEnlargeImageName = image;
    self.pullDownEnlargeViewHeight = height;
    
    // 实例化imageView
    UIImageView * pullDownEnlargeImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, height)];
    
    // 超出边界的切除
    pullDownEnlargeImageView.clipsToBounds = YES;
    
    // 设置内容模式
    pullDownEnlargeImageView.contentMode = UIViewContentModeScaleAspectFill;
    
    // 设置图片
    pullDownEnlargeImageView.image = [UIImage imageNamed:image];
    
    // 添加到控制器的视图上，而不是tableView上
    [self.view insertSubview:pullDownEnlargeImageView atIndex:0];
    
    // 设置为全局属性
    self.pullDownEnlargeImageView = pullDownEnlargeImageView;
    
    // 设置tableView的背景为空，以显示下拉放大图
    self.tableView.backgroundColor = [UIColor clearColor];
    
}


#pragma mark - UIScrollViewDelegate
- (void) scrollViewDidScroll:(UIScrollView *)scrollView
{
    // 在设置了下拉放大图片才予以执行
    if (self.pullDownEnlargeViewHeight) {
        // 判断下拉放大图片是否变形
        if (self.tableView.contentOffset.y > -self.pullDownEnlargeViewHeight) {
            return;
        }
        
        // 设置下拉放大ImageView的frame
        CGRect frame = self.pullDownEnlargeImageView.frame;
        frame.size.height = -self.tableView.contentOffset.y;
        self.pullDownEnlargeImageView.frame = frame;
    }
}


#pragma mark - UITableViewDataSources
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    /*
    static NSString * ID = @"category";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"测试数据%ld", indexPath.row];
    */
    return nil;
}

@end
