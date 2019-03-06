# !FB

Created By: Anna Lornitzo & Sharon Mertens

#### Deployed on Heroku:
Deployed on Heroku Backend: https://antifb.herokuapp.com/

Deployed on Heroku Frontend: https://notfb.herokuapp.com/

GitHub:
Anna Lornitzo: https://github.com/lornitzoa/_fb_api

GitHub: Sharon Mertens: https://github.com/sharonmertens/_fb_api


  * Ruby version: 2.6.1

  * postgres
  * rails db:create

Create POSTS table:
  ```
CREATE TABLE posts (id SERIAL, text TEXT, image VARCHAR(256), link VARCHAR(256), likes INT, dislikes INT, author VARCHAR(256));
INSERT INTO posts (text, image, link, likes, dislikes, author) VALUES ('this is post 1', 'http://www.image1.com', 'http://www.link1.com', 0, 0, 'author1');
INSERT INTO posts (text, image, link, likes, dislikes, author) VALUES ('this is post 2', 'http://www.image2.com', 'http://www.link2.com', 0, 0, 'author2');
INSERT INTO posts (text, image, link, likes, dislikes, author) VALUES ('this is post 3', 'http://www.image3.com', 'http://www.link3.com', 0, 0, 'author3');
INSERT INTO posts (text, image, link, likes, dislikes, author) VALUES ('this is post 4', 'http://www.image4.com', 'http://www.link4.com', 0, 0, 'author4');
INSERT INTO posts (text, image, link, likes, dislikes, author) VALUES ('this is post 5', 'http://www.image5.com', 'http://www.link5.com', 0, 0, 'author5');
```

Create USERS table:
```
CREATE TABLE users (id SERIAL, username VARCHAR(256), password VARCHAR(30), birthday DATE, image VARCHAR(256), bio TEXT);
```


#### Resources:
*
*
*
*
