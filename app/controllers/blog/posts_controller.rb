# @var makes @var available in corresponding view

module Blog

  class PostsController < BlogController

    # GET /posts
    # GET /posts.json
    def index


      @posts = storage.list_for(params[:page], params[:tag])
      
      @featured_posts = storage
      
      #@posts = Post.all


    end
  
    # GET /posts/1
    # GET /posts/1.json
    def show
      #looks up a post in the database by id number in url
      @post = storage.friendly.find(params[:id])
    end

    private 
    
    
    def storage
      Post.published
    end


  
  end
  
end
