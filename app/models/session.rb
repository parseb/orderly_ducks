class Session < ApplicationRecord
    belongs_to :user
    before_create :doinvitecode
    validates_presence_of :title, :s_time, :e_time





    private
    
    def doinvitecode
        codz = (0...6).map { ('a'..'z').to_a[rand(26)] }.join
        self.accesscode = codz 
    end

end
