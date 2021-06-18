require 'rails_helper'
require 'time'

RSpec.describe Session, type: :model do

    it 'should have an access code' do
      #user = User.create!(email:'a@b.com', name:'TestedUser Name', password:'pass06', phone:'0040149385392')
      s= Session.create!(title: "Session Title", s_time: Time.now, e_time: (Time.now + 1.hour), agenda:[1,2,3] )
      
      expect(s.accesscode.length).to eq(6) 
      
    end
end
