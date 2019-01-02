

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
                "user_id": 2
              },
              {
                "id": 2,
                "title": "MyString",
                "body": "MyString",
                "user_id": 3
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
              "user_id": 5
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
              "user_id": 6
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
              "user_id": 8
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
