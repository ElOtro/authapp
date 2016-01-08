Faker::Config.locale = 'ru'

# 30.times do |n|
#   fio_array                  = Faker::Name.name.split(" ")
#   name                       = "#{fio_array[1]} #{fio_array[0]}"
#   name_array                 = name.split(" ")
#   email                      = Faker::Internet.free_email("#{name_array[1]} #{name_array[0]}".to_url)
    
#   User.create({ email: email, password: '12345678', password_confirmation: '12345678', name: name })
# end

25.times do |n|
  company                    = Faker::Company.name
  company_array              = company.split(" ")
  email                      = Faker::Internet.free_email("#{company_array[1]}".to_url)
  
  Company.create({ email: email, password: '12345678', password_confirmation: '12345678', name: company })
end
