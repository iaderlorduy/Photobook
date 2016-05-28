require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe "creation" do
      
    it "has a valid class" do
      expect(described_class).to_not be_nil
    end
    
    context "with invalid attributes" do
        
        it "should not be valid without firstname and lastname empty" do
            
            @user = build(:user, firstname: "", lastname: "")
            expect(@user.save).to be false 
            
        end
        
        it "should not be valid without username empty" do
            
            @user = build(:user, username: "")
            expect(@user.save).to be false 
            
        end
        
        it "should not be valid without email" do
            
            
            @user = build(:user, email: "gusta")
            expect(@user.save).to be false 
            
        end
        
    
        
    end
      
  end
  
end
