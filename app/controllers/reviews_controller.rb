class ReviewsController < ApplicationController
  before_action :set_book
  before_action :set_review, only: %i[ show edit update destroy ]

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

  private
    # Find the parent book using the ID from the nested route params.
    def set_book
      @book = Book.find(params[:book_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def review_params
      params.expect(review: [ :content, :rating])
    end
end
