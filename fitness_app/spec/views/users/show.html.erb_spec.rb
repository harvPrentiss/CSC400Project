require 'spec_helper'

describe "users/show" do
  before(:each) do
    @user = assign(:user, stub_model(User,
      :displayName => "Display Name",
      :password => "Password",
      :emailAdd => "Email Add",
      :profileImgURL => "Profile Img Url",
      :heightM => "",
      :weightM => "",
      :bodyFatM => "",
      :armsM => "",
      :forearmsM => "",
      :waistM => "",
      :chestM => "",
      :thighsM => "",
      :calvesM => "",
      :shouldersM => "",
      :neckM => "",
      :hideStats => false,
      :hideRoutines => false,
      :hideSoundtrack => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Display Name/)
    rendered.should match(/Password/)
    rendered.should match(/Email Add/)
    rendered.should match(/Profile Img Url/)
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(/false/)
    rendered.should match(/false/)
    rendered.should match(/false/)
  end
end
