# AwFilterView
筛选框


![image](https://github.com/adampei/AwFilterView/blob/master/images/Untitled.gif)

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


