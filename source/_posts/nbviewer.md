---
title: nbviewer分享Jupyter Notebook
date: 2019-03-22 16:20:36
categories: 软件使用
---

<img src="/images/b92.jpg"/>

Jupyter是将代码与写作结合的神器。如果只是自己跟自己玩，随便用个编程软件就欧了。但是既然都用上Jupyter了，说明要分享，记录一下怎么用github+nbviewer分享。

<!-- more -->

#### 1. 创建一个新的respository
比如取名为test，然后在本地比如说D盘打开git bash，clone这个respository到本地，输入
{% codeblock %}
	git clone https://github.com/user/test.git
{% endcodeblock %}
user就是你用户名咯 (我这里是wangwanglulu)
![](/images/nb/nb1.png)

#### 2. 上传你的.ipynb文件到你刚才创建的respository
上传就是基本的git操作了
{% codeblock %}
	git add .
	git commit -m "first"
	git push origin master
{% endcodeblock %}

#### 3. 复制链接
在网页登陆GitHub，打开你刚才创建的respository里的.ipynb文件，复制浏览器里显示的网址。 比如说我的是
![](/images/nb/nb2.png)
粘贴到[nbviewer](https://nbviewer.jupyter.org/)
![](/images/nb/nb3.png)
回车就能看到生成的分享网页了。如果你要分享的话，就把这个网页的地址粘出去就OK了！

#### 4. 网上编辑
如果你点击 Execute on Binder就能直接在网上运行Jupyter Notebook了，很神奇但是要耐心等一下。
![](/images/nb/nb4.png)

最后，其实也有别的方法分享，比如生成html文件，然后上传到github，或者直接上传Python代码文件。但是偶觉得上面这个方法是值得推荐的。
