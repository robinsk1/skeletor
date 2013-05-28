require 'dragonfly'
#require 'dragonfly/rails/images'


app = Dragonfly[:images]
app.configure_with(:imagemagick)
app.configure_with(:rails)

#app.processor.add :threshold do |temp_object, *args|
#  # use temp_object.data, temp_object.path, temp_object.file, etc.
#  RMagick.threshold(temp_object.data, 'some/threshold/file.png')
#  # return a String, Pathname, File or Tempfile
#end

if (Rails.env.production?)
  app.configure do |c|
    c.datastore = Dragonfly::DataStorage::S3DataStore.new(
      :bucket_name => 'sk3l8t0r-artists',
      :access_key_id => ENV['S3_ACCESS_KEY_ID'],
      :secret_access_key => ENV['S3_SECRET_ACCESS_KEY'],
      :region => 'eu-west-1'
    )
  end
end



app.configure do |c|
  c.allow_fetch_file = true
  c.protect_from_dos_attacks = true
  c.secret = "df8129cedfa5568bbb18bc8b0d971302599ff0f3c5256d4d04ed38429a95b4e57fc9e7f24dc537fc7a1a5bc0bdce1902a0acb1c9f1fbfa72140b82436dac43a4"  # use rake secret to generate
end

app.define_macro(ActiveRecord::Base, :image_accessor)
