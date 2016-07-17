# Blaclist API v1

#### Authorization:
-------------------------

```
POST /api/v1/login
```

| params | type | description |
|--------|------|-------|
| email | string | user email |
| password | string | user password|

Example:

http://162.243.112.29/api/v1/login?email=test@mail.ru&password=supersecret

Response:

```
{
  "access_token": "Uice4v-dLKszEzsSe-kbe9m-zSS76FAfzqGg7wOx4oE"
}
```
or
```
{
  "error": "Invalid email or password"
}
```

#### Registration:
-------------------------


```
POST /api/v1/sign_up
```

| params | type | description |
|--------|------|-------|
| email | string | user email |
| password | string | user password|

Example:

http://162.243.112.29/api/v1/sign_up?email=test@mail.ru&password=supersecret

Response:

```
{
  "access_token": "Uice4v-dLKszEzsSe-kbe9m-zSS76FAfzqGg7wOx4oE"
}
```
or
```
{
  "error": { 
            "email": ["has already been taken", "can't be blank", "is invalid"],
            "password": ["is too short (minimum is 6 characters)"] 
           }
}
```

#### Upgrade of user interests:
-------------------------

Setting interests subscription for user

```
POST /api/v1/user/interests
```

| params | type | description |
|--------|------|-------|
| access_token | string | user token that was got after authorization/registration |
| interests | ids through comma | the array of ids of interests that was got after request of interests |

Example:

http://162.243.112.29/api/v1/user/interests?interests=1,5,18,3&access_token=Uice4v-dLKszEzsSe-kbe9m-zSS76FAfzqGg7wOx4oE

Response:
```
  200
```
or
```
{
  "error": "provide <interests> param (id1,id2,id3...) format"
}
{
  "error": "Not Authorized"
}

```

#### Feed:
-------------------------

Getting the latest feed for authorized user

```
GET /api/v1/feed
```

| params | type | description |
|--------|------|-------|
| access_token | string | user token that was got after authorization/registration |
| page | integer | page to display |

Example:

http://162.243.112.29/api/v1/feed?access_token=Uice4v-dLKszEzsSe-kbe9m-zSS76FAfzqGg7wOx4oE

Response:
```
[
  ArticleObject, ArticleObject,...
]
```
or
```
{
  "error": "Not Authorized"
}
```

#### List of interests:
-------------------------

Getting list of interests with the latest articles

```
GET /api/v1/interests
```
without params.


Response:
```
[
  InterestObject, InterestObject,...
]
```

#### Fetch recent content of Homefeed
--------------------------------------
Getting list of recent feed content

--------------------------------------
GET/api/v1/feed

| params | type | description |
|--------|------|-------|
| access_token | string | user token that was got after authorization/registration |

Example:

http://162.243.112.29/api/v1/feed?access_token=Uice4v-dLKszEzsSe-kbe9m-zSS76FAfzqGg7wOx4oE

Response:
```
[
  FeedObject, FeedObject,...
]
```
or
```
{
  "error": "Not Authorized"
}
```

#### Fetch recent feed of Ketword set 
--------------------------------------
Getting list of keyword search feed content

--------------------------------------
GET/api/v1/feed

| params | type | description |
|--------|------|-------|
| access_token | string | user token that was got after authorization/registration |
| keyword | string | keyword that user type |

Example:

http://162.243.112.29/api/v1/feed?access_token=Uice4v-dLKszEzsSe-kbe9m-zSS76FAfzqGg7wOx4oE&keyword=event

Response:
```
[
  FeedObject, FeedObject,...
]
```
or
```
{
  "error": "Not Authorized"
}
```

#### Get trending articles from each category
--------------------------------------
Getting list of trending articles

--------------------------------------
GET/api/v1/articles

| params | type | description |
|--------|------|-------|
| access_token | string | user token that was got after authorization/registration |
| category | string | trending |

Example:

http://162.243.112.29/api/v1/articles?access_token=Uice4v-dLKszEzsSe-kbe9m-zSS76FAfzqGg7wOx4oE&keyword=event&category=trending

Response:
```
[
  ArticleObject, ArticleObject,...
]
```
or
```
{
  "error": "Not Authorized"
}
```

#### Get popular articles from each category
--------------------------------------
Getting list of popular articles

--------------------------------------
GET/api/v1/articles

| params | type | description |
|--------|------|-------|
| access_token | string | user token that was got after authorization/registration |
| category | string | popular |

Example:

http://162.243.112.29/api/v1/articles?access_token=Uice4v-dLKszEzsSe-kbe9m-zSS76FAfzqGg7wOx4oE&keyword=event&category=popular

Response:
```
[
  ArticleObject, ArticleObject,...
]
```
or
```
{
  "error": "Not Authorized"
}
```
#### Facebook login into Blaclist
--------------------------------------
login with facebook into blaclist

--------------------------------------
GET/api/v1/login

| params | type | description |
|--------|------|-------|
| facebook_id | string | id that was got after facebook registration |


Example:

http://162.243.112.29/api/v1/login?facebook_id=2131312314

Response:

```
{
  "access_token": "Uice4v-dLKszEzsSe-kbe9m-zSS76FAfzqGg7wOx4oE"
}
```
or
```
{
  "error": "Invalid email or password"
}
```

#### Twitter login into Blaclist
--------------------------------------
login with twitter into blaclist

--------------------------------------
GET/api/v1/login

| params | type | description |
|--------|------|-------|
| twitter_id| string | id that was got after twitter registration |


Example:

http://162.243.112.29/api/v1/login?twitter_id=53234324

Response:

```
{
  "access_token": "Uice4v-dLKszEzsSe-kbe9m-zSS76FAfzqGg7wOx4oE"
}
```
or
```
{
  "error": "Invalid email or password"
}
```

#### Get Trending Topics Content form Twitter API
--------------------------------------
Getting Trending Topics Content form Twitter API

--------------------------------------
GET/api/v1/feed

| params | type | description |
|--------|------|-------|
| twitter_id| string | id that was got after twitter registration |


Example:

http://162.243.112.29/api/v1/login?twitter_id=53234324

Response:

```
{
   FeedObject, FeedObject,...
}
```
or
```
{
  "error": "Invalid email or password"
}
```


#### Complex response objects:
-------------------------

*InterestObject* 
```
{
  id: 1,
  title: "Interest title",
  articles: [ArticleObject, ArticleObject, ArticleObject, ArticleObject, ArticleObject]
}
```

*ArticleObject* 
```
{
  id: 1,
  author_name: "author name",
  content: "General manager Rob Hennigan wants the Orlando Mag...",
  lead_image: "http: //i.cdn.turner.com/nba/nba/.element/img/nba_fb_gen_img.jpg",
  url: "http://www.nba.com/2016/news/02/17/orlando-magic-gm-playoff-spot-ap.ap/index.html?rss=true",
  title: "Magic GM Hennigan focused on making the playoffs",
  logo: "http://storage.googleapis.com/site-assets/_u_vSlHkdmOHkholdB9JXVZqya8C19tR2QaZdponea8_icon-14a5c7327e7",
  source_url: "http://www.nba.com/news",
  publish_date: "Wed, 17 Feb 2016 15:12:58 UTC +00:00"
}


```
