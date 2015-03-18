class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(params.require(:book).permit(:title, :author))
    if @book.save
      redirect_to books_path, notice: "Book Created"
    else
      flash[:notice] = "Something went wrong"
      render :new
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(params.require(:book).permit(:title, :author))
      redirect_to root_path, notice: "Book Updated"
    else
      flash[:notice] = "Unable to update book"
      render :edit
    end
  end
end
