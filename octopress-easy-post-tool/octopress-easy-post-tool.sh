#!/bin/sh
# if you are not in China, you need to change the TZ= your local Timezone
root=/home/ming/blogs/octopress
scriptName=`basename $0`
cd $root
case $1 in
    'post')
        TZ=CCT rake new_post
        ;;
    'edit')
        vi $root/source/_posts
        ;;
    'page')
		name=`"%H-%M-%S"`
        if   ! $2 ; then
            echo 'need page name'
            exit
        fi
        name=`echo $2|sed 's/ /-/g'`
        echo $name
        path=`     TZ=CCT rake new_page[$name]|awk -F":" '{print $2}'`
        vi $path
        ;;
    'preview')
             TZ=CCT rake preview
        ;;
    'generate')
             TZ=CCT rake clean
             TZ=CCT rake generate
        ;;
     'deploy')
             TZ=CCT rake deploy
       ;;
	 'gitdeploy')
			cd /tmp/public
			 cp -fR $root/agit /tmp/public/.git
			 git add --all .
			 git commit -m "new blog content"
			 git pull
			 git add .
			 git commit -m "new file"
			 git push
        ;;
    'open')
        nemo $root/source/_posts
        ;;
     'cp')
        cp -fR $root/agit /tmp/public/.git
        ;;      
    'edit')
        vim $root
        ;;
	'gen_pre')
             TZ=CCT rake generate
		     TZ=CCT rake preview		
        ;;
    'gen_dep')
            TZ=CCT rake generate		
			blog deploy
        ;;
	'backup')
			 cd $root/source
			 git add .
			 git commit -m "bak source"+`date +"%H-%M-%S"`
			 git push
			 cd ..			
        ;;
	'bgd')
			ccd $root/source
			 git add .
			 git commit -m "bak source"+`date +"%H-%M-%S"`
			 git push
			 cd ..
			TZ=CCT rake generate
			blog deploy
        ;;
    *)
        echo "usage: $scriptName [post|page|preview|deploy|generate|open|edit|gen_dep|gen_pre|back|bgd]"
        exit 1
        ;;
esac
