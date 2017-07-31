//
//  SquareViewController.m
//  SquareList
//
//  Created by 海润 on 2017/7/22.
//  Copyright © 2017年 Speed. All rights reserved.
//

#import "SquareViewController.h"
#import "SquareListViewController.h"
#import "HeaderFile.h"

@interface SquareViewController ()

@end

@implementation SquareViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.showOnNavigationBar = YES;
    self.titleColorNormal = [UIColor grayColor];
    self.titleColorSelected = [UIColor redColor];
    
    self.navigationController.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"完成" style:UIBarButtonItemStylePlain target:self action:@selector(xxx)];
}

- (void)xxx {
    
}

#pragma mark - private method
- (NSArray<NSString *> *)titles {
    return @[@"Star", @"关注", @"最新"];
}

- (NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController {
    return 3;
}

- (UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index {
    switch (index) {
            case 0: {
                SquareListViewController *latestVc = [[SquareListViewController alloc] init];
                latestVc.type = kParamSquareNew;
                return latestVc;
            }
            case 1: {
                SquareListViewController *latestVc = [[SquareListViewController alloc] init];
                latestVc.type = kParamSquareNew;
                return latestVc;
            }
            break;
            case 2: {
                SquareListViewController *nearVc = [[SquareListViewController alloc] init];
                nearVc.type = kParamSquareNew;
                return nearVc;
            }
            break;
        default:
            return [UIViewController new];
            break;
    }
}

- (CGRect)pageController:(WMPageController *)pageController preferredFrameForMenuView:(WMMenuView *)menuView {
    menuView.backgroundColor = [UIColor clearColor];
    return CGRectMake(60, 0, self.view.frame.size.width - 120, 44);
}

- (CGRect)pageController:(WMPageController *)pageController preferredFrameForContentView:(WMScrollView *)contentView {
    return CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - self.tabBarController.tabBar.frame.size.height);
}


@end
