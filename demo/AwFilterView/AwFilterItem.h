//
//  AwFilterItem.h
//  select_item
//
//  Created by 裴波波 on 2018/9/16.
//  Copyright © 2018年 裴波波. All rights reserved.
//  AwFilterView的数据模型,用于初始化按钮状态

#import <UIKit/UIKit.h>

@interface AwFilterItem : NSObject

/// 标题
@property (nonatomic, copy) NSString *title;
/// 是否被选中
@property (nonatomic, assign) BOOL isSelected;
/// 未选中字体颜色
@property (nonatomic, strong) UIColor *colorNormal;
/// 选中字体颜色
@property (nonatomic, strong) UIColor *colorSelected;
/// 未选中背景图
@property (nonatomic, strong) UIImage *imgNormal;
/// 选中背景图
@property (nonatomic, strong) UIImage *imgSelected;
/// 未选中背景色
@property (nonatomic, strong) UIColor *colorBgNormal;
/// 选中背景色
@property (nonatomic, strong) UIColor *colorBgSelected;
/// 圆角大小 默认无圆角
@property (nonatomic, assign) CGFloat raidus;
/// 字体大小
@property (nonatomic, assign) CGFloat fontBtn;

@end
