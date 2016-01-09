Faker::Config.locale = 'ru'

# 30.times do |n|
#   fio_array                  = Faker::Name.name.split(" ")
#   name                       = "#{fio_array[1]} #{fio_array[0]}"
#   name_array                 = name.split(" ")
#   email                      = Faker::Internet.free_email("#{name_array[1]} #{name_array[0]}".to_url)
    
#   User.create({ email: email, password: '12345678', password_confirmation: '12345678', name: name })
# end

# 25.times do |n|
#   company                    = Faker::Company.name
#   company_array              = company.split(" ")
#   email                      = Faker::Internet.free_email("#{company_array[1]}".to_url)
  
#   Company.create({ email: email, password: '12345678', password_confirmation: '12345678', name: company })
# end

root_category = Category.create!(:name => 'Все категории')

c1_0 = Category.create!(:name => 'Автопром')
c1_0.move_to_child_of(root_category)

c1_1 = Category.create!(:name => 'Газ')
c1_1.move_to_child_of(c1_0)

c2_1 = Category.create!(:name => 'Маз')
c2_1.move_to_child_of(c1_0)

c2_0 = Category.create!(:name => 'Сельхозпроизводители')
c2_0.move_to_child_of(root_category)

c2_1 = Category.create!(:name => 'Сено')
c2_1.move_to_child_of(c2_0)

c2_2 = Category.create!(:name => 'Пшено')
c2_2.move_to_child_of(c2_0)

c3_0 = Category.create!(:name => 'Финансы')
c3_0.move_to_child_of(root_category)

c3_1 = Category.create!(:name => 'Банки')
c3_1.move_to_child_of(c3_0)

c3_2 = Category.create!(:name => 'Кредитные учреждения')
c3_2.move_to_child_of(c3_0)

category_ids = Category.where(depth: 2).pluck(:id)
companies = Company.all
companies.each do |company|
	company.category_id = category_ids.sample
	company.save
end