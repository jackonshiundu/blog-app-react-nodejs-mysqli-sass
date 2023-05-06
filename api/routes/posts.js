import express, { Router } from 'express';
import {
  addpost,
  deletePost,
  getPost,
  getPosts,
  updatePost,
} from '../contollers/postcontroller.js';
const router = express.Router();
router.get('/posts', getPosts);

router.post('/addpost', addpost);
router.get('/:id', getPost);
router.delete('/:id', deletePost);
router.put('/:id', updatePost);
export default router;
