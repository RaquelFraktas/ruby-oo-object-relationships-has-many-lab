require 'pry'

class Author
    attr_accessor :name
  
    def initialize(name)
        @name = name
    end

    def posts
        Post.all.find_all do |post|
            post.author.name == self.name
            
        end
    end

    def add_post(post)
        post.author  = self
    end

    def add_post_by_title(title)
        title = Post.new(title)
        title.author = self
    end

    def self.post_count
        Post.all.count
        # Post.all.select do |post|
        #     post
    end

end