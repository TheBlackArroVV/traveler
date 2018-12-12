

# Group Posts


## Posts [/posts]


### Get a post [GET /api/v1/posts/{id}]

+ Parameters
    + id: `1` (number, required)

+ Request returns 200
**GET**&nbsp;&nbsp;`/api/v1/posts/1`

    + Headers



+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "id": 1,
              "title": "MyString",
              "body": "MyString",
              "user_id": 2
            }
