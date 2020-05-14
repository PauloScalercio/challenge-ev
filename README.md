# Desafio Estante Virtual

This project is an implementation of the [Estante Virtual's code challenge](https://github.com/estantevirtual/vagas/blob/master/desafios/backend.md).

As the Olimpic Games gets closer, we were requested to build an REST API using Ruby for the COB (Brazilian Olimpic committee).

This API will be responsible for storing and addressing the winners of some sports.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.



### Prerequisites


DISCLAIMER: This project was built using Ruby 2.5.1 and Rails 5.2.4

You can get Ruby [here](https://www.ruby-lang.org/pt/documentation/installation/) and Rails [here](http://installrails.com/)

- The first thing to be done is to get a copy of the project. Feel free to decide how to do it (dowloading or cloning)

```
git clone git@github.com:PauloScalercio/challenge-ev.git
```

This will get you a copy of the project.



### Installing

Now is time to go through the instalation process.

- Install the project dependencies

```
bundle install
```

- Set up the local database ( SQLITE )

```
rake db:create 
```
> create the database

```
rake db:migrate 

```
> build the tables (competition, result and athlete)

```
rake db:seed

```
> populate the database with some fictional entries. (testing purposes)

- Now you are all set, run the application using:

```
rails server
```
> after this step the application will be listening on localhost:3000

- I recommend using Postman or Insomnia to test the API, but you can already try the GET request! 

```
http://localhost:3000/competitions
```

## API Docs

### Competitions

- Payload:

```
{
  "id": 1,
  "name": string,
  "unit": string,
  "finished": boolean,
  "win_definition": string,
  "max_attempts": integer,
  "ranking": array,
}
```

```
name: Competition name (mandatory)
unit: Measure unit for the competition (mandatory)
finished: Competition status
max_attempts: Number of attempts per athlete 
win_definition: Definition for ranking the results (max or min)
ranking: Ordered array containing the rank
```

#### GET

Returns all competitions without rankings.
```
http://localhost:3000/competitions/
```

Returns the competition with that specific id value
```
http://localhost:3000/competitions/:id
```

#### PATCH

Updates an competition, returns the updated competition

```
http://localhost:3000/competitions/:id

body must contain the update target with the new value.
ex:

{
    "name":"new name"
}
```

Finishes an competition, returns the finished competition with the ranking

```
http://localhost:3000/competitions/:id/finish
```

#### DELETE

Destroys a competition, returns no value.
```
http://localhost:3000/competitions/:id/
```

### Results

- Payload
```
{
  "id": 10,
  "result_value": integer,
  "athlete_name": string,
  "competition_name": string
}
```

#### GET

Returns all results.
```
http://localhost:3000/results/
```

Returns the specific result for the given id value
```
http://localhost:3000/results/:id
```

#### POST


Create a new result for a competition.
```
http://localhost:3000/results
```

##### Case 1: Existing athlete and competition

Returns the created result
```
http://localhost:3000/results

body example:

{

  "result_value": integer, (mandatory)
  "athlete_id": string, (mandatory)
  "competition_id": string (mandatory)

}
```

##### Case 2: Non-existing athlete or competition

Returns the created result
```
http://localhost:3000/results

body example:

{

  "result_value": integer, (mandatory)
  "athlete_name": string, (mandatory)
  "competition_name": string (mandatory)
  "unit": string (mandatory)

  "max_attempts": integer (optional) // default: 1
  "win_definition": string (optional) // default: "max"

}
```


## Running the tests

There are some tests written for this API, but there is a lot of more tests that still need to be done.

- To run the tests:

```
bundle exec rspec
```

## Deployment

This API is a prototype and should not be used on live systems.

## Built With

* [Ruby](https://www.ruby-lang.org/pt/documentation/installation/) - Programmer best friend
* [Rails](https://rubyonrails.org/) - Ruby framework
* [Rspec](https://rspec.info/) - Behavior Driven Development for Ruby


## Versioning

Git was used for versioning.

## Authors

* **Paulo Scalercio** - *API* - [PauloScalercio](https://github.com/PauloScalercio)

## Acknowledgments

* A lot of Ruby tutorial videos out there
* Ruby Docs and community
* etc

