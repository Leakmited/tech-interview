# NEST JS

## How to run?

### Run pg databse + Drizzle

Go to `/sql` then run `docker compose up --build`

To check it's ok, go to `https://local.drizzle.studio/` and it should display a Drizzle editor.

## Mission 1 - Coding Stuff

If you take a look at the pg database, there is a table `users`, we want to create an endpoint that will return all users, please help us to do it 🙏

## Mission 2 - Discussion

### Discussion 1 - Security

Great, now we agree that it's not a good practice to return all users on an endpoint accessible by everyone.

What would you do to protect it?

### Discussion 2 - Team work

Given that you are a backend developer, how would you share endpoints to frontend team? How could they know wich endpoint will return what and which params are availables?
