class Quiz < ActiveRecord::Base
    belongs_to :question
    belongs_to :user

    # def set_answer
        
    # end
end
