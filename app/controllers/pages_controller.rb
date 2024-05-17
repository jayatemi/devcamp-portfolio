class PagesController < ApplicationController
  def home
    @posts = Blog.all
  	@skills = Skill.all

  end

  def about
  end

  def contact
  end

  def my_twitter
  	@twitter = SocialTool.user_details
  end

end
