class Admin::QuestionsController < ApplicationController
  layout 'admin/layouts/application'
  def index
    @quests = Quest.all
  end
end
