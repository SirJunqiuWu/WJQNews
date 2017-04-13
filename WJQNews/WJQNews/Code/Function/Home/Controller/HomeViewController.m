//
//  HomeViewController.m
//  WJQNews
//
//  Created by 吴俊秋 on 2017/4/12.
//  Copyright © 2017年 JackWu. All rights reserved.
//

#import "HomeViewController.h"
#import "NewsCell.h"

@interface HomeViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *infoTable;
    NSMutableArray *dataArray;
}

@end

@implementation HomeViewController

- (id)init {
    self = [super init];
    if (self) {
        dataArray = [NSMutableArray array];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"首页新闻";
    [self setupUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - 创建UI

- (void)setupUI {
    infoTable = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    infoTable.backgroundColor = [UIColor clearColor];
    infoTable.dataSource = self;
    infoTable.delegate = self;
    infoTable.separatorInset = UIEdgeInsetsZero;
    infoTable.layoutMargins = UIEdgeInsetsZero;
    infoTable.tableFooterView = [UIView new];
    [self.view addSubview:infoTable];
    
    [infoTable registerClass:[NewsCell class] forCellReuseIdentifier:@"NewsCell"];
    
    infoTable.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(refreshData)];
    infoTable.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(getMoreData)];
    [infoTable.mj_header beginRefreshing];
    
    [infoTable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_topLayoutGuideTop);
        make.left.equalTo(self.view.mas_left);
        make.width.equalTo(self.view.mas_width);
        make.bottom.equalTo(self.view.mas_bottom);
    }];
}

#pragma mark - 网络请求

- (void)refreshData {
    [self uploadDataReqWithIsRefresh:YES];
}

- (void)getMoreData {
    [self uploadDataReqWithIsRefresh:NO];
}

- (void)uploadDataReqWithIsRefresh:(BOOL)isRefresh {
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    [param setValue:@"1114283782" forKey:@"clientid"];
    [param setValue:@"1.1" forKey:@"v"];
    [param setValue:@"toutiao" forKey:@"type"];
    [param setValue:@"3001_9223370545054981573_48bc0275b9d2062b" forKey:@"startkey"];
    [param setValue:@"" forKey:@"newkey"];
    [param setValue:@"00000000-0000-0000-0000-000000000000" forKey:@"ime"];
    [param setValue:@"ZJZYIOS1114283782" forKey:@"apptypeid"];
    [param setValue:@"1" forKey:@"rn"];
    [param setValue:@"20" forKey:@"size"];
    
    NSInteger index = 1;
    if (isRefresh != YES) {
        //加载更多
    }
    [param setValue:[NSNumber numberWithInteger:index] forKey:@"index"];
    
    [[ConnectManager shareManager]getWithURLString:klURLForNews param:param success:^(NSURLSessionDataTask *task, id responseObject) {
        if (isRefresh == YES) {
            //下拉刷新
            [dataArray removeAllObjects];
        }
        if (responseObject) {
            NSArray *tpArray = [responseObject getArrayValueForKey:@"NewsList"];
            if (tpArray) {
                for (int i=0; i<tpArray.count; i++) {
                    WJQNews *tpNews = [[WJQNews alloc]initWithDic:[tpArray objectAtIndex:i]];
                    [dataArray addObject:tpNews];
                }
            }
        }
        [infoTable reloadData];
        [infoTable.mj_header endRefreshing];
        [infoTable.mj_footer endRefreshing];
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"%@",error.domain);
        [infoTable.mj_header endRefreshing];
        [infoTable.mj_footer endRefreshing];
    }];
}


#pragma mark - UITableViewDataSource && Delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellID = @"NewsCell";
    NewsCell *cell = (NewsCell *)[tableView dequeueReusableCellWithIdentifier:cellID];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    WJQNews *tpNews = dataArray[indexPath.row];
    cell.news = tpNews;
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    //因为先走了创建cell的代理方法，所以通过此方法能够获取到视图布局后的cell高度
    NewsCell *cell = (NewsCell *)[self tableView:tableView cellForRowAtIndexPath:indexPath];
    //cell.contentView上添加的最后一个视图距离底部的距离为8
    return [cell getLayoutCellHeightWithFlex:8];
}



@end
