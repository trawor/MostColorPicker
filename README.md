这是一个UIImage的helper. 可以实现类似iTunes11里的封面动态背景颜色效果

大概原理是:  

1. 把图片缩小 加快计算速度  
2. 得到每个点的RGBA
3. 找出出现最多的那个颜色

与iTunes的颜色**不尽相同**. 因为iTunes里图片是放在最右边了 所以只取了最左边的一部分像素. 


可以通过微博跟我交流 [@trawor](http://weibo.com/trawor)


效果:

![](http://media.tumblr.com/7e9edf006e8d5ae92f9252284c862de6/tumblr_inline_mnsqpgGSyw1qz4rgp.png)
![](http://media.tumblr.com/8d39b8ee7004b68f228195e14751f80c/tumblr_inline_mnsqq26JKX1qz4rgp.png)


