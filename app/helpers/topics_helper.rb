module TopicsHelper

  def unclassify_blog blog
    blog.update!(topic_id: 1)
  end

end
