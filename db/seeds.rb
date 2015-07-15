# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
	#user = User.new
	#user.email = 'PYS@gmail.com'
	#user.password = '12345678'
	#user.password_confirmation ='12345678'
	#user.cli_nom = 'Admin PYS'
	#user.role = 'admin'
	#user.save!
	User.create(email:'PYS@gmail.com',password:'12345678',password_confirmation:'12345678',cli_nom:'PYS Admin',role: 'admin')
	@users = User.where(email:'PYS@gmail.com')
	@users.update(1,role: 'admin')