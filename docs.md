

# Group Cities


## Cities [/cities]


### Get a Cities [GET /api/v1/cities]


+ Request is eql cities
**GET**&nbsp;&nbsp;`/api/v1/cities`

    + Headers



+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            [
              {
                "id": 1,
                "name": "MyString",
                "country_id": 1,
                "created_at": "2019-01-09T14:06:59.642Z",
                "updated_at": "2019-01-09T14:06:59.642Z"
              },
              {
                "id": 2,
                "name": "MyString",
                "country_id": 1,
                "created_at": "2019-01-09T14:06:59.648Z",
                "updated_at": "2019-01-09T14:06:59.648Z"
              },
              {
                "id": 3,
                "name": "MyString",
                "country_id": 1,
                "created_at": "2019-01-09T14:06:59.653Z",
                "updated_at": "2019-01-09T14:06:59.653Z"
              },
              {
                "id": 4,
                "name": "MyString",
                "country_id": 1,
                "created_at": "2019-01-09T14:06:59.658Z",
                "updated_at": "2019-01-09T14:06:59.658Z"
              },
              {
                "id": 5,
                "name": "MyString",
                "country_id": 1,
                "created_at": "2019-01-09T14:06:59.662Z",
                "updated_at": "2019-01-09T14:06:59.662Z"
              }
            ]

# Group Countries


## Countries [/countries]


### Get a Countries [GET /api/v1/countries]


+ Request is eql countries
**GET**&nbsp;&nbsp;`/api/v1/countries`

    + Headers



+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            [
              {
                "id": 2,
                "name": "MyString",
                "created_at": "2019-01-09T14:06:59.808Z",
                "updated_at": "2019-01-09T14:06:59.808Z"
              },
              {
                "id": 3,
                "name": "MyString",
                "created_at": "2019-01-09T14:06:59.811Z",
                "updated_at": "2019-01-09T14:06:59.811Z"
              },
              {
                "id": 4,
                "name": "MyString",
                "created_at": "2019-01-09T14:06:59.813Z",
                "updated_at": "2019-01-09T14:06:59.813Z"
              },
              {
                "id": 5,
                "name": "MyString",
                "created_at": "2019-01-09T14:06:59.815Z",
                "updated_at": "2019-01-09T14:06:59.815Z"
              },
              {
                "id": 6,
                "name": "MyString",
                "created_at": "2019-01-09T14:06:59.817Z",
                "updated_at": "2019-01-09T14:06:59.817Z"
              }
            ]

# Group Posts


## Posts [/posts]


### Get a posts [GET /api/v1/posts]


+ Request returns 200
**GET**&nbsp;&nbsp;`/api/v1/posts`

    + Headers



+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            [
              {
                "id": 1,
                "title": "MyString",
                "body": "MyString",
                "user_id": 4
              },
              {
                "id": 2,
                "title": "MyString",
                "body": "MyString",
                "user_id": 5
              }
            ]

### Get a post [GET /api/v1/posts/{id}]

+ Parameters
    + id: `3` (number, required)

+ Request returns 200
**GET**&nbsp;&nbsp;`/api/v1/posts/3`

    + Headers



+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "id": 3,
              "title": "MyString",
              "body": "MyString",
              "user_id": 7
            }

### Create a post [POST /api/v1/posts]


+ Request returns 200
**POST**&nbsp;&nbsp;`/api/v1/posts`

    + Headers

            Content-Type: application/x-www-form-urlencoded

    + Body

            post%5Bbody%5D=MyText&post%5Btitle%5D=MyString

+ Response 201

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "id": 4,
              "title": "MyString",
              "body": "MyText",
              "user_id": 8
            }

### Delete a post [DELETE /api/v1/posts/{id}]

+ Parameters
    + id: `5` (number, required)

+ Request returns 200
**DELETE**&nbsp;&nbsp;`/api/v1/posts/5`

    + Headers

            Content-Type: application/x-www-form-urlencoded

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "id": 5,
              "title": "MyString",
              "body": "MyString",
              "user_id": 9
            }

### Update a post [PATCH /api/v1/posts/{id}]

+ Parameters
    + id: `6` (number, required)

+ Request returns 200
**PATCH**&nbsp;&nbsp;`/api/v1/posts/6`

    + Headers

            Content-Type: application/x-www-form-urlencoded

    + Body

            post%5Btitle%5D=NewTitle

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "id": 6,
              "title": "NewTitle",
              "body": "MyString",
              "user_id": 10
            }

# Group Profiles


## Profiles [/profiles]


### Get a posts [GET /api/v1/users/profiles]


+ Request is eql user profile
**GET**&nbsp;&nbsp;`/api/v1/users/profiles`

    + Headers



+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "id": 42,
              "user_id": 42,
              "about": null,
              "avatar": {
                "url": null
              }
            }

### Update a post [PATCH /api/v1/users/profiles]


+ Request is eql params
**PATCH**&nbsp;&nbsp;`/api/v1/users/profiles`

    + Headers

            Content-Type: application/x-www-form-urlencoded

    + Body

            profile%5Babout%5D=about

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "id": 43,
              "user_id": 43,
              "about": "about",
              "avatar": {
                "url": null
              }
            }

# Group Sights


## Sights [/sights]


### Get a sights [GET /api/v1/sights]


+ Request is eql sights
**GET**&nbsp;&nbsp;`/api/v1/sights`

    + Headers



+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            [
              {
                "id": 1,
                "name": "MyString",
                "description": "MyString",
                "city_id": 6,
                "created_at": "2019-01-09T14:07:00.045Z",
                "updated_at": "2019-01-09T14:07:00.045Z"
              },
              {
                "id": 2,
                "name": "MyString",
                "description": "MyString",
                "city_id": 6,
                "created_at": "2019-01-09T14:07:00.049Z",
                "updated_at": "2019-01-09T14:07:00.049Z"
              },
              {
                "id": 3,
                "name": "MyString",
                "description": "MyString",
                "city_id": 6,
                "created_at": "2019-01-09T14:07:00.051Z",
                "updated_at": "2019-01-09T14:07:00.051Z"
              },
              {
                "id": 4,
                "name": "MyString",
                "description": "MyString",
                "city_id": 6,
                "created_at": "2019-01-09T14:07:00.054Z",
                "updated_at": "2019-01-09T14:07:00.054Z"
              },
              {
                "id": 5,
                "name": "MyString",
                "description": "MyString",
                "city_id": 6,
                "created_at": "2019-01-09T14:07:00.056Z",
                "updated_at": "2019-01-09T14:07:00.056Z"
              }
            ]

### Create a sight [POST /api/v1/sights]


+ Request is eql params
**POST**&nbsp;&nbsp;`/api/v1/sights`

    + Headers

            Content-Type: application/x-www-form-urlencoded

    + Body

            sight%5Bcity_id%5D=7&sight%5Bdescription%5D=description+sight&sight%5Bname%5D=Sight

+ Response 201

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "id": 6,
              "name": "Sight",
              "description": "description sight",
              "city_id": 7,
              "created_at": "2019-01-09T14:07:00.091Z",
              "updated_at": "2019-01-09T14:07:00.091Z"
            }

### Get a sight [GET /api/v1/sights/{id}]

+ Parameters
    + id: `7` (number, required)

+ Request is eql sight
**GET**&nbsp;&nbsp;`/api/v1/sights/7`

    + Headers



+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "id": 7,
              "name": "MyString",
              "description": "MyString",
              "city_id": 8,
              "created_at": "2019-01-09T14:07:00.128Z",
              "updated_at": "2019-01-09T14:07:00.128Z"
            }

### Delete a sight [DELETE /api/v1/sights/{id}]

+ Parameters
    + id: `8` (number, required)

+ Request changes count
**DELETE**&nbsp;&nbsp;`/api/v1/sights/8`

    + Headers

            Content-Type: application/x-www-form-urlencoded

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body



### Update a sight [PATCH /api/v1/sights/{id}]

+ Parameters
    + id: `9` (number, required)

+ Request is eql new name
**PATCH**&nbsp;&nbsp;`/api/v1/sights/9`

    + Headers

            Content-Type: application/x-www-form-urlencoded

    + Body

            sight%5Bname%5D=NewSightName

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "id": 9,
              "name": "NewSightName",
              "city_id": 10,
              "description": "MyString",
              "created_at": "2019-01-09T14:07:00.204Z",
              "updated_at": "2019-01-09T14:07:00.213Z"
            }

### Like a sight [PATCH /api/v1/sights/{id}/like]

+ Parameters
    + id: `10` (number, required)

+ Request change sight count
**PATCH**&nbsp;&nbsp;`/api/v1/sights/10/like`

    + Headers

            Content-Type: application/x-www-form-urlencoded

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body



### Dislike a sight [PATCH /api/v1/sights/{id}/dislike]

+ Parameters
    + id: `11` (number, required)

+ Request change sight count
**PATCH**&nbsp;&nbsp;`/api/v1/sights/11/dislike`

    + Headers

            Content-Type: application/x-www-form-urlencoded

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body



# Group Topics


## Topics [/topics]


### Get a topics [GET /api/v1/topics]


+ Request is eql topics
**GET**&nbsp;&nbsp;`/api/v1/topics`

    + Headers



+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            [
              {
                "id": 1,
                "title": "MyString",
                "description": "MyString",
                "user_id": 19,
                "created_at": "2019-01-09T14:07:00.335Z",
                "updated_at": "2019-01-09T14:07:00.335Z"
              },
              {
                "id": 2,
                "title": "MyString",
                "description": "MyString",
                "user_id": 20,
                "created_at": "2019-01-09T14:07:00.352Z",
                "updated_at": "2019-01-09T14:07:00.352Z"
              },
              {
                "id": 3,
                "title": "MyString",
                "description": "MyString",
                "user_id": 21,
                "created_at": "2019-01-09T14:07:00.368Z",
                "updated_at": "2019-01-09T14:07:00.368Z"
              },
              {
                "id": 4,
                "title": "MyString",
                "description": "MyString",
                "user_id": 22,
                "created_at": "2019-01-09T14:07:00.385Z",
                "updated_at": "2019-01-09T14:07:00.385Z"
              },
              {
                "id": 5,
                "title": "MyString",
                "description": "MyString",
                "user_id": 23,
                "created_at": "2019-01-09T14:07:00.402Z",
                "updated_at": "2019-01-09T14:07:00.402Z"
              }
            ]

### Get a topic [GET /api/v1/topics/{id}]

+ Parameters
    + id: `6` (number, required)

+ Request is eql to topic
**GET**&nbsp;&nbsp;`/api/v1/topics/6`

    + Headers



+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "id": 6,
              "title": "MyString",
              "description": "MyString",
              "user_id": 25,
              "created_at": "2019-01-09T14:07:00.449Z",
              "updated_at": "2019-01-09T14:07:00.449Z"
            }

### Delete a topic [DELETE /api/v1/topics/{id}]

+ Parameters
    + id: `7` (number, required)

+ Request response
**DELETE**&nbsp;&nbsp;`/api/v1/topics/7`

    + Headers

            Content-Type: application/x-www-form-urlencoded

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body



### Create a topic [POST /api/v1/topics]


+ Request is eql topic_params
**POST**&nbsp;&nbsp;`/api/v1/topics`

    + Headers

            Content-Type: application/x-www-form-urlencoded

    + Body

            topic%5Bdescription%5D=topic_description&topic%5Btitle%5D=topic_title

+ Response 201

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "id": 8,
              "title": "topic_title",
              "description": "topic_description",
              "user_id": 27,
              "created_at": "2019-01-09T14:07:00.511Z",
              "updated_at": "2019-01-09T14:07:00.511Z"
            }

# Group Trips


## Trips [/trips]


### Get a trips [GET /api/v1/trips]


+ Request must be eql in length
**GET**&nbsp;&nbsp;`/api/v1/trips`

    + Headers



+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            [
              {
                "id": 1,
                "description": "description",
                "budget": "100",
                "max_members": 10,
                "city_id": 13,
                "user_id": 29,
                "created_at": "2019-01-09T14:07:00.575Z",
                "updated_at": "2019-01-09T14:07:00.575Z"
              },
              {
                "id": 2,
                "description": "description",
                "budget": "100",
                "max_members": 10,
                "city_id": 14,
                "user_id": 30,
                "created_at": "2019-01-09T14:07:00.592Z",
                "updated_at": "2019-01-09T14:07:00.592Z"
              },
              {
                "id": 3,
                "description": "description",
                "budget": "100",
                "max_members": 10,
                "city_id": 15,
                "user_id": 31,
                "created_at": "2019-01-09T14:07:00.611Z",
                "updated_at": "2019-01-09T14:07:00.611Z"
              },
              {
                "id": 4,
                "description": "description",
                "budget": "100",
                "max_members": 10,
                "city_id": 16,
                "user_id": 32,
                "created_at": "2019-01-09T14:07:00.629Z",
                "updated_at": "2019-01-09T14:07:00.629Z"
              },
              {
                "id": 5,
                "description": "description",
                "budget": "100",
                "max_members": 10,
                "city_id": 17,
                "user_id": 33,
                "created_at": "2019-01-09T14:07:00.648Z",
                "updated_at": "2019-01-09T14:07:00.648Z"
              }
            ]

### Create a trip [POST /api/v1/trips]


+ Request is eql to params
**POST**&nbsp;&nbsp;`/api/v1/trips`

    + Headers

            Content-Type: application/x-www-form-urlencoded

    + Body

            trip%5Bbudget%5D=100&trip%5Bcity_id%5D=18&trip%5Bdescription%5D=trip&trip%5Bmax_members%5D=10

+ Response 201

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "id": 6,
              "description": "trip",
              "budget": "100",
              "max_members": 10,
              "city_id": 18,
              "user_id": 34,
              "created_at": "2019-01-09T14:07:00.686Z",
              "updated_at": "2019-01-09T14:07:00.686Z"
            }

### Get a trip [GET /api/v1/trips/{id}]

+ Parameters
    + id: `7` (number, required)

+ Request must be eql to trip
**GET**&nbsp;&nbsp;`/api/v1/trips/7`

    + Headers



+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "id": 7,
              "description": "description",
              "budget": "100",
              "max_members": 10,
              "city_id": 19,
              "user_id": 36,
              "created_at": "2019-01-09T14:07:00.736Z",
              "updated_at": "2019-01-09T14:07:00.736Z"
            }

### Delete a trip [DELETE /api/v1/trips/{id}]

+ Parameters
    + id: `8` (number, required)

+ Request change trip count
**DELETE**&nbsp;&nbsp;`/api/v1/trips/8`

    + Headers

            Content-Type: application/x-www-form-urlencoded

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body



### Update a trip [PATCH /api/v1/trips/{id}]

+ Parameters
    + id: `9` (number, required)

+ Request response
**PATCH**&nbsp;&nbsp;`/api/v1/trips/9`

    + Headers

            Content-Type: application/x-www-form-urlencoded

    + Body

            trip%5Bdescription%5D=new_description

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "id": 9,
              "user_id": 39,
              "description": "new_description",
              "city_id": 21,
              "budget": "100",
              "max_members": 10,
              "created_at": "2019-01-09T14:07:00.813Z",
              "updated_at": "2019-01-09T14:07:00.824Z"
            }

### Join to trip [PATCH /api/v1/trips/{id}/join]

+ Parameters
    + id: `10` (number, required)

+ Request change membership count
**PATCH**&nbsp;&nbsp;`/api/v1/trips/10/join`

    + Headers

            Content-Type: application/x-www-form-urlencoded

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body


