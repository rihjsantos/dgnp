# dgnp
Install ruby on rails<br>
Install MYSQL server<br>
Create a new database on MYSQL<br>
Change the file ```database.yml``` to point on fresh database created<br>
Execute ```bin/rake db:migrate``` on the root application directory to create the database model<br>
Execute ```rails console``` to access Rails console and run ```User.create(name: "admin", email: "admin@admin.com", password: "admin", password_confirmation: "admin")``` to create a new user on database<br>
Install Redis<br>
Execute ```bundle install``` command on the root application directory to update gems
