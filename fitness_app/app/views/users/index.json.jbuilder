json.array!(@users) do |user|
  json.extract! user, :displayName, :password, :emailAdd, :profileImgURL, :heightM, :weightM, :bodyFatM, :armsM, :forearmsM, :waistM, :chestM, :thighsM, :calvesM, :shouldersM, :neckM, :hideStats, :hideRoutines, :hideSoundtrack
  json.url user_url(user, format: :json)
end