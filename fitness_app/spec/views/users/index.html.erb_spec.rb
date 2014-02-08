require 'spec_helper'

describe "users/index" do
  before(:each) do
    assign(:users, [
      stub_model(User,
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
      ),
      stub_model(User,
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
      )
    ])
  end

  it "renders a list of users" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Display Name".to_s, :count => 2
    assert_select "tr>td", :text => "Password".to_s, :count => 2
    assert_select "tr>td", :text => "Email Add".to_s, :count => 2
    assert_select "tr>td", :text => "Profile Img Url".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
