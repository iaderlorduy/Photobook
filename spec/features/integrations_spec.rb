require 'rails_helper'

RSpec.feature "Integrations", type: :feature do
  
  before do
    @user = create(:user)  
  end
  
  scenario "Add post" do
    visit new_user_session_path

    fill_in 'Email', :with => @user.email
    fill_in 'Password', :with => @user.password
    click_button 'Log in'

    expect(page).to have_text 'Signed in successfully'

    visit new_post_path
    
    #file = attach_file("Upload Your File", Rails.root + "spec/fixtures/file.pdf")
    #page.attach_file(locator, '/path/to/file.png')
    post = build(:post)
    
    fill_in 'Title', :with => post.title
    fill_in 'Description', :with => post.description
    page.attach_file('Photo', "#{Rails.root}/spec/factories/photobook.jpg")
    
    click_button 'Create Post'

    expect(page).to have_text 'Post was successfully created.'
  end
  
  scenario "Edit post" do
    visit new_user_session_path

    fill_in 'Email', :with => @user.email
    fill_in 'Password', :with => @user.password
    click_button 'Log in'

    expect(page).to have_text 'Signed in successfully'

    post = create(:post)
    #p post
    oldTitle = post.title
    
    visit "/posts/#{post.id}/edit"
    
    fill_in 'Title', :with => "titulo de prueba"
    fill_in 'Description', :with => post.description
    page.attach_file('Photo', "#{Rails.root}/spec/factories/photobook.jpg")
    
    click_button 'Update Post'

    expect(page).to have_text 'Post was successfully updated.'
    
    postTemp = Post.find(post.id)
    
    expect(postTemp.title).to_not equal(oldTitle)
    
  end
  
  
  
  
end
