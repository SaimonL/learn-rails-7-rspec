# Rails 7 with Rspec 3 Example

This application is just an example of how to setup Rails 7 with Rspec 3 using Postgres.

## Environment Variables

To use this app you will need to setup the following Environment variables so it can connect to the postgres
database.

```
DB_HOST=localhost
DB_PORT=5432
DB_USER=
DB_PASSWORD=
```

## Rspec

To run the rspec just type:
```
bin/rspec spec
```

This project also uses parallel test which is optional.
Regular test without parallel finishes in around "Finished in 5.7 seconds (files took 4.27 seconds to load)"
Parallel test with 8 processes will finish around 9 seconds. Why? Because it takes 6.32 seconds to
scan all the test and then assign each cores specific sets of tests to perform. This number will also
change from computer to computer. So parallel test are very useful when you have lots of tests.


If you do want to use parallel test then run the following commands first to setup the database.

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
