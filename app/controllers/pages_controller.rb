class PagesController < ApplicationController
  def home
  end

  def authors
    @blogs = Blog.all
  end

  def titles
    @blogs = Blog.all
  end
end
