## User Stories

* As a user, I want to be able to add, update, delete and list shoe stores.

* As a user, I want to be able to add shoe brands in the application (don't worry about updating, listing or destroying shoe brands).

* As a user, I want to be able to add shoe brands to a store to show where they are sold.

* As a user, I want to be able to see all of the brands a store sells on the individual store page.

* As a user, I want store names and shoe brands to be saved with a capital letter no matter how I enter them.

* As a user, I do not want stores and shoes to be saved if I enter a blank name.

## Creating a database for this app in PostgreSQL

    CREATE DATABASE shoe_brands;
    CREATE TABLE brands (id serial PRIMARY KEY, name varchar)
    CREATE TABLE stores (id serial PRIMARY KEY, name varchar)

## Installation

Clone this repository from https://github.com/stok0102/shoe_brands


## Contributing

1. Fork
2. Create your feature branch: `git checkout -b my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin my-new-feature`
5. Submit a pull request

## Credits

By Caleb Stokka

## License

MIT License. Copyright &copy; 2016 "Caleb Stokka
