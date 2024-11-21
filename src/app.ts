import cors from 'cors';
import dotenv from 'dotenv';
import express from 'express';

dotenv.config();

const app = express();
const port = process.env.PORT;

app.use(express.json());
app.use(cors());

app.listen(port, () => {
  return `HTTP Server is running on port: http://localhost:${port}`;
});
