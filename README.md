## Steps to install locally
- your_prefered_path/$: git clone git@github.com:cesarediaz/fintech.git
- your_prefered_path/$: cd fintech && bundle install
- your_prefered_path/fintech$: rake db:migrate && rake db:seed && rails s

### To test locally and do a sussesfull login
- go to your browser at [http://localhost:3000](http://localhost:3000)
- use as user information 'test@email.com' and '12345678' as password and you should be logged in

### To test check inline for login with bad email or password
- go to your browser at [http://localhost:3000](http://localhost:3000)
- use bad format for email and you should see an error message in red under the field saying that format is not valid
- use a password that has less than 8 characters and you should see an error message in red under the field saying that the password is <Not long enough>

### To check registration fail with "weak passwords"
- go to registration link
- put a valid email address and use as password "password" or "mypassword". In both cases you should not be allowed to create your registration and must be an error saying about <Password too weak>


### To test a mock api
- go to your browser and put next link [http://localhost:3000/api/v1/sessions/create?password=password](http://localhost:3000/api/v1/sessions/create?password=password) .. you should get as an answer  {"status":"failure"}
- go to your browser and put next link [http://localhost:3000/api/v1/sessions/create?password=<whatever_not_empty_string>](http://localhost:3000/api/v1/sessions/create?password=whatever_not_empty_string) .. you should get as an answer  {"status":"success"}

Important:
all those tests can be done on the heroku app at [https://aqueous-dusk-46034.herokuapp.com](https://aqueous-dusk-46034.herokuapp.com)
