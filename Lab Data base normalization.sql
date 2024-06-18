Table actor
  actor_id int [pk, increment]
  first_name varchar
  last_name varchar
  last_update timestamp
}

Table film {
  film_id int [pk, increment]
  title varchar
  description text
  release_year year
  language_id int [ref: > language.language_id]
  original_language_id int [ref: > language.language_id]
  rental_duration int
  rental_rate decimal
  length int
  replacement_cost decimal
  rating varchar
  last_update timestamp
}

Table category {
  category_id int [pk, increment]
  name varchar
  last_update timestamp
}

Table film_category {
  film_id int [pk, ref: > film.film_id]
  category_id int [pk, ref: > category.category_id]
  last_update timestamp
}

Table inventory {
  inventory_id int [pk, increment]
  film_id int [ref: > film.film_id]
  store_id int [ref: > store.store_id]
  last_update timestamp
}

Table rental {
  rental_id int [pk, increment]
  rental_date timestamp
  inventory_id int [ref: > inventory.inventory_id]
  customer_id int [ref: > customer.customer_id]
  return_date timestamp
  staff_id int [ref: > staff.staff_id]
  last_update timestamp
}

Table payment {
  payment_id int [pk, increment]
  customer_id int [ref: > customer.customer_id]
  staff_id int [ref: > staff.staff_id]
  rental_id int [ref: > rental.rental_id]
  amount decimal
  payment_date timestamp
  last_update timestamp
}

Table customer {
  customer_id int [pk, increment]
  store_id int [ref: > store.store_id]
  first_name varchar
  last_name varchar
  email varchar
  address_id int [ref: > address.address_id]
  active bool
  create_date date
  last_update timestamp
}

Table staff {
  staff_id int [pk, increment]
  first_name varchar
  last_name varchar
  address_id int [ref: > address.address_id]
  email varchar
  store_id int [ref: > store.store_id]
  active bool
  username varchar
  password varchar
  last_update timestamp
}

Table store {
  store_id int [pk, increment]
  manager_staff_id int [ref: > staff.staff_id]
  address_id int [ref: > address.address_id]
  last_update timestamp
}

Table address {
  address_id int [pk, increment]
  address varchar
  address2 varchar
  district varchar
  city_id int [ref: > city.city_id]
  postal_code varchar
  phone varchar
  last_update timestamp
}

Table city {
  city_id int [pk, increment]
  city varchar
  country_id int [ref: > country.country_id]
  last_update timestamp
}

Table country {
  country_id int [pk, increment]
  country varchar
  last_update timestamp
}

Table film_actor {
  film_id int [pk, ref: > film.film_id]
  actor_id int [pk, ref: > actor.actor_id]
  last_update timestamp
}

Table genre {
  genre_id int [pk, increment]
  name varchar
  last_update timestamp
}

Table film_genre {
  film_id int [pk, ref: > film.film_id]
  genre_id int [pk, ref: > genre.genre_id]
  last_update timestamp
Select title, length
