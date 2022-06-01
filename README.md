# README

## Tea Subscription API
This is a REST API for a tea subscription service to:
- View a customer's active and cancelled subscriptions
- Create a tea subscription for a customer
- Cancel a subscription

### Primary Technologies

  - Ruby 2.7.4
  - Rails 5.2.8
  - PostgreSQL


### Local Set-Up

Fork and clone this repository to your local machine then

`bundle install`

`rails db:{create,migrate,seed}`


### Testing

Testing is done with [RSpec](https://rspec.info/) with coverage details provided by [SimpleCov](https://github.com/simplecov-ruby/simplecov).

#### Test Suite Execution

`bundle exec rspec`


### Database Design

![Screen Shot 2022-06-01 at 6 28 09 PM](https://user-images.githubusercontent.com/79022527/171515264-fea0effd-094f-4346-a493-18dc6df70d60.png)

### Endpoints

`GET /api/v1/customers/:customer_id/subscriptions`

Response:

```
{
    "id": "10",
    "type": "subscription",
    "attributes": {
        "id": 10,
        "title": "forrest",
        "price": 8,
        "status": "cancelled",
        "frequency": "Monthly"
    }
},
{
    "id": "11",
    "type": "subscription",
    "attributes": {
        "id": 11,
        "title": "mike wasowski",
        "price": 11.11,
        "status": "active",
        "frequency": "Annually"
    }
}
```


`POST /api/v1/customers/:customer_id/subscriptions`

With the required body:
```
{
  "title": "awesome tea",
  "price": 2.54,
  "status": "active",
  "frequency": "Monthly",
  "customer_id": 1,
  "tea_id": 1
  }
```
Response:
```
{
  "title": "awesome tea",
  "price": 2.54,
  "status": "active",
  "frequency": "Monthly",
  "customer_id": 1,
  "tea_id": 1
  }
```

`PATCH /api/v1/customers/:customer_id/subscriptions/:id`
With the required body:
```
{
  "status": "cancelled"
}
```

Response:
```
{
    "id": "5",
    "type": "subscription",
    "attributes": {
        "id": 11,
        "title": "sweet tea",
        "price": 9.99,
        "status": "cancelled",
        "frequency": "Monthly"
    }
}
```

### Contributors

Blake Dempsey
- [LinkedIn](https://www.linkedin.com/in/blake-dempsey/)
- [GitHub](https://github.com/bdempsey864)
