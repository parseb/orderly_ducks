class Session < ApplicationRecord
    has_and_belongs_to_many :users
    has_one :showdown
    before_create :doinvitecode, :ensure_mock_lifecycle
    validates_presence_of :title, :s_time, :e_time
    after_create :ensure_showdown




    private
    
    def doinvitecode
        codz = (0...6).map { ('a'..'z').to_a[rand(26)] }.join
        self.accesscode = codz 
        self.state={}
    end

    def ensure_showdown
        Showdown.find_or_create_by!(session_id: self.id) 
        #inherits from session if any
        
     end

     def ensure_mock_lifecycle
        self.lifecycle = ['Created', 'Edited', 'Updated', 'Started', 'Joined', 'Ended','Edited', 'Archived']
     end

end
