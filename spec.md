# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app
-- Installed Sinatra gem and followed intstructions to complete set up in with scaffolding, making mvc's for bills and users
- [x] Use ActiveRecord for storing information in a database
-- Successfully created migrations for users and bills tables then ran migrations, with later edits
- [x] Include more than one model class (e.g. User, Post, Category)
-- This app is based off of two models, bills and users
- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts)
-- The user model has many bills
- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User)
-- The bill belongs to the user
- [x] Include user accounts with unique login attribute (username or email)
-- Login attribute 'username' was used for the user
#update, validations now require the username to be unique
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying
-- Bills controller has CRUD capabilities 
- [x] Ensure that users can't modify content created by other users
-- Bills controller specifies that the user must be logged in and must be the creator of the bill in order to view, edit, or destroy
- [x] Include user input validations
-- User model has secure password validation and validates_presence_of are active and working 
#update, validates presence: and uniqness: are now implemented in the user model
- [ ] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code
-- My README.md includes the desctiption and install instructions as well as a contributors guide and a link to the license

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [-] You don't include changes in a commit that aren't related to the commit message
-- I did include some commits that aren't related to the commit message due to prolonged editing without committing 