class ReviewsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  
  before_action :set_book
  before_action :set_review, only: [:show, :edit, :update, :destroy ]
  before_action :ensure_owner, only: [:edit, :update, :destroy]
 
  # GET /reviews or /reviews.json
  def index
    @reviews = @book.reviews # Lists only this book's review
  end

  # GET /reviews/1 or /reviews/1.json
  def show
  end

  # GET /reviews/new
  def new
    @review = @book.reviews.build
  end

  # GET /reviews/1/edit
  def edit
  end

  # POST /reviews or /reviews.json
  def create
    @review = @book.reviews.new(review_params)
    @review.user = current_user

    respond_to do |format|
      if @review.save
        format.html { redirect_to book_path(@book), notice: "Review was successfully created." }
        format.json { render :show, status: :created, location: @review }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reviews/1 or /reviews/1.json
  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to book_path(@book), notice: "Review was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1 or /reviews/1.json
  def destroy
    @review.destroy!

    respond_to do |format|
      format.html { redirect_to book_path(@book), notice: "Review was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

def my_reviews
    if user_signed_in?
      @reviews = current_user.reviews.includes(:book)
    else
      redirect_to new_user_session_path, alert: "You must be logged in to view your reviews."
    end
  end

  private
    # Find the parent book using the ID from the nested route params.
    def set_book
      @book = Book.find(params[:book_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = @book.reviews.find(params[:id])
    end
    def ensure_owner
      unless @review.user_id == current_user.id
        redirect_to book_path(@book), alert: "You are not authorized to perform this action."
      end
    end
    # Only allow a list of trusted parameters through.
    def review_params
      params.expect(review: [ :content, :rating])
    end
end
