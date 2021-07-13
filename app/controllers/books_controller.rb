class BooksController < ApplicationController
  
  def top
  end
 
  def index
    @book = Book.new
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book=Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      # リダイレクト show
      redirect_to book_path(@book)
      # フラッシュメッセージ
      flash[:notice] = "Book was successfully created."
    else
      # 書き込み失敗
      @books = Book.all
      render action: :index
      
    end
  end

  def edit
    @book = Book.find(params[:id])
  end
  
  def update
   @book = Book.find(params[:id])
    if @book.update(book_params)
      # リダイレクト
      redirect_to book_path(@book)
      # フラッシュメッセージ
      flash[:notice] = "Book was successfully created."
    else
      # 書き込み失敗
      render action: :edit
    end
  end
  
  
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    # 一覧ページへリダイレクト
    redirect_to books_path
    flash[:notice] = "Book was successfully destroyed."
  end
  
  
  private
  
  def book_params
    params.require(:book).permit(:title, :body)
  end
  
end