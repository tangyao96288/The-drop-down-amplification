//
//  KVPullDownEnlargeTableViewController.h
//  01-Cell的定制
//
//  Created by 唐姚 on 16/4/18.
//  Copyright © 2016年 唐姚. All rights reserved.
//


// 使用前提，不能设置tableView的背景色
#import <UIKit/UIKit.h>

@interface KVPullDownEnlargeTableViewController : UIViewController

/** 内部tableView */
@property (nonatomic,weak) UITableView * tableView;
/** 下拉放大区域高度 */
@property (nonatomic,assign) CGFloat pullDownEnlargeViewHeight;
/** 下拉放大图片名 */
@property (nonatomic,strong) NSString * pullDownEnlargeImageName;
/** 视图将要显示时是否清楚当前的显示 */
@property(nonatomic) BOOL clearsSelectionOnViewWillAppear;

/** 添加下拉放大功能 */
- (void)pullDownEnlargeViewWithImage:(NSString *)image height:(CGFloat)height;
/** 唯一初始化方法 */
- (instancetype)initWithStyle:(UITableViewStyle)style;

@end
