# describe "the signin process", :type => :feature do
#   before :each do
#     @user = FactoryGirl.create :user, :confirmed
#   end

#   it "signs me in" do
#     visit '/users/sign_in'
#     within("form") do
#       fill_in 'Email', with: @user.email
#       fill_in 'Password', with: '123456'
#     end
#     click_button 'Login'
#     expect(find('.profile-pic').find('b')).to have_content @user.full_name
#   end

# end

# describe "the signup process", :type => :feature do
#   before :each do
#     @user = FactoryGirl.attributes_for :user
#   end

#   it "signs me up" do
#     visit '/users/sign_up'
#     within("form") do
#       fill_in 'Email', with: @user[:email]
#       fill_in 'Name', with: @user[:name]
#       fill_in 'Surname', with: @user[:surname]
#       fill_in 'user[password]', with: '123456'
#       fill_in 'user[password_confirmation]', with: '123456'
#     end
#     click_button 'Register'
#     sleep 2
#     expect(page).to have_content I18n.t('devise.registrations.signed_up_but_unconfirmed')
#   end
# end

# describe "the forgot password process", :type => :feature do
#   before :each do
#     @user = FactoryGirl.create :user
#   end

#   it "send resetpassword email" do
#     visit '/users/password/new'
#     within("form") do
#       fill_in 'Email', with: @user[:email]
#     end
#     click_button 'Send'
#     expect(page).to have_content I18n.t('devise.passwords.send_instructions')
#   end
# end
