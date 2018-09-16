//
//  AwFilterView.h
//  select_item
//
//  Created by 裴波波 on 2018/9/16.
//  Copyright © 2018年 裴波波. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AwFilterItem.h"

/// 多选类型
typedef NS_ENUM(NSUInteger, KSelectType) {
    /// 单选
    KSelectType_Single,
    /// 多选
    KSelectType_Muti,
};

/// 重置所有状态类型
typedef NS_ENUM(NSUInteger, KResetStatus) {
    KResetStatus_Selected,
    KResetStatus_DeSelected,
};

@interface AwFilterView : UIView

/// 选择类型(单选 or 多选)
@property (nonatomic, assign) KSelectType selectType;
/// margin
@property (nonatomic, assign) CGFloat margin;
/// 顶部边距
@property (nonatomic, assign) CGFloat marginTop;
/// 每个button的 size
@property (nonatomic, assign) CGSize size;
/// 每行多少个
@property (nonatomic, assign) NSInteger numsOfSingleLine;
/// 每选择一次返回一次所有item根据改变的item来进行操作
@property (nonatomic, copy) void(^clickBtnCallback)(NSArray <AwFilterItem *> *arrItems);
/// 是否必选一项
@property (nonatomic, assign) BOOL isForceSelect;

/// 初始化子控件
- (void)addItemsWithArr:(NSArray <AwFilterItem *>*)arr;
/// 重置所有item的状态
- (void)resetStatusWithType:(KResetStatus) type;

@end












