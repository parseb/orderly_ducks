class Showdown < ApplicationRecord 
  belongs_to :session 
  
 # after_update_commit :showdownbroadcast
 # before_update :showdownbroadcast
  after_commit :showdownbroadcast
 # after_save :showdownbroadcast
  #before_update :presence
  #broadcasts_to -> (showdown) {'showdowns'}
  #after_update_commit -> (presence) {broadcast_append_to: :showdonws, partial: '/partials/presentlist'}

  def showdownbroadcast
    showdownid = self.id
    ActionCable.server.broadcast "showdown_#{showdownid}", {data: {q: self.q, 
                                                            presence: self.presence.uniq, 
                                                            temp_transcript: self.temp_transcript, 
                                                          }}
  end




  def updateview
    
    broadcast_replace_to "showdown-#{showdownid}" 
  end
  
  def uniq_presence
    self.presence = self.presence.uniq
    self.save!
  end
  # def presence
  #   if !self.presence.include? current_user.id
  #     self.presence << current_user.id 
      
  #   end
  # end

end
