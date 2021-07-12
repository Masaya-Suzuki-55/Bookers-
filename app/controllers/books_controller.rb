class BooksController < ApplicationController
  def top
  end
 
  def index
  end

  def show
  end

  def create
    @book = Book.new(book_params)
  end

  def edit
  end
  
  def update
  end
  
  def destroy
  end
  
  
  private
  
  def book_params
    params.require(:book).permit(:title, :body)
  end
  
end
