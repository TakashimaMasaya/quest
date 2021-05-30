class QuestsController < ApplicationController
  def index
   @quest_all = Quest.all
   @q = @quest_all.ransack(params[:q])
   @quests = @q.result(distinct: true).order(created_at: :desc).page(params[:page]).per(10) 
   @quest_solved = @quests.where( solved: true)
   @quest_unsolved = @quests.where( solved: false)
  end

  def solved
    @quest = Quest.find(params[:id])
    @quest.solved = "true"
    @quest.save
    redirect_to quests_url, notice: "解決済にしました"
  end

  def unsolved
    @quest = Quest.find(params[:id])
    @quest.solved = "false"
    @quest.save
    redirect_to quests_url, notice: "未解決にしました"
  end

  def new
    @quest = Quest.new
  end

  def create
    @quest = Quest.new(quest_params)
    @quest.user_id = current_user.id
    if @quest.save
      QuestMailer.creation_email(@quest).deliver_now
      redirect_to quests_url, notice: "質問「#{@quest.title}」を登録しました。"
    else
      render :new
    end
  end

  def show
    @quest = Quest.find(params[:id])
    @answers = @quest.answers
    @answer = Answer.new
  end

  def edit
    @quest = current_user.quests.find(params[:id])
  end

  def update
    quest = Quest.find(params[:id])
    quest.update!(quest_params)
    redirect_to quests_url, notice: "質問「#{quest.title}」を更新しました。"
  end

  def destroy
    quest = Quest.find(params[:id])
    quest.destroy
    redirect_to quests_url, notice: "質問「#{quest.title}」を削除しました。"
  end

  private

  def quest_params
    params.require(:quest).permit(:title, :description)
  end
end
