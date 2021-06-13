require 'rails_helper'

RSpec.describe User, type: :model do
 


  it 'user should have a placeholder randomuser.me avatar url' do
    user = User.create!(email:'a@b.com', name:'TestedUser Name', password:'pass06')
    expect(user.avatar_url).to include('https://randomuser.me/api/portraits/med')
    expect(user.avatar_url.length).to satisfy {|v| v > 47 }
  end

  it 'user should have a phone number' do 
    user = User.create!(email:'a@b.com', name:'TestedUser Name', password:'pass06', phone:'0040149385392')
    expect(user).to be_truthy
    expect(user.phone).to be   
    expect(user.phone).to satisfy {|x| x.length > 8}
  end


end

