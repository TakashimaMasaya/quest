class AnswersController < ApplicationController
  
  def index
    @answers = Answer.all
  end

  # def new
  #   @answer = Answer.new
  # end

  def create
    @quest = Quest.find(params[:quest_id])
    @answer = @quest.answers.build(answer_params)
    @answer.user_id = current_user.id
    if @answer.save!
      QuestMailer.creation_email(@answer).deliver_now
      redirect_to @quest, notice: "回答「#{@answer.title}」を登録しました。"
    else
      render :new
    end
  end

  def show
    @answer = Answer.find(params[:id])
  end

  def edit
    @quest = Quest.find(params[:quest_id])
    @answer = @quest.answers.find(params[:id])
    # @answer = Answer.find(params[:id])
  end

  def update
    answer = Answer.find(params[:id])
    answer.update!(answer_params)
    redirect_to answers_url, notice: "回答「#{answer.title}」を更新しました。"
  end

  def destroy
    answer = Answer.find(params[:id])
    answer.destroy
    redirect_to answers_url, notice: "回答「#{answer.title}」を削除しました。"
  end

  private

  def answer_params
    params.require(:answer).permit(:title, :description)
  end

end
