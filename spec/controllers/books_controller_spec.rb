require 'rails_helper'

describe BooksController do
  describe "GET #index" do
    it "assigns all books with a title of Harry Potter" do
      book = create_book(title: "Harry Potter")

      get :index

      expect(assigns(:books)).to eq [book]
    end
  end

  describe "GET #new" do
    it "assigns a new Book object" do
      get :new

      expect(assigns(:book)).to be_a_new(Book)
    end
  end

  describe "POST #create"
    describe "on success"
      it "creates a new book when valid parameters are passed" do
        expect {
          post :create, book: { title: "Harry Potter", author: "Some Muggle" }
        }.to change { Book.all.count }.by(1)

        book = Book.last
        expect(book.title).to eq "Harry Potter"
        expect(book.author).to eq "Some Muggle"
        expect(flash[:notice]).to eq "Book Created"
        expect(response).to redirect_to books_path
      end
    end
end