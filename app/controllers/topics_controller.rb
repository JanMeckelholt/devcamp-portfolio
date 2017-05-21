class TopicsController < ApplicationController
  before_action :set_topic, only: [:edit, :update, :destroy]
  before_action :set_topics, only: [:index, :update]
  
  layout "blog"

  def index
  end

  def new
    @topic = Topic.new
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

    # Never trust parameters from the scary internet, only allow the white list through.
    def topic_params
      params.require(:topic).permit(:title)
    end

end
