---
title: 网站搬家
date: 2017-04-27 23:56:27
categories: Special Pages
tags:
- 技术备忘

---
<img src="/images/b10.jpg" class="full-image" />
这个next主题被我改得连它亲妈都不认识了，中间的修改参考了很多别人的文章。这里记录一下我在参考了众多文献后的搬家过程，具体怎么弄也可以到知乎去搜索。
### 上传本地文件
直接在网页里，新建了一个仓库，取名为`hexo`。用github desktop将`hexo`仓库clone到本地。这里我先备份了所有的生成网页的源文件，然后拷贝所有文件到clone文件夹。

在根目录中有一个文件名为`.gitignore`，里面记录了所有不会被上传的文件夹。其中有些文件是没有必要被上传，纯粹拖慢速度，比如说`node_modules`，`public`(这个网站我没有用`hexo d`，所以没有deploy的文件夹)。这个时候要注意了，如果不在根目录添加一个文件`.gitmodules`，主题里面的next文件夹是不会被上传的。这个时候手动添加该文件，内容如下：

	[submodule "themes/next"]
	path = themes/next
	url = https://github.com/iissnan/hexo-theme-next

然后就可以在github desktop里面commit了再上传到github。

### 持续集成
我这里没有添加`hexo-deployer-git --save`，因为觉得这种更新方式太麻烦了。我是利用Appveyor的持续集成方法，具体的可以参考的的[Hexo的版本控制与持续集成](https://formulahendry.github.io/2016/12/04/hexo-ci/)，作者formulahendry。

### 另一台电脑上的操作
首先下载Node.js，并且安装。在新电脑上，在随便一个目录里，用git bash输入`npm install hexo-cli -g`安装hexo。打开你在新电脑上安装的github desktop，clone你的hexo仓库到本地另外一个文件夹。这个仓库里的文件是没法编译的，你缺的就是`node_modules`这个文件夹，所以拷贝刚才那个文件夹里生成的`node_modules`文件夹到你hexo仓库的根目录。然后在git bash里切换到你hexo仓库的文件夹，使用`npm install`进行模块安装，不要用`hexo init`。你可能要安装下面这些东西：

	npm install hexo-tag-aplayer --save
	npm install hexo-tag-dplayer --save
	npm install hexo-util --save
还有什么，我想起来再添加。