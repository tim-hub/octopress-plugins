##Octopress Add Original Link

This is a plugin for octopress.
When generate the posts and pages, the plugin will generate the original link after the post content.

And you can add the keyword after it too.

It is cool and easily to use to help **SEO** and make readers notice the license.

###How to Use:
Just add it in your octopress plugin forder.

###Notice

Octopress is preparing to update to the version3, this plugin is for octopress2. And this plugin is just a small ruby script, it just add some codes let the octopress program ass original link below the post/page, so it is not difficult to change the plugin for using it in near octopress3


##Octopress Easy Post Tool
Octopress use rake post to create a post. I found a Chinese coder's [article](http://my.oschina.net/u/160375/blog/160342) on oschina blog. 
This man write an shell script to write octopress articles more easily.

I found it is really useful. But ther is a little bug, And this is a new version.

###Some Differences/ Bug Fixs
- add `TZ=CCT` to support China timezone
- add more commands combine for easily using
- ...


###How to Use
0 change the TimeZone
I  am in CCT timezone, so its `TZ=CCT`
you need to change the "CCT" to your TimeZone.

1 change the `root`

2 you can change the shell scirpt's name to "blog"

	mv octopress-easy-post-tool.sh blog	
	sudo mv blog /usr/local/bin

3 And now you can use it in your teminal.

	blog post name	//wrie a named "name" article
	blog generate	//rake generate
	blog deploy		//deploy the whole blog
	and so on like gen_dep	gen_pre