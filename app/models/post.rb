class Post < OpenStruct
  def self.all(posts)
    posts.map { |post| Post.new(post) }
  end

  def image_url
    images[:standard_resolution][:url]
  end

  def liked_count
    likes[:count]
  end

  def profile_picture
    user[:profile_picture]
  end

  def username
    user[:username]
  end

  def picture_comments
    comments[:data]
  end
end
