//
//  ViewController.m
//  JHPullZoomView
//
//  Created by rookie on 2017/6/18.
//  Copyright © 2017年 mamahome. All rights reserved.
//

#import "ViewController.h"
#import "JHDropHeaderView.h"
@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableView;


@end
static NSString *cellID = @"cellID";
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    
    //使用方法:把JHDropHeaderView和UIView的分类 拖到你的项目中,导入头文件,在复制以下代码即可.
    
    
    //1.当头部视图只有一张图片的时候.使用方法如下
    
    UIImageView *topView =  [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"likaifu"]];
    topView.frame = CGRectMake(0, 0, self.view.frame.size.width, 250);
    
    JHDropHeaderView *JHView = [JHDropHeaderView dropHeaderViewWithFrame:topView.frame contentView:topView stretchView:topView];
    JHView.frame = topView.frame;
    self.tableView.tableHeaderView = JHView;
    
    
    //    2.当下拉放大的头部视图不只是一张图,还有其他控件,那么需要创建一个view,把需要放大的图片放在view上面即可.
    
    /*
     UIView *JHView = [[UIView alloc]init];
     JHView.frame =CGRectMake(0, 0, self.view.frame.size.width, 250);
     [JHView addSubview:topView];
     JHDropHeaderView *JHView = [JHDropHeaderView dropHeaderViewWithFrame:JHView.frame contentView:JHView stretchView:topView];
     
     */
    [self.view addSubview:self.tableView];
}


#pragma mark - UITableViewDelegate，UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"JHHeaderView %ld",indexPath.row];
    
    return cell;
}


#pragma mark - 懒加载
- (UITableView *)tableView
{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
    }
    return _tableView;
}

@end
