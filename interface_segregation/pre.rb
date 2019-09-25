class PostRepository
  def get_all_by_ids(ids:, sort:)
    posts = entity.where(id: ids)
    posts.order(title: :asc) if sort
    posts
  end

  private

  def entity
    Post
  end
end

# Usage

module Admin
  class PostsController
    def index
      @posts = PostRepository.new.get_all_by_ids(params[:ids], false)
    end
  end
end

module Client
  class HomeController
    def index
      @posts = PostRepository.new.get_all_by_ids(params[:ids], true)
    end
  end
end