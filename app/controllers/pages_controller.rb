class PagesController < ApplicationController
  def home
    @blogs_published = Blog.published
    @blogs_all = Blog.all
    @skills = Skill.all
    @portfolio_items = Portfolio.all
  end

  def about
  end

  def contact
  end

  def tech_news
    @tweets = SocialTool.twitter_search
  end


end
