# Rails 7 with Rspec 3 Example

This application is just an example of how to setup Rails 7 with Rspec 3 using Postgres.


## Rspec

This project uses parallel test which is optional. If you do want to use parallel test then run the following first.

```
bin/rails parallel:create
bin/rails parallel:prepare
bin/rails parallel:migrate
```

Once you are ready to test run
```
bin/rails parallel:spec
```

Remember that everytime you create a new migration file you must run
```
bin/rails parallel:migrate
```
