class QuestMailer < ApplicationMailer
  default from: '3469masa@gmail.com'

  def creation_email(quest)
    @quest = quest
    mail(
      subject: '質問作成完了メール',
      to: '3469masa@gmail.com',
      from: '3469masasend@gmail.com'
    )
  end
end
