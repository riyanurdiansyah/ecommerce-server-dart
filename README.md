## E-COMMERCE SERVER APP BUILD USING DART
#### REQUEST - `/auth/signin`

- Body
```
{
    "email": "testing@gmail.com",
    "password": "testing@123"
}
```

#### RESPONSE

```
{
    "status": 200,
    "message": "Success",
    "data": {
        "access_token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiJhdXRoZW50aWNhdGVkIiwiZXhwIjoxNjU1ODY0OTY2LCJzdWIiOiI3M2ZkMTc4Yi0yOWE5LTQ2OWQtYTlhZS0xZmZjNjVjZGIyYmYiLCJlbWFpbCI6InJpeWFucy5hcmthZGVtaUBnbWFpbC5jb20iLCJwaG9uZSI6IiIsImFwcF9tZXRhZGF0YSI6eyJwcm92aWRlciI6ImVtYWlsIiwicHJvdmlkZXJzIjpbImVtYWlsIl19LCJ1c2VyX21ldGFkYXRhIjp7fSwicm9sZSI6ImF1dGhlbnRpY2F0ZWQifQ.wphUieNE6MdzywUDtwCcHypWrNQCDCi6529BhCb1ydU",
        "expires_in": 3600,
        "refresh_token": "cF7NkOs-nJv2KeJjkRabgQ",
        "token_type": "bearer",
        "provider_token": null,
        "user": {
            "id": "73fd178b-29a9-469d-a9ae-1ffc65cdb2bf",
            "app_metadata": {
                "provider": "email",
                "providers": [
                    "email"
                ]
            },
            "user_metadata": {},
            "aud": "authenticated",
            "email": "riyans.arkademi@gmail.com",
            "phone": "",
            "created_at": "2022-06-21T14:28:54.327786Z",
            "confirmed_at": "2022-06-21T14:28:54.332112Z",
            "email_confirmed_at": "2022-06-21T14:28:54.332112Z",
            "phone_confirmed_at": null,
            "last_sign_in_at": "2022-06-22T01:29:26.847130846Z",
            "role": "authenticated",
            "updated_at": "2022-06-22T01:29:26.848466Z"
        }
    }
}
```

#### REQUEST - `/auth/signup`

- Body

```
{
    "name" : "User Testing",
    "email": "usertestin1234g@gmail.com",
    "username" : "usertesting1234",
    "password": "usertesting@123"
}
```

#### RESPONSE

```
{
    "status": 200,
    "message": "Success",
    "data": {
        "access_token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiJhdXRoZW50aWNhdGVkIiwiZXhwIjoxNjU1ODY0OTc4LCJzdWIiOiIyMWQ0NmJlNi1hMmJhLTRkNTItOWI3Yi0yOWEyZWI0NTYxYTgiLCJlbWFpbCI6InVzZXJ0ZXN0aW4xMjM0Z0BnbWFpbC5jb20iLCJwaG9uZSI6IiIsImFwcF9tZXRhZGF0YSI6eyJwcm92aWRlciI6ImVtYWlsIiwicHJvdmlkZXJzIjpbImVtYWlsIl19LCJ1c2VyX21ldGFkYXRhIjp7fSwicm9sZSI6ImF1dGhlbnRpY2F0ZWQifQ.r-FbL6KG0vVRNNmH-5qJ4n020U2gwpFnkcbmLKub2PM",
        "expires_in": 3600,
        "refresh_token": "MA7Y9mOl1jpPVkQaQGwRrg",
        "token_type": "bearer",
        "provider_token": null,
        "user": {
            "id": "21d46be6-a2ba-4d52-9b7b-29a2eb4561a8",
            "app_metadata": {
                "provider": "email",
                "providers": [
                    "email"
                ]
            },
            "user_metadata": {},
            "aud": "authenticated",
            "email": "usertestin1234g@gmail.com",
            "phone": "",
            "created_at": "2022-06-22T01:29:38.60888Z",
            "confirmed_at": null,
            "email_confirmed_at": "2022-06-22T01:29:38.613237367Z",
            "phone_confirmed_at": null,
            "last_sign_in_at": "2022-06-22T01:29:38.616562163Z",
            "role": "authenticated",
            "updated_at": "2022-06-22T01:29:38.61763Z"
        }
    }
}
```


#### REQUEST - `/auth/signup/phone`

- Body

```
{
    "handphone" : "0812818281",
}
```

#### RESPONSE

```
{
    "status": 200,
    "message": "Success",
    "data": {
        "access_token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiJhdXRoZW50aWNhdGVkIiwiZXhwIjoxNjU1ODY0OTc4LCJzdWIiOiIyMWQ0NmJlNi1hMmJhLTRkNTItOWI3Yi0yOWEyZWI0NTYxYTgiLCJlbWFpbCI6InVzZXJ0ZXN0aW4xMjM0Z0BnbWFpbC5jb20iLCJwaG9uZSI6IiIsImFwcF9tZXRhZGF0YSI6eyJwcm92aWRlciI6ImVtYWlsIiwicHJvdmlkZXJzIjpbImVtYWlsIl19LCJ1c2VyX21ldGFkYXRhIjp7fSwicm9sZSI6ImF1dGhlbnRpY2F0ZWQifQ.r-FbL6KG0vVRNNmH-5qJ4n020U2gwpFnkcbmLKub2PM",
        "expires_in": 3600,
        "refresh_token": "MA7Y9mOl1jpPVkQaQGwRrg",
        "token_type": "bearer",
        "provider_token": null,
        "user": {
            "id": "21d46be6-a2ba-4d52-9b7b-29a2eb4561a8",
            "app_metadata": {
                "provider": "email",
                "providers": [
                    "email"
                ]
            },
            "user_metadata": {},
            "aud": "authenticated",
            "email": "usertestin1234g@gmail.com",
            "phone": "",
            "created_at": "2022-06-22T01:29:38.60888Z",
            "confirmed_at": null,
            "email_confirmed_at": "2022-06-22T01:29:38.613237367Z",
            "phone_confirmed_at": null,
            "last_sign_in_at": "2022-06-22T01:29:38.616562163Z",
            "role": "authenticated",
            "updated_at": "2022-06-22T01:29:38.61763Z"
        }
    }
}
```