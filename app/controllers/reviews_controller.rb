class ReviewsController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @review = Review.new
  end

  def create
    @review=Review.new(review_params)
    chatroom_id = params[:review][:chatroom_id]
    @chatroom = Chatroom.find(chatroom_id)
    @request = Request.find(@chatroom.request_id)
    @review.reviewer_id = @chatroom.needer_id
    @review.reviewee_id = @chatroom.helper_id
    retrait = User.find(@chatroom.needer_id)
    retrait.pollen -= 1
    retrait.save
    ajout = User.find(@chatroom.helper_id)
    ajout.pollen += 1
    ajout.save
    if @review.save
      @chatroom.status = 6
      @chatroom.save
      ChatroomChannel.broadcast_to(
        @chatroom,
        service_finished: true
      )
      redirect_to request_chatroom_path(@chatroom, request_id: @chatroom.request.id), notice: 'Votre avis a été pris en compte!'
    else
      flash[:alert] = "Something went wrong."
      render :new
    end
  end


  def show
    @review = Review.find(params[:id])
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      redirect_to @review, notice: 'La critique a été mise à jour avec succès.'
    else
      render :edit
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to reviews_path, notice: 'La critique a été supprimée avec succès.'
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
