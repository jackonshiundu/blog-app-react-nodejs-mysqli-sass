import { db } from '../db.js';
import bcrypt from 'bcryptjs';
import jwt from 'jsonwebtoken';
export const register = (req, res) => {
  //check existing user
  const query = 'SELECT * FROM user where email=? or username=?';
  db.query(query, [req.body.email, req.query.username], (err, data) => {
    if (err) return res.json(err);

    if (data.length) return res.status(400).json('User Already Exists');

    //hashed password and create a user
    const salt = bcrypt.genSaltSync(10);
    const hashedpassword = bcrypt.hashSync(req.body.password, salt);
    const query = 'INSERT INTO user (username,email,password) VALUES (?,?,?)';
    const values = [req.body.username, req.body.email, hashedpassword];
    db.query(query, values, (err, data) => {
      if (err) return res.json(err);
      return res.status(200).json('User Has Been Created');
    });
  });
};
export const login = (req, res) => {
  //check if out user exists ir not
  const query = 'SELECT * FROM user WHERE username=?';
  db.query(query, [req.body.username], (err, data) => {
    if (err) return res.json(err);
    if (data.length === 0) {
      return res.status(404).json('User not found');
    }
    const isPasswordCorrect = bcrypt.compareSync(
      req.body.password,
      data[0].password
    );
    if (!isPasswordCorrect) {
      return res.status(404).json('Wrong  Passsword');
    }
    const token = jwt.sign({ id: data[0].id }, 'jwtkey');
    const { password, ...other } = data;
    [0];
    res
      .cookie('access_token', token, { httpOnly: true })
      .status(200)
      .json(other);
  });
};
export const logout = (req, res) => {
  res
    .clearCookie('access_token', {
      sameSite: 'none',
      secure: true,
    })
    .status(200)
    .json('User Has been logged out');
};
