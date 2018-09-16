# AwFilterView
筛选框


![image](https://github.com/adampei/AwFilterView/blob/master/images/001.gif)

> 通过模型初始化视图对应的每一个选项

## 用法以及注意事项

### 初始化并加入控制器的view中

```objc
AwFilterView * filterView = [[AwFilterView alloc] initWithFrame:CGRectMake(0, 100, 300, 180)];
[self.view addSubview:filterView];
```

* 可选项是单选类型还是多选类型,通过设置属性`filterView.selectType = KSelectType_Muti;`多选,`KSelectType_Single`单选
* 设置每个选项大小,用`filterView.size = CGSizeMake(70, 30);`
* 设置每一行选项个数`filterView.numsOfSingleLine = 3;`
* 选项距离view顶部距离`filterView.marginTop = 20;`
* 选项距离view左侧距离`filterView.margin = 15;`

![image](https://github.com/adampei/AwFilterView/blob/master/images/1.png)

### 创建模型

```objc
AwFilterItem * item = [[AwFilterItem alloc] init];
// 正常状态背景颜色
item.colorBgNormal = [UIColor orangeColor];
// 选中状态背景色
item.colorBgSelected = [UIColor yellowColor];
// 标题
item.title = @"已读";
// 此选项是否被选中状态
item.isSelected = NO;
// 正常字体颜色
item.colorNormal = [UIColor blackColor];
// 选中状态字体颜色
item.colorSelected = [UIColor redColor];
```

* 还可以设置item的圆角`item.raidus = 8;`
* 设置字体大小`item.fontBtn`等

### 将模型给了filterView

```objc
[filterView addItemsWithArr:@[item, item2, item3, item4]];
```

### filterView方法

* 设置全选

```objc
[self.filterView resetStatusWithType:KResetStatus_Selected];
```

* 全部取消选择

```objc
[self.filterView resetStatusWithType:KResetStatus_DeSelected];
```

### filterView的选择模式

* 选择0个或者1个

```objc
self.filterView.selectType = KSelectType_Single;
```

* 选择0个或者多个

```objc
self.filterView.selectType = KSelectType_Muti;
```

* 只能选一个

```objc
self.filterView.isForceSelect = YES;
```

* 可以选择一个或者多个则组合一下同时设置以下两个属性

```objc
self.filterView.selectType = KSelectType_Muti;
self.filterView.isForceSelect = YES;
```

### 选择后的回调方法

* 将所有的模型回调回来, 根据回调回来的模型你可以做操作

```objc
[filterView setClickBtnCallback:^(NSArray<AwFilterItem *> *arrItems) {
    
}];
```














