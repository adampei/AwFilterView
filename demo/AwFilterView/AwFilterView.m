//
//  AwFilterView.m
//  select_item
//
//  Created by 裴波波 on 2018/9/16.
//  Copyright © 2018年 裴波波. All rights reserved.
//

#import "AwFilterView.h"

@interface AwFilterView ()
/// button数组
@property (nonatomic, strong) NSMutableArray *arrM;
/// 当前选中的btn对应的item
@property (nonatomic, strong) AwFilterItem * itemSelected;
/// items数组
@property (nonatomic, strong) NSArray *arrItems;
@end

@implementation AwFilterView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.arrM = @[].mutableCopy;
    }
    return self;
}

- (void)addItemsWithArr:(NSArray <AwFilterItem *>*)arr {
    
    self.arrItems = arr;
    for (int i = 0; i<arr.count; i++) {
        AwFilterItem * item = arr[i];
        UIButton *btn = [self createBtnWithItem:item];
        btn.tag = i;
        [self addSubview:btn];
        [self.arrM addObject:btn];
        [btn addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    [self makeConstrains];
}

- (void)makeConstrains{
    
    CGFloat sWidth = self.bounds.size.width;
    CGFloat leftMargin = self.margin;
    CGFloat middleMargin = (sWidth - self.numsOfSingleLine * self.size.width - 2 * self.margin) / (self.numsOfSingleLine - 1) * 1.0;
    for (int i = 0; i < self.arrM.count; i++) {
        
        // 行
        NSInteger j = i / self.numsOfSingleLine;
        UIButton * btn = (UIButton *)self.arrM[i];
        btn.frame = CGRectMake(leftMargin + (i - j * self.numsOfSingleLine) * (self.size.width + middleMargin), self.marginTop + j * (self.size.height + self.marginTop), self.size.width, self.size.height);
    }
}


- (UIButton *)createBtnWithItem:(AwFilterItem *)item{
    
    UIButton * btn = [UIButton new];
    [btn setTitle:item.title forState:UIControlStateNormal];
    [btn setTitleColor:item.colorNormal forState:UIControlStateNormal];
    [btn setTitleColor:item.colorSelected forState:UIControlStateSelected];
    [btn setBackgroundImage:item.imgNormal forState:UIControlStateNormal];
    [btn setBackgroundImage:item.imgSelected forState:UIControlStateSelected];
    btn.selected = item.isSelected;
    btn.adjustsImageWhenHighlighted = NO;// 取消选中变暗
    if (item.isSelected) {
        self.itemSelected = item;
    }
    if (item.raidus) {
        btn.layer.cornerRadius = item.raidus;
        btn.layer.masksToBounds = YES;
    }
    if (item.fontBtn) {
        btn.titleLabel.font = [UIFont systemFontOfSize:item.fontBtn];
    }
    if (item.colorBgNormal) {
        [btn setBackgroundImage:[self imageFromColor:item.colorBgNormal size:self.size] forState:UIControlStateNormal];
    }
    if (item.colorBgSelected) {
        [btn setBackgroundImage:[self imageFromColor:item.colorBgSelected size:self.size] forState:UIControlStateSelected];
    }
    
    return btn;
}

- (void)clickButton:(UIButton *)sender {
    
    AwFilterItem * currItem = self.arrItems[sender.tag];
    if (self.selectType == KSelectType_Single) {
        
        if (self.itemSelected == currItem) {
            // 选中同一个item
            self.itemSelected.isSelected = !self.itemSelected.isSelected;
        }else{
            // 选中不通item
            self.itemSelected.isSelected = NO;
            self.itemSelected = currItem;
            currItem.isSelected = YES;
        }
        
    }else if(self.selectType == KSelectType_Muti){
        // 多选不做限制只是取反
        currItem.isSelected = !currItem.isSelected;
    }
    [self update];
    if (self.clickBtnCallback) {
        self.clickBtnCallback(self.arrItems);
    }
}


- (void)update {
    
    for (int i = 0; i< self.arrItems.count; i++) {
        AwFilterItem * item = self.arrItems[i];
        UIButton * btn = self.arrM[i];
        btn.selected = item.isSelected;
    }
}

- (void)resetStatusWithType:(KResetStatus) type{
    
    BOOL isSelected = type == KResetStatus_Selected ? YES : NO;
    for (int i = 0; i< self.arrItems.count; i++) {
        AwFilterItem * item = self.arrItems[i];
        item.isSelected = isSelected;
    }
    [self update];
}

// 根据颜色生成图片
- (UIImage*)imageFromColor:(UIColor*)color size:(CGSize)size
{
    CGRect rect=CGRectMake(0.0f, 0.0f, size.width,size.height);
    UIGraphicsBeginImageContext(size);//创建图片
    CGContextRef context = UIGraphicsGetCurrentContext();//创建图片上下文
    CGContextSetFillColorWithColor(context, [color CGColor]);//设置当前填充颜色的图形上下文
    CGContextFillRect(context, rect);//填充颜色
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}




@end









