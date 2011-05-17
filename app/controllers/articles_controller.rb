class ArticlesController < ApplicationController
  def show
    @article = Article.find(params[:id])
    @topic = @article.topic
    @posts = @topic.posts.paginate :per_page => 10, :page => params[:page], :include => :user
    @forum = @topic.forum
    @post = Post.new
  end
end
