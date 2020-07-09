class BooksController < ApplicationController
  before_action :authenticate_user!
  def index
  	@book = Book.new
  	@books = Book.all.order(created_at: :desc)
  	@user = current_user
  end

  def show
    @book = Book.find(params[:id])
  end

  def create
  	@book=Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(@book.id)
    else
      flash[:notice] = "error"
      @books = Book.all
      @user = current_user
      render :index
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def destroy
     book = Book.find(params[:id])
     book.destroy
     redirect_to books_path
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "Book was successfully updated."
      redirect_to edit_book_path(@book)
    else
      flash[:notice] = "error"
      render :edit
    end
  end



  private
  def book_params
  	params.require(:book).permit(:title, :body)
  end

end
