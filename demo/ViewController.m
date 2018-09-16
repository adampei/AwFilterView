//
//  ViewController.m
//  demo
//
//  Created by 裴波波 on 2018/9/16.
//  Copyright © 2018年 裴波波. All rights reserved.
//

#import "ViewController.h"
#import "AwFilterView.h"


@interface ViewController ()

@property (nonatomic, strong) AwFilterView * filterView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    AwFilterItem * item = [[AwFilterItem alloc] init];
    
    item.colorBgNormal = [UIColor orangeColor];
    item.colorBgSelected = [UIColor yellowColor];
    
    item.title = @"已读";
    item.isSelected = NO;
    item.colorNormal = [UIColor blackColor];
    item.colorSelected = [UIColor redColor];
    
    AwFilterItem * item2 = [[AwFilterItem alloc] init];
    item2.colorBgNormal = [UIColor orangeColor];
    item2.colorBgSelected = [UIColor yellowColor];
    item2.title = @"未读";
    item2.isSelected = NO;
    item2.colorNormal = [UIColor blackColor];
    item2.colorSelected = [UIColor redColor];
    
    AwFilterItem * item3 = [[AwFilterItem alloc] init];
    item3.colorBgNormal = [UIColor orangeColor];
    item3.colorBgSelected = [UIColor yellowColor];
    item3.title = @"全部";
    item3.isSelected = NO;
    item3.colorNormal = [UIColor blackColor];
    item3.colorSelected = [UIColor redColor];
    
    AwFilterItem * item4 = [[AwFilterItem alloc] init];
    item4.colorBgNormal = [UIColor orangeColor];
    item4.colorBgSelected = [UIColor yellowColor];
    item4.title = @"新闻";
    item4.raidus = 8;
    item4.isSelected = NO;
    item4.colorNormal = [UIColor blackColor];
    item4.colorSelected = [UIColor redColor];
    
    AwFilterView * filterView = [[AwFilterView alloc] initWithFrame:CGRectMake(0, 100, 300, 180)];
    self.filterView = filterView;
    filterView.selectType = KSelectType_Muti;
    filterView.backgroundColor = [UIColor cyanColor];
    filterView.size = CGSizeMake(70, 30);
    [filterView setClickBtnCallback:^(NSArray<AwFilterItem *> *arrItems) {
        
    }];
    filterView.numsOfSingleLine = 3;
    filterView.margin = 15;
    filterView.marginTop = 20;
    [filterView addItemsWithArr:@[item, item2, item3, item4]];
    [self.view addSubview:filterView];
}

/// 全选
- (IBAction)clickSelectAllbtn:(id)sender {
    
    [self.filterView resetStatusWithType:KResetStatus_Selected];
}

/// 全部取消选中
- (IBAction)clickDeselectedBtn:(id)sender {
    
    [self.filterView resetStatusWithType:KResetStatus_DeSelected];
}

/// 是否支持多选
- (IBAction)ciickIsMutiSelectSwitch:(UISwitch *)sender {
    
    if (sender.isOn) {
        // 多选
        [self.filterView resetStatusWithType:KResetStatus_DeSelected];
        self.filterView.selectType = KSelectType_Muti;
    }else{
        // 单选
        [self.filterView resetStatusWithType:KResetStatus_DeSelected];
        self.filterView.selectType = KSelectType_Single;
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
