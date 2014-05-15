# 如何导入外部Git仓库到中国源代码托管平台（Git@OSC）

针对最近有很多网友提问，如何导入外部代码仓库（Github、bitbucket、Google Code等等）到Git@OSC ，给出如下解决方案：

## 方案1
从原始地址clone一份bare仓库

1. `git clone --bare  https://github.com/bartaz/impress.js.git` （例子）  
在Git@OSC上创建一个项目（http://git.oschina.net/projects/new）  
这里注意，不要勾选使用Readme初始化项目，不要选择项目的授权协议和.gitignore 文件，因为这些会导致项目有第一个提交。

1. 记下新建项目后的地址，推荐使用http或者ssh方式皆可，大项目推荐ssh方式。  
`cd impress.js.git`  
`git push --mirror git@git.oschina.net:username/impress-js.git`  
此命令执行完成后即完成导入，删除 impress.js.git 文件夹即可。

## 方案2
此方案，手头已经有了项目的完成仓库，则无需再从第三方代码托管平台上clone下来。

1. 到Git@OSC上创建项目，同样不要选择以上所说的三项。

1. 命令行进入项目目录，git status 确保项目状态为：  
`nothing to commit, working directory clean`  
如果状态不是这样，则需要通过提交、暂存等操作，使项目当前状态为clean。

1. 添加Git@OSC的remote  
`git remote add git-osc git@git.oschina.net:username/translate4j.git`  

1. 推送所有分支和tags  
`git push git-osc --all`  
`git push git-osc --tags`  
以上两条命令执行完毕，即完成导入。

## 方案3
此方案针对导入已有的SVN仓库

1. 同上，先新建项目，不要选择以上所说的三项

1. 使用git-svn工具clone svn仓库，git-svn 已经是Git的默认组建，如果你安装的是较新版本的Git客户端的话，则不需要再单独下载这个组件  
`git svn clone http://translate4j.googlecode.com/svn/trunk/ translate4j`  

1. 同样，进入项目目录，添加remote  
`git remote add git-osc git@git.oschina.net:username/impress.js.git`

1. 同样，推送所有分支和标签  
`git push git-osc --all`  
`git push git-osc --tags`  
以上两条命令执行完毕，即推送完成