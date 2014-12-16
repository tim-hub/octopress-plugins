# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

require './plugins/post_filters'

module AppendFooterFilter
  def append(post)
     author = post.site.config['author']
     url = post.site.config['url']
     pre = post.site.config['original_url_pre']
     license = post.site.config['license_url']
     lic_name = post.site.config['license_name']
     post.content +  " "+ <<_here2start
<p class='post-footer' style="font-size:70%;" >
<br/>
<br/>
<br/>
#{pre or "The Original Link:"}
<a href='#{post.full_url}' rel="bookmark">#{post.full_url}</a><br/>
If you want to reprint it, please do under the  <a href=#{license} >#{lic_name}</a>.	
</p>
_here2start
            
            #&nbsp;Posted at <a href='#{url}'>#{url}</a><br/>
            #&nbsp;Written by <a href='#{url}'>#{author}</a>
            #&nbsp;Keywords : {{ page.keywords }}
  end 
end

module Jekyll
  class AppendFooter < PostFilter
    include AppendFooterFilter
    def pre_render(post)
      post.content = append(post) if post.is_post?
    end
  end
end

Liquid::Template.register_filter AppendFooterFilter
