---
title: 在Github Pages部署Html5幻灯片
date: 2017-09-20 23:56:27
categories: 学术技术
feature: /images/b16.jpg
tags:
- 软件使用


---
<img src="/images/b16.jpg" class="img-1f" />

上课需要一种幻灯片，可以方便的展示代码，可以编辑数学公式，可以用markdown编辑，可以在网页上方便的浏览，也可以线下浏览。这里介绍一个“黑科技”，将幻灯片部署在我的个人主页上。

<!-- more -->
{% note primary %} 
### Reveal.js
{% endnote %}
Reveal.js绝对是幻灯片界的黑科技，可以看看它的[Demo](http://lab.hakim.se/reveal-js/#/)，还有它的[介绍文档](https://github.com/hakimel/reveal.js/)，感觉实在有点炫酷。

这里仅介绍怎么将幻灯片部署到我的个人主页上，具体怎么做幻灯片，参考一下介绍文档就可以了。


{% note primary %} 
### 设置方法
{% endnote %}
#### 1. 创建一个新的respository
比如取名为test，然后在本地比如说D盘打开git bash，clone这个respository到本地，输入

	git clone https://github.com/user/test.git

user就是你用户名咯。

#### 2. 创建gh-pages branch
在你刚才创建的文件夹D:/test打开git bash，输入

	git checkout --orphan gh-pages

这样你的gh-pages分支就创建好了。

#### 3. 上传reveal.js到branch
从[reveal.js](https://github.com/hakimel/reveal.js/)把文件下载下来，编辑index.html文件（这个就是你的幻灯片），然后全部拷贝到刚才的test文件夹，输入

	git add .
	git commit -m "1st commit"
	git push origin gh-pages
输入你账户的用户名和密码就搞定了！接下来试着访问一下 user.github.io/test，就可以访问幻灯片了。也可以下载下来，直接查看index.html，或者生成PDF文件。

至于具体怎么修改幻灯片，可以好好研究一下。

{% note danger %} 
**本文作者**： Lu Wang
**版权声明**： 本博客所有文章除特别声明外，均采用 [CC BY-NC-SA 3.0](https://creativecommons.org/licenses/by-nc-sa/3.0/cn/) 许可协议。转载请注明出处！
{% endnote %}