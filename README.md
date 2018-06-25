# README

Ruby 2.5.1
Rails 5.2.0
PostgreSQL 9.5.13 on x86_64-pc-linux-gnu, compiled by gcc (Ubuntu 5.4.0-6ubuntu1~16.04.9) 5.4.0 20160609, 64-bit

Hello Rafael!

There are a few differences in this app from the schema I designed in the Google Doc I sent you.

I did not use latitude or longitude because ZIP codes and the API I found for them (http://www.zipcodeapi.com/) seemed simpler. I also did not include a maximum distance as a factor that would disqualify matches where contractors are too far from a project. However, if using lat/long or including a maximum distance were requirement, I do know how I would go about implementing them.

To run app locally:
-run rails db:reset
-navigate to localhost:3000

Click buttons to match contractors to projects!

If you get a "429 Too Many Requests" error, swap the keys for the ZipCodeApi GET requests being made at app/models/project.rb:30 and app/controllers/projects_controller.rb:18

Enjoy!


