class Showdown < ApplicationRecord 
  belongs_to :session 
  
   #after_update_commit { broadcast_replace_to 'cryptoquotes' }

  #  after_update_commit :updateview
 # after_save :showdownbroadcast
  #before_update :presence
  #broadcasts_to -> (showdown) {'showdowns'}
  #after_update_commit -> (presence) {broadcast_append_to: :showdonws, partial: '/partials/presentlist'}

  def showdownbroadcast
    broadcast_to "showdown_channel_#{self.id}"
  end

  def updateview
    showdownid = self.id
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
