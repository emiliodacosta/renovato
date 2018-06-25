# README

Ruby 2.5.1
Rails 5.2.0
PostgreSQL 9.5.13 on x86_64-pc-linux-gnu, compiled by gcc (Ubuntu 5.4.0-6ubuntu1~16.04.9) 5.4.0 20160609, 64-bit

To run app locally:
-run rails db:reset
-navigate to localhost:3000

Click buttons to match contractors to projects!

If you get a "429 Too Many Requests" error, swap the keys for the ZipCodeApi GET requests being made at app/models/project.rb:30 and app/controllers/projects_controller.rb:18

Enjoy!
