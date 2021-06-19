class Showdown < ApplicationRecord 
  belongs_to :session 
  
  after_update_commit :updateview
  #broadcasts_to -> (showdown) {'showdowns'}
  #after_update_commit -> (presence) {broadcast_append_to: :showdonws, partial: '/partials/presentlist'}


  def updateview
    showdownid = self.id
    broadcast_append_to "showdown-#{showdownid}" 
  end


end
