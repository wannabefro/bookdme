module SignUpHelper
  def sign_in_as user
    visit new_user_session_path
    fill_in 'Email', with: user[:email]
    fill_in 'user_password', with: user.password
    click_on 'Sign in'
  end

  def sign_out_as user
    visit root_path
    click_on 'Logout'
  end

  def sign_in_act user, act
    sign_in_as user
    visit new_act_path
    image_path = Rails.root + 'spec/support/images/placeholder.gif'
    fill_in 'Name', with: act[:name]
    select('Dancer', :from => 'What kind of act are you')
    select('Florida', :from => 'Where are you based')
    attach_file('Upload your image', image_path)
    fill_in 'In your own words what are you', with: act[:custom_genre]
    fill_in 'Describe your act in a couple of sentences', with: act[:short_bio]
    select('0-50', from: 'Your hourly rate')
    click_on 'Create your act'
  end
end
