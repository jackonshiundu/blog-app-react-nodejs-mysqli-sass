import { db } from '../db.js';
import jwt from 'jsonwebtoken';
export const addpost = (req, res) => {
  const token = req.cookie.access_token;
  if (token) return res.status(401).json('Not Authenticated');
  jwt.verify(token, 'jwtkey', (err, userInfo) => {
    if (err) return res.status(403).jason('Token is not Valid');
    const q =
      'INSERT INTO posts `title`, `description`, `category`, `img`,  `date`, `userId` VALUES(?';
    const values = [
      req.body.title,
      req.body.description,
      req.body.cat,
      req.body.img,
      req.body.date,
    ];
    db.query(q, [values], (err, data) => {
      if (err) return res.status(500).json(err);

      return res.json('Post has benn created');
    });
  });
};
export const getPosts = (req, res) => {
  const q = req.query.category
    ? 'SELECT * FROM posts WHERE category=?'
    : 'SELECT * FROM posts ';

  db.query(q, [req.query.category], (err, data) => {
    if (err) return res.send(err);
    return res.status(200).json(data);
  });
};
export const getPost = (req, res) => {
  const q =
    'SELECT p.id ,`username`, `title`, `description`, p.img, `category`, `date` from user u JOIN posts p ON u.id=p.userid where p.id=?';

  db.query(q, [req.params.id], (err, data) => {
    if (err) return res.json(err);
    return res.status(200).json(data[0]);
  });
};
export const deletePost = (req, res) => {
  const token = req.cookie.access_token;
  if (token) return res.status(401).json('Not Authenticated');
  jwt.verify(token, 'jwtkey', (err, userInfo) => {
    if (err) return res.status(403).jason('Token is not Valid');

    const postId = req.params.id;
    const q = 'DELETE FROM posts WHERE `id`=? `userId`=?';
    db.query(q, [postId, userInfo.id], (err, data) => {
      if (err) return res.status(403).json('You can delete only your posts');

      return res.json('Post has been deleted ');
    });
  });
};
export const updatePost = (req, res) => {
  const token = req.cookie.access_token;
  if (token) return res.status(401).json('Not Authenticated');
  jwt.verify(token, 'jwtkey', (err, userInfo) => {
    if (err) return res.status(403).jason('Token is not Valid');
    const postId = req.params.id;
    const q =
      'UPDATE  posts set `title`=?, `description`=?, `category`=?, `img`=?  WHERE `id`=? AND `userId`=?';
    const values = [
      req.body.title,
      req.body.description,
      req.body.cat,
      req.body.img,
    ];
    db.query(q, [...values, postId, userInfo.id], (err, data) => {
      if (err) return res.status(500).json(err);

      return res.json('Post has benn Updated');
    });
  });
};
