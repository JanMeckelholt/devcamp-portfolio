class PagesController < ApplicationController
  def home
    @blogs = Blog.all
    @skills = Skill.all
    @portfolio_items = Portfolio.all
  end

  def about
  end

  def contact
  end
end
