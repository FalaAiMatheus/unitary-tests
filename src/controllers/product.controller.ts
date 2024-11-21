import { Request, Response } from 'express';
import { ProductService } from '@/services/product.service';

export class ProductController {
  private productRepo = new ProductService();

  getProduct = async (req: Request, res: Response) => {
    const id = req.params.id;
    if (!id) res.status(400).json({ message: 'Id é obrigatório' });

    const product = await this.productRepo.findById(Number(id));

    if (!product?.id) res.status(400).json({ message: 'Produto não existe' });

    res.status(200).json(product);
  };

  getProducts = async (req: Request, res: Response) => {
    const product = await this.productRepo.findAll();
    res.status(200).json(product);
  };

  saveProduct = async (req: Request, res: Response) => {
    const body = req.body;
    if (!body) res.status(400).json({ message: 'Body é obrigatório' });
    await this.productRepo.save(body);
    res.status(201).json({ message: 'Produto criado com sucesso!' });
  };
}
