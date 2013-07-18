User.destroy_all
Event.destroy_all
Location.destroy_all

e1 = Event.create! name: 'Intro to programming', price: '£75'
e2 = Event.create! name: 'School fete', price: 'FREE'
e3 = Event.create! name: 'Digital sizzle', price: '£100'
e4 = Event.create! name: 'Project X', price: '£49'

Location.create! name: 'O2 Arena', description: 'Lovely East London venue', capacity: 120
Location.create! name: 'Earls Court', description: 'A lovely venue', capacity: 56
Location.create! name: 'Westminster School', description: '£49', capacity: 20
Location.create! name: 'Secret Location', description: 'Its secret, but we promise worthwhile!', capacity: 2


u1 = User.create! name: 'James', email: 'jamesroypoulter@gmail.com', password: 'test', password_confirmation: 'test', role: 'admin'
u1.events << e1
u1.save
User.create! name: 'Elliot', email: 'e@e', password: 'test', password_confirmation: 'test', role: 'partner'
User.create! name: 'Rob', email: 'r@r', password: 'test', password_confirmation: 'test', role: 'partner'
User.create! name: 'Julian', email: 'j@j', password: 'test', password_confirmation: 'test', role: 'changer'

user = User.where(name: 'James').first
user.role = 'admin'
user.save
