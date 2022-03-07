# == Schema Information
#
# Table name: responses
#
#  id         :bigint           not null, primary key
#  user_id    :integer          not null
#  answer_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Response < ApplicationRecord

    validate :respondent_already_answered?

    belongs_to :answer_choice,
      primary_key: :id,
      foreign_key: :answer_id,
      class_name: :AnswerChoice
    
    belongs_to :respondent,
      primary_key: :id,
      foreign_key: :user_id,
      class_name: :User

    has_one :question,
      through: :answer_choice,
      source: :question

    def sibling_responses
      self.question.responses.where.not('responses.id = ?', self.id)
    end

    def not_duplicate_response
      !sibling_responses.exists?(user_id: self.user_id)
    end

    def respondent_already_answered?
      if self.user_id && !not_duplicate_response
        self.errors[:user_id] << 'User already answered this question'
      end
    end
end
