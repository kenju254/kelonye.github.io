guard 'shell', :all_on_start => true do
  watch /^client\/.+\.(coffee|styl|jade)$/ do 
    `make`
  end
  watch /^index.jade$/ do 
    `make`
  end
end

guard 'livereload' do
  watch /^build\/build\..+$/
  watch /^index.html$/
end

notification :off