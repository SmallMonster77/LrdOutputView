# LrdOutputView
仿微信，QQ弹出菜单视图，封装好，易调用

效果如图:<br>
![](http://lrdup888.qiniudn.com/%E5%BC%B9%E5%87%BA%E8%8F%9C%E5%8D%95.gif)

## 使用方法<br>
```Objective-C
_outputView = [[LrdOutputView alloc] initWithDataArray:self.dataArr origin:CGPointMake(x, y) width:125 height:44 direction:kLrdOutputViewDirectionRight];
_outputView.delegate = self;
_outputView.dismissOperation = ^(){
    //设置成nil，以防内存泄露
    _outputView = nil;
};
[_outputView pop];
```

具体方法请看Demo

喜欢就给颗星呗~ 

我的博客地址:[我的博客](http://www.lrdup.net "键盘上的舞者")
