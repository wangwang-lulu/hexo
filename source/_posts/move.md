---
title: 网站搬家
date: 2017-04-27 23:56:27
categories: Hexo使用
tags:
- 软件使用
- Hexo优化

---
<img src="/images/wb1.jpg" class="full-image" />
这个next主题被我改得太多了，中间的修改参考了很多别人的文章。这里记录一下我在参考了众多文献后的搬家过程，具体怎么弄也可以到知乎去搜索。
<!-- more -->
## 上传本地文件
直接在网页里，新建了一个仓库，取名为`hexo`。用github desktop将`hexo`仓库clone到本地。这里我先备份了所有的生成网页的源文件，然后拷贝所有文件到clone文件夹。

在根目录中有一个文件名为`.gitignore`，里面记录了所有不会被上传的文件夹。其中有些文件是没有必要被上传，纯粹拖慢速度，比如说`node_modules`，`public`(这个网站我没有用`hexo d`，所以没有deploy的文件夹)。这个时候要注意了，如果不在根目录添加一个文件`.gitmodules`，主题里面的next文件夹是不会被上传的。这个时候手动添加该文件，内容如下：

	[submodule "themes/next"]
	path = themes/next
	url = https://github.com/iissnan/hexo-theme-next

然后就可以在github desktop里面commit了再上传到github。

## 持续集成
我这里没有添加`hexo-deployer-git --save`，因为觉得这种更新方式太麻烦了。我是利用Appveyor的持续集成方法，具体的可以参考[Hexo的版本控制与持续集成](https://formulahendry.github.io/2016/12/04/hexo-ci/)。其实，如果你用了Appveyor，而且在新电脑上只是想添加几篇文章的话，在新电脑上直接用github desktop更新你的source文件夹就足够了。同理，可以用手机直接登录github的网页添加修改博客，随时随地写博客。但是如果你还想继续调试hexo，或者添加一些其他的功能的话，请继续往下看。

## 另一台电脑上的操作
下载Node.js，并且安装。在新电脑上，在任意一个目录里创建名为`hexo`的文件夹，在里面安装hexo，在该目录下用git bash输入

	npm install hexo-cli -g
	npm install -g hexo
	npm update hexo -g

然后，打开你在新电脑上安装的github desktop，clone你的hexo仓库到刚才创建的`hexo`文件夹。比如说你在`d:/hexo`这个文件夹，那你就clone到`d:/`。这个仓库里的文件是没法生成网页的，你缺的就是`node_modules`这个文件夹，所以输入`npm install`，最后测试输入`hexo g`，成功的话就可以用了。

另外，如果最后那个`npm install`用了之后还是无法成功，你可能要额外安装你自己曾经添加过的模块了，比如下面这些东西：

	npm install hexo-tag-aplayer --save
	npm install hexo-tag-dplayer --save
	npm install hexo-util --save
	npm install hexo-tag-cloud --save
还有什么，我想起来再添加。

{% note danger %} 
**本文作者**： Lu Wang
**本文链接**： http://wangwanglulu.com/2017/04/27/move/
**版权声明**： 本博客所有文章除特别声明外，均采用 [CC BY-NC-SA 3.0](https://creativecommons.org/licenses/by-nc-sa/3.0/cn/) 许可协议。转载请注明出处！
{% endnote %}