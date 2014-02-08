require 'spec_helper'

describe "users/new" do
  before(:each) do
    assign(:user, stub_model(User,
      :displayName => "MyString",
      :password => "MyString",
      :emailAdd => "MyString",
      :profileImgURL => "MyString",
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
    ).as_new_record)
  end

  it "renders new user form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", users_path, "post" do
      assert_select "input#user_displayName[name=?]", "user[displayName]"
      assert_select "input#user_password[name=?]", "user[password]"
      assert_select "input#user_emailAdd[name=?]", "user[emailAdd]"
      assert_select "input#user_profileImgURL[name=?]", "user[profileImgURL]"
      assert_select "input#user_heightM[name=?]", "user[heightM]"
      assert_select "input#user_weightM[name=?]", "user[weightM]"
      assert_select "input#user_bodyFatM[name=?]", "user[bodyFatM]"
      assert_select "input#user_armsM[name=?]", "user[armsM]"
      assert_select "input#user_forearmsM[name=?]", "user[forearmsM]"
      assert_select "input#user_waistM[name=?]", "user[waistM]"
      assert_select "input#user_chestM[name=?]", "user[chestM]"
      assert_select "input#user_thighsM[name=?]", "user[thighsM]"
      assert_select "input#user_calvesM[name=?]", "user[calvesM]"
      assert_select "input#user_shouldersM[name=?]", "user[shouldersM]"
      assert_select "input#user_neckM[name=?]", "user[neckM]"
      assert_select "input#user_hideStats[name=?]", "user[hideStats]"
      assert_select "input#user_hideRoutines[name=?]", "user[hideRoutines]"
      assert_select "input#user_hideSoundtrack[name=?]", "user[hideSoundtrack]"
    end
  end
end
