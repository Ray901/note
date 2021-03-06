[git官方教程](http://git-scm.com/book/zh/%E8%B5%B7%E6%AD%A5-%E5%85%B3%E4%BA%8E%E7%89%88%E6%9C%AC%E6%8E%A7%E5%88%B6)

[廖雪峰的git 教程](http://www.liaoxuefeng.com/wiki/0013739516305929606dd18361248578c67b8067c8c017b000/001375840202368c74be33fbd884e71b570f2cc3c0d1dcf000)

添加密钥, 参见[bash](./bash.md) 中的ssh部分

在日常的git操作中,git checkout,是我们的常用命令,既可以是某一个具体的commit hash值,也可以是某个分支名称, 还可以是tag名称

- `git fetch origin branch1:branch2`: 将远程分支branch1 拉到本地作为branch2
- `git add -p <file>` 把对某个文件的修改添加到下次提交中

## git cherry-pick. 
What git cherry-pick does, basically, is take a commit from somewhere else, and "play it back" wherever you are right now. 
Because this introduces the same change with a different parent, Git builds a new commit with a different ID.

实际问题: 在本地 master 分支上做了一个commit(38361a68138140827b31b72f8bbfd88b3705d77a), 如何把它放到本地 old_cc 分支上?
```
$ git checkout old_cc
$ git cherry-pick 38361a68138140827b31b72f8bbfd88b3705d77a
如果顺利, 就会正常commit
如果出现冲突, 像解决git merge 一样解决就行了
```

## git stash
Stash the changes in a dirty working directory away

The modifications stashed away by this command can be 

- listed with `git stash list`, 
- inspected with `git stash show`
- restored (potentially on top of a different commit) with `git stash apply`. 

Calling git stash without any arguments is equivalent to `git stash save`.
A stash is by default listed as "WIP on branchname …", but you can give a more descriptive message on the command line when you create one.

The latest stash you created is stored in refs/stash; 
older stashes are found in the reflog of this reference and can be named using the usual reflog syntax 
(e.g. stash@{0} is the most recently created stash, stash@{1} is the one before it, stash@{2.hours.ago} is also possible).

- git stash: 备份当前的工作区的内容,从最近的一次提交中读取相关内容,让工作区保证和上次提交的内容一致.同时,将当前的工作区内容保存到Git栈中
- git stash pop: 从Git栈中读取最近一次保存的内容,恢复工作区的相关内容.由于可能存在多个Stash的内容,所以用栈来管理,pop会从最近的一个stash中读取内容并恢复
- git stash list: 显示Git栈内的所有备份,可以利用这个列表来决定从那个地方恢复
- git stash clear: 清空Git栈

把当前分支中未提交的修改移动到其他分支
```
git stash
git checkout branch2
git statsh pop
```

## git tag
- `git tag` 列出现有标签的命令非常简单
- `git tag -l 'v1.4.2.\*'` // 匹配标签
- `git tag -a v1.4 -m 'my version 1.4'`  // 含附注标签
- `git show v1.4`
- `git push origin v1.5`
- `git pull/push origin --tags`
- `git tag -d v1.5`: 删除本地tag
- `git push origin :refs/tags/v1.5`: 删除远程的tag

Git 使用的标签有两种类型:轻量级的(lightweight)和含附注的(annotated).

- 轻量级标签(-lw)就像是个不会变化的分支,实际上它就是个指向特定提交对象的引用.
- 含附注标签(-a),实际上是存储在仓库中的一个独立对象,它有自身的校验和信息,包含着标签的名字,电子邮件地址和日期,以及标签说明,
标签本身也允许使用 GNU Privacy Guard (GPG) 来签署或验证.

一般我们都建议使用含附注型的标签,以便保留相关信息:当然,如果只是临时性加注标签,或者不需要旁注额外信息,用轻量级标签也没问题

## git log
- `git log -p filename`: 显示该文件每次提交的diff
- `git log filename`: 可以看到该文件相关的commit记录
- `git blame filename`: 谁, 在什么时间, 修改了文件的什么内容
- `git show commit-id`: 根据commit-id查看某个提交
- `git show commit-id filename`: 查看某次提交中的某个文件变化

## git grep
- git grep "hello" 从当前目录的所有文件中搜索
- git grep "hello" v2.5 在某一版本中搜索

## 合并与重置
- `git merge <branch>` 将分支合并到当前HEAD中:
- `git rebase <branch>` 将当前HEAD版本重置到分支中(请勿重置已发布的提交!)
- `git rebase --abort` 退出重置
- `git rebase --continue` 解决冲突后继续重置:

## 撤销
- `git reset --hard HEAD` 放弃工作目录下的所有修改:
- `git reset HEAD` 移除缓存区的所有文件(i.e. 撤销上次git add):
- `git checkout HEAD <file>` 放弃某个文件的所有本地修改:
- `git revert <commit>` 重置一个提交(通过创建一个截然不同的新提交)
- `git reset --hard <commit>` 将HEAD重置到指定的版本,并抛弃该版本之后的所有修改, git log 看不到这个commit 之后的commits, 但是git reflog 可以看到
- `git reset <commit>` 将HEAD重置到上一次提交的版本,并将之后的修改标记为未添加到缓存区的修改:
- `git reset --keep <commit>` 将HEAD重置到上一次提交的版本,并保留未提交的本地修改:

[How do I revert master branch to a tag in git?](https://stackoverflow.com/questions/6872223/how-do-i-revert-master-branch-to-a-tag-in-git)

1. `git checkout master`
1. `git reset --hard tag_ABC`
1. `git push --force origin master`

## patch 补丁
例如，我们想导出历史上的某个commit之后的所有commits为一序列的补丁序列，那么可以这么做。
```bash
$ git log | grep ^commit | head -5
commit a11c7fd5839ddac9a19edadc245522f606a9e067
commit a718cbdc3ea9c72e05dd3beb5c58bfac91fe1a76
commit b5345a1b077259958fa56cb7c4dea82694214247
commit 380f57ad3157b644bb822995dcd85d73504a75d8
commit 68a0c4b66d619f816ded5b83f5e8c526e43bdf3e
$ git format-patch 68a0c4b66d619f816ded5b83f5e8c526e43bdf3e
$ git am 68a0c4b66d619f816ded5b83f5e8c526e43bdf3e    ## 应用patch
```

# repo
## Create repo
创建 git 仓库

	mkdir projet
	cd projet
	git init
	touch README.md
	git add README.md
	git commit -m "first commit" 
	git remote add origin git@git.oschina.net:eric_uni/projet.git 
	git push -u origin master

已有项目?

	cd projet
	git remote add origin git@git.oschina.net:eric_uni/projet.git 
	git push -u origin master

Git Stripspace

- 去掉行尾空白符
- 多个空行压缩成一行
- 必要时在文件末尾增加一个空行
- 使用此命令时必须传入一个文件,像这样:
```
$ git stripspace < README.md
```

提交空的改动
```
git commit -m "Big-ass commit" --allow-empty
```
这样做在如下几种情况下是有意义的:

- 标记一批工作或一个新功能的开始.
- 记录你对项目进行了跟代码无关的改动.
- 跟使用你仓库的其他人交流.
- 作为仓库的第一次提交,因为第一次提交日后是不能被rebase的: git commit -m "init repo" --allow-empty.

在任意diff页面的URL后加上?w=1,可以去掉那些只是空白字符的变化,使你能更专注于代码的变化
在diff或者file页面的URL后面加上?ts=4,这样当显示tab字符的长度时就会是4个空格的长度,不再是默认的8个空格.ts后面的数字还可以根据你个人的偏好进行修改.不过,在在Gists页面和raw file页面不起作用
查看某个用户的所有提交历史,只需在commits页面URL后加上?author=username.

当你点击某个仓库的分支(Branches)选项卡时
```
https://github.com/{user}/{repo}/branches
```
你会看到一个包含所有未合并的分支的列表.

有的时候我们需要将多个分支与一个非主分支(master)进行对比,此时可以通过在URL后加入要比较的分支名来实现:
```
https://github.com/{user}/{repo}/branches/{branch}
```
可以在URL后加上?merged=1来查看已经合并了的分支.

如果我们想要比较两个分支,可以像下面一样修改URL:
```
https://github.com/user/repo/compare/{range}
其中{range} = master...4-1-stable
```
例如:
```
https://github.com/rails/rails/compare/master...4-1-stable
https://github.com/rails/rails/compare/master@{1.day.ago}...master
https://github.com/rails/rails/compare/master@{2014-10-04}...master
这样你就能查看master分支上一段时间或者指定日期内的改动.
```

# FAQ
## 撤销操作
1. 运行了`git add`, 但是还没有运行`git commit`, 可以执行下面的两个方法:

	- `git rm --cached <added_file_to_undo>`
	- `git reset .`: (to undo my entire initial add), 修改的文件还将处于修改的状态

1. 错误提交了一个commit, 需要把它撤销掉, **只适用于刚提交的commit**

	1. `git reset --hard <commit_id>`  ##  commit_id 为这个commit 之前的一个commit_id, 可以使用`HEAD~1` 表示刚刚commit 的 commit_id
	1. `git push origin HEAD --force`
之后, 修改的内容也会别擦除, 所以操作之前需要先保存修改的结果.

1. Checkout all files except one.  
When I do a git status, I see files like this:

		modified:  dir/A/file.txt
		modified:  dir/B/file.txt
		modified:  dir/C/file.txt
		modified:  dir/D/file.txt
What I want to do is to discard changes to all files EXCEPT for dir/C/file.txt
操作步骤:

	1. git add dir/C/file.txt # this file will stay modified and staged
	1. git checkout .

1. commit 之后发现commit的message有错误  
`git commit --amend`: lets you edit the previous commit message

1. commit 之后想起忘了add 另外一个修改的文件  
操作步骤如下

		# Edit hello.py and main.py
		git add hello.py
		git commit
		
		# Realize you forgot to add the changes from main.py
		git add main.py
		git commit --amend --no-edit

## 分支操作
1. Using git in two computers, after merging one branch a into master with computer c1, delte the branch a in c1 both locally and remotely,
switch to computer c2, delelte the branch a locally, and want to delete the branch a remotely in c2, 
but an error is reported, as the remote branch a has been deleted by computer c1, so what should I do to clean the branch status in computer c2?  
original branch status:

		[eric@iis ntop]$ git branch -a
		* master
		  note
		  remotes/origin/HEAD -> origin/master
		  remotes/origin/master
		  remotes/origin/note
note branch 是在其他机器上删除的一个分支

	1. `$ git branch -d note`: delete the branch locally
	1. `$ git remote prune origin`: clean the remote branch status
	1. `$ git remote set-head origin -a`: query the remote and automatically set the origin/HEAD pointer to the remote current branch.
	1. `$ git remote set-head origin -d`: delete the origin/HEAD symbolic ref

1. 比如你同事在Git的remote branch中新增branch xxx, 但是你发现在本地中查看存在的branch时, 并看不到他增加的branch, `git fetch` 可以将远程新的分支拉到本地


# git config
## [Using ssh over https](https://help.github.com/articles/using-ssh-over-the-https-port/)
有时, 由于众所周知的原因, 无法进行ssh 连接, 可以让ssh 通过https

1. To test if SSH over the HTTPS port is possible, run this SSH command:

	```
	$ ssh -T -p 443 git@ssh.github.com
	# Hi username! You have successfully authenticated, but GitHub does not provide shell access.
	```
If that worked, great!
1. Enabling SSH connections over HTTPS

	```
	[eric@alien ~]$ cat .ssh/config
	Host github.com
		Hostname ssh.github.com
			Port 443
	```
1. verification

	```
	$ ssh -T git@github.com
	# Hi username! You have successfully authenticated, but GitHub does not provide shell access.
	```

## [GIT更新fork出来的代码](http://blog.sina.com.cn/s/blog_411fed0c0102vhlb.html)
1. 增加远程分支: `git remote add source https://github.com/antirez/redis.git`
	如果你运行命令:git remote -v你会发现多出来了一个source的远程分支.如下:

	```
	origin	git@github.com:ericuni/redis.git (fetch)
	origin	git@github.com:ericuni/redis.git (push)
	source	https://github.com/antirez/redis.git (fetch)
	source	https://github.com/antirez/redis.git (push)
	```
	.git/config 中remote 的部分会变为:

	```
	[remote "origin"]
		url = git@github.com:ericuni/redis.git
		fetch = +refs/heads/*:refs/remotes/origin/*
	[remote "source"]
		url = https://github.com/antirez/redis.git
		fetch = +refs/heads/*:refs/remotes/source/*
	```
1. 把对方的代码拉到你本地: `git fetch source`
1. 合并对方的代码: `git merge source/master`
1. 把最新的代码推送到你的github上: `git push origin master`

## [git 给远程库添加多个url地址](http://my.oschina.net/shede333/blog/299032)
修改.git/config 中 url 部分

```
[remote "origin"]
	url = git@github.com:ericuni/note.git
	url = git@git.oschina.net:ericuni/note.git
	fetch = +refs/heads/*:refs/remotes/origin/*
```
然后通过git remote -v 就可以看到多出来的一个
```
origin	git@github.com:ericuni/note.git (fetch)
origin	git@github.com:ericuni/note.git (push)
origin	git@git.oschina.net:ericuni/note.git (push)
```
这样之后的 git push origin master 就会将commit 同时推送到 github 和 oschina 上.

