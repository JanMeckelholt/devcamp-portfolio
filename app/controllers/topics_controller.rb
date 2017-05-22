class TopicsController < ApplicationController
  before_action :set_topic, only: [:edit, :update, :destroy, :show]
  before_action :set_topics, only: [:index, :update]
  before_action :set_sidebar_topics
  
  layout "blog"

  def index
  end

  def new
    @topic = Topic.new
  end

  def show
  if logged_in?(:site_admin) 
      @topic_blogs = @topic.blogs.by_created_at.page(params[:page]).per(5)  
    else
      @topic_blogs = @topic.blogs.published.by_created_at.page(params[:page]).per(5)
    end

  end

  def create
    @topic = Topic.new(topic_params)
      if @topic.save
        redirect_to topics_path, notice: 'Topic was successfully created.'
      else
        redirect_to topics_path, notice: 'Topic could not be created.'
        
      end
  end

  def edit
  end

  def update
      if @topic.update(topic_params)
        redirect_to topics_path, notice: 'Topic was successfully updated.'
      else
        redirect_to topics_path, notice: 'Topic could not be updated.'
        
      end
  end

  def destroy
    @topic.blogs.each do |b|
      b.update!(topic_id: 1)
    end
    @topic.destroy
    redirect_to topics_path, notice: 'Blog was successfully destroyed.'
  end

private
    # Use callbacks to share common setup or constraints between actions.
  

    def set_topic
      @topic = Topic.find(params[:id])
    end

    def set_topics
      @topics = Topic.all.sort_by_id
    end

    def set_sidebar_topics
      if logged_in?(:site_admin) 
        @sidebar_topics = Topic.with_blogs
      else
        @sidebar_topics = Topic.with_blogs_published
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def topic_params
      params.require(:topic).permit(:title)
    end

end
