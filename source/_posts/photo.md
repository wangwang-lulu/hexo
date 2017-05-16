---
title: Hexo：图片展示
date: 2017-05-01 23:56:27
categories: Hexo使用
tags:
- 软件使用
- Hexo优化

---
<img src="/images/wb4.jpg" class="full-image" />
Hexo所提供的图片展示方法始终是有限的，但是要做一个简单而优雅的网站，太多的图片展示方式，反而会显得凌乱不堪。这里记录一下图片展示的各种方法，可以为日后的图文博客做模板。
<!-- more -->
{% note primary %} 
## 首页展示
{% endnote %}
### 单个图片
这里仅介绍几种不改变主题太多的图片展示方式，更加深入的定义图片格式，修改css，请参考[为 Hexo 主题添加多种图片样式](http://wuchong.me/blog/2014/12/13/hexo-theme-creating-image-styles/)。最简单的展示方式，就是直接在markdown的标题栏里添加链接，我们用b12.jpg这个图片做个例子。
	
	<img src="/images/b12.jpg" />
如果是需要图片突破容器宽度，参照next文档，可以添加

	<img src="/images/b12.jpg" class="full-image" />
当然同样也可以使用标签方式，

	{% fullimage /images/b12.jpg, alt, title %}
	{% fi /images/b12.jpg, alt, title %}
如果你有用hexo的数据存储格式的话，就是在文章的根目录建立与markdown文件同名的文件夹，并且把图片放在里面的话，那么可以用

	{% asset_img g2.jpg This is an example image %}
这里`This is an example image`是图片的说明。
### 多张图片
如果想在首页添加多个图片，就必须在标题栏里添加

	photos:
	- /images/b7.jpg
	- /images/b6.jpg
	- /images/b5.jpg
这里有三张图，所以这三张图并排在一行。如果是两张图就是，两张图并排在一行，并且把容器填满。据我自己测试，如果是四张图的话，第四张图就会被挤到第二排，然而第二排并没有被占满，后面留下丑陋的空白。如果是六张图的话，第一排三张图，第二排三张图，全部被占满，所以请思考一下用这种方式，放几张图比较好看。

这里要注意了，以上的几种图片放置方式，都是支持fancybox的。下面要说的就是next主题内置的一个图片放置方式，不支持fancybox，但是首页显示会比较好看， 

    {% gp 4-2 %}
第一张图片的地址
第二张图片的地址
第三张图片的地址
第四张图片的地址
{% endgp %}

采用这种方式后，图片就会按照一定的方式把容器占满，当然对应不同的图片数量，可以选择不同的方式，上面的例子，可以参考本网站的博文Gallery Test。其他的图片排列方式，可以查看文件：

	..\themes\next\scripts\tags\group-pictures.js

这种放置的方式，缺点就是不能使用fancybox。而且点进文章里面后，图片的排列方式就变回原来的一行一图了，就像Gallery Test那样。下面介绍在文中展示图片的方法。
{% note primary %} 
## 文中展示
{% endnote %}
首先解决`group-picture.js`带来的问题，参考[使用Hexo基于GitHub Pages搭建个人博客](https://ehlxr.me/2016/08/30/%E4%BD%BF%E7%94%A8Hexo%E5%9F%BA%E4%BA%8EGitHub-Pages%E6%90%AD%E5%BB%BA%E4%B8%AA%E4%BA%BA%E5%8D%9A%E5%AE%A2%EF%BC%88%E4%B8%89%EF%BC%89/#%E5%85%AB%E3%80%81%E5%9B%BE%E7%89%87%E6%A8%A1%E5%BC%8F)的办法。修改

	themes\next\source\css\_common\components\tags\group-pictures.styl

中的样式为

	.page-post-detail .post-body .group-picture-column {
	  // float: none;
	  margin-top: 10px;
	  // width: auto !important;
	  img { margin: 0 auto; }
	}
这样就没问题了，文内的布局和首页的布局一模一样。当然如果你不想这样，也可以不用修改，把这篇博客作为一个纯的gallery展示也是很优雅的。但是即便是这样，记住还是不能用fancybox。而且这种布局方式，是不能隐藏在文内的，就是说不能靠添加`<!-- more -->`来在文中展示多张图，而不显示到首页。

如果你一定要在文章并排添加多张图，只好用最后的办法，手动修改图片的引用格式，我直接添加了一个图片的class。如下这么做，我先修改了

	\themes\next\source\css\_common\components\post.styl
中的样式为

	.post-body .fancybox img {
	display: block; 
	// !important;
	margin: 0 auto;
	cursor: pointer;
	cursor: zoom-in;
	cursor: -webkit-zoom-in;
	}
就是把`!important`去掉了。然后在

	\themes\next\source\css\_custom.styl
里面添加

	.img-3.img-3.img-3 {
	width: 33.3%; //一行三张，自己按百分比定义一行几张
	display: inline-block; //单行放置
	margin-bottom: -6px; //由于图片继承上一个class的底部横线，先覆盖
	background: white; //定义背景色，遮盖横线
	border: none; //去掉相框，可选
	}
然后我们的引用图片格式是

    <img src="/images/wb4.jpg" class="img-3" />

效果如下：
一张图
<img src="/images/wb4.jpg" class="img-3" />

三张图
<img src="/images/wb4.jpg" class="img-3" /><img src="/images/wb4.jpg" class="img-3" /><img src="/images/wb4.jpg" class="img-3" />

这样一行可以放置多个图片，也可以用fancybox了，比如可以在游记后面堆一些图，不用每张都是高清大图。另外要提一下的是，这里没有定义`max-height`，所以如果图片比例不一样，一行的图片会有高低不平，解决办法是：别搞一些比例奇怪的图放在一起。即使你在电脑上浏览正常，到了手机还是会出问题。

关于多张图片放置问题，更深入的修改就不知道，毕竟我的初衷不是做一个技术博客。当然如果你如只想一行放一张图，那就参考第一部分的首页展示一张图的放置方式吧。

{% note danger %} 
**本文作者**： Lu Wang
**版权声明**： 本博客所有文章除特别声明外，均采用 [CC BY-NC-SA 3.0](https://creativecommons.org/licenses/by-nc-sa/3.0/cn/) 许可协议。转载请注明出处！
{% endnote %}