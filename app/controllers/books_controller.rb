class BooksController < ApplicationController
    before_action :authenticate_user!
  def show
  	 @book = Book.find(params[:id])
     @user = @book.user
     @book_new = Book.new
  end

  def edit
  	 @book = Book.find(params[:id])
     if current_user.id != @book.user_id
      redirect_to books_path
     end
  end

  def create
     @book = Book.new(book_params)
     @book.user_id = current_user.id
     if @book.save
     redirect_to book_path(@book), notice: 'You have creatad book successfully.' #notice: else
     else @books =Book.all
     	render 'index'
     end
  end

  def update 
     @book = Book.find(params[:id])
     if @book.update(book_params)
     redirect_to book_path(@book), notice: 'You have updated book successfully.' #notice: else
     else render 'edit'
  end
end
 def index
 	   @book = Book.new
  	 @books =Book.all
     @user = current_user
 end

  def destroy
     book = Book.find(params[:id])
     book.destroy 
     redirect_to books_path 
  end

  private
   
     def book_params
        params.require(:book).permit(:title, :body)
     end
 end

