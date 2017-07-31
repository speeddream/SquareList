//
//  SquareListViewController.m
//  SquareList
//
//  Created by 海润 on 2017/7/22.
//  Copyright © 2017年 Speed. All rights reserved.
//

#import "SquareListViewController.h"
#import "SquareListCollectionCell.h"
#import "WaterFlowLayout.h"
#import "ShareListItem.h"
#import "RefreshResult.h"
#import "Constant.h"
#import "AppMacro.h"
#import "Service.h"
#import <MJExtension.h>
#import <MJRefresh.h>
#import <Masonry.h>
#import "NSData+YYAdd.h"
#import "HeaderFile.h"
#import <SDImageCache.h>
#import "SDImageCacheConfig.h"

@interface SquareListViewController ()<UICollectionViewDataSource, UICollectionViewDelegate, WaterFlowLayoutDelegate>

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, strong) WaterFlowLayout *waterLayout;

@property (nonatomic, strong) NSMutableArray *squares;

@property (nonatomic, assign) NSInteger pageIndex;

@property (nonatomic, assign) NSInteger pageSize;

@end

@implementation SquareListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupCollectionView];
    
    [self fetchNewData];
    
//    [SDImageCache sharedImageCache].config.shouldDecompressImages = NO;
//    [SDImageCache sharedImageCache].config.shouldCacheImagesInMemory = NO;
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
    [[SDImageCache sharedImageCache] setValue:nil forKey:@"memCache"];
}

- (void)dealloc {
    
}

#pragma mark - lazyload
- (NSMutableArray *)squares {
    if (!_squares) {
        _squares = [NSMutableArray array];
    }
    return _squares;
}

/** 创建瀑布流layout、设置代理 */
- (UICollectionView *)collectionView {
    if (!_collectionView) {
        WaterFlowLayout *waterLayout = [[WaterFlowLayout alloc] init];
        waterLayout.delegate = self;
        waterLayout.edgeInsets = UIEdgeInsetsMake(10, 10.f, 0, 10.f);
        waterLayout.columnMargin = 10.f;
        waterLayout.rowMargin = 10.f;
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:waterLayout];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        _collectionView.showsVerticalScrollIndicator = NO;
    }
    return _collectionView;
}

- (void)setupCollectionView {
    self.pageIndex = 1;
    self.pageSize  = 10;
    [self.view addSubview:self.collectionView];
    self.collectionView.backgroundColor = [UIColor clearColor];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsZero);
    }];
    
    // 注册cell
    [self.collectionView registerNib:[UINib nibWithNibName:CellReuseID bundle:nil] forCellWithReuseIdentifier:CellReuseID];
    
    WS(weakSelf);
    // 上拉、下拉加载MJRefreshBackNormalFooter
    self.collectionView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [weakSelf fetchNewData];
    }];
    
    self.collectionView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [weakSelf fetchMoreData];
    }];
    
    self.collectionView.mj_footer.automaticallyHidden = YES;
}

#pragma mark - 分页加载
- (void)fetchNewData {
    [self fetchObjectsOnPage:1 refresh:YES];
}

- (void)fetchMoreData {
    [self fetchObjectsOnPage:++self.pageIndex refresh:NO];
}

/** 网络请求 */
- (void)fetchObjectsOnPage:(NSInteger)pageIndex refresh:(BOOL)refresh {
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    param[@"v2"] = @(1);
    param[@"type"] = self.type;
    param[kParamCurrentPage] = @(pageIndex);
    param[kParamPageSize] = @(self.pageSize);
    
    [Service getWithUrl:FindShareListAPI  params:param success:^(id responseObject) {
        id json = [NSData dataNamed:@"square.json"];
        RefreshResult *result = [RefreshResult mj_objectWithKeyValues:json];
        
        id data = [NSData dataNamed:@"data.json"];
        NSMutableArray *appends = [ShareListItem mj_objectArrayWithKeyValuesArray:data];
        if (result.success) {
            if (refresh) {
                self.pageIndex = 1;
                self.squares = appends;
            } else {
                [self.squares addObjectsFromArray:appends];
            }
            
            // 分页逻辑
            if (0 == self.squares.count && 1 == self.pageIndex) {
                self.collectionView.mj_footer.state = MJRefreshStateNoMoreData;
            } else if (result.entity.total == self.squares.count) {
                self.collectionView.mj_footer.state = MJRefreshStateNoMoreData;
            } else {
                self.collectionView.mj_footer.state = MJRefreshStateIdle;
            }
        }
        
       
        [self.collectionView reloadData];
        [self.collectionView.mj_header endRefreshing];
    } failure:^(NSError *error) {
        [self.collectionView.mj_header endRefreshing];
        [self.collectionView.mj_footer endRefreshing];
    }];
}

/** 点赞 */
- (void)squareLikeAtIndexPath:(NSIndexPath *)indexPath {
    // 通过索引获取数据模型和Cell
    ShareListItem *shareItem = self.squares[indexPath.item];
    SquareListCollectionCell *cell = (SquareListCollectionCell *)[self.collectionView cellForItemAtIndexPath:indexPath];
    AnimateLikeButton(cell.attentionBtn);
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[kParamShareId] = shareItem.shareId;
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    self.collectionView.mj_footer.hidden = self.squares.count == 0;
    return self.squares.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    SquareListCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellReuseID forIndexPath:indexPath];
    ShareListItem *shareItem = self.squares[indexPath.item];
    cell.shareItem = shareItem;
    
    WS(weakSelf);
    cell.likeActionBlock = ^{
        [weakSelf squareLikeAtIndexPath:indexPath];
    };
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath; {
    UIViewController *vi = [UIViewController new];
    vi.view.backgroundColor = [UIColor orangeColor];
    [self.navigationController pushViewController:vi animated:YES];
}

#pragma mark - WaterFlowLayoutDelegate
- (CGFloat)waterflowLayout:(WaterFlowLayout *)waterflowLayout heightForItemAtIndexPath:(NSIndexPath *)indexPath itemWidth:(CGFloat)width {
    ShareListItem *shareItem = self.squares[indexPath.item];
    CGFloat imgHeight = shareItem.height? : 150.f;
    CGFloat imgWidth = shareItem.width? : 150.f;
    CGFloat itemHeight = imgHeight / imgWidth * width + (IsEmptyString(shareItem.describe)? 51 : 75);
    return itemHeight;
}


@end
