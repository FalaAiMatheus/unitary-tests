import { ProductController } from '@/controllers/product.controller';
import express from 'express';

const router = express.Router();
const productController = new ProductController();

router.get('/product', productController.getProducts);
router.get('/product/:id', productController.getProduct);
router.post('/product', productController.saveProduct);

export default router;
