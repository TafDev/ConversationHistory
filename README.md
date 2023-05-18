# Getting Started

To get the app running follow these steps after cloning by entering these commands into your terminal
- `bundle`
- `rails db:create`
- `rails db:migrate`
- `rails db:seed` to load some random projects
- `rails s` to start the server
- visit `http://localhost:3000/projects` to see the list of available projects
- click on any project to see its history, some of it has been populated but you can add some more

### Run tests

Make sure you have run the bundler the follow these steps:

- `rails db:migrate RAILS_ENV=test`
- `rspec` to run all the tests

### Questions I would have asked:

q: should the conversation history follow some type of order\
a: yes, preferably we want to see the newer information first\
q: do we want to know who wrote the comment?\
a: having a username or some type of identifier will make the history more meaningful\
q: do we care to see the timestamp? if so do we have a preferred format?\ 
a: having a timestamp will be useful as it allows to know when the event occurred\
q: will we need database indexing?\ 
a: possibly but we can always add indexing when we feel we need it as there is no obvious case for it at the moment

### Limitations

- the biggest limitation from a user perspective is the inability to create the project. Whilst is a relatively simple task its not part of the requirement. The requirements assume that you already have projects and you are adding more to the functionality hence why I opted for seed data
- I also did not use feature specs because of time and also the MVC is properly tested on each level.
- The styling is minimal, getting the core requirements was the priority
- For the type of application this is in size, I also would consider something like Sinatra. At this stage it does not need to rails although can argue that apps grow over time so best to be prepared


### Improvements

- Some integration specs would give a sense of security
- Database indexing can be added in the future in order to improve querying
- For the amount of code we have in the controllers, I did not see a need to use service objects but I tend to always prefer those as they lead to cleaner code and even better testing
- Mocking where necessary in specs
- The front end could use more styling
- Introducing action cable to make the user experience even better




