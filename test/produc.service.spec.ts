import { expect, it } from 'vitest';
import { ProductService } from '../src/services/product.service';

it('get product by id returns a Product object', async () => {
  const productService = new ProductService();
  const product = await productService.findById(1);
  expect(product).toMatchObject({
    name: expect.any(String),
    tissue: expect.any(String),
    internalStructure: expect.any(String),
    baseBox: expect.any(String),
    heightOfFeet: expect.any(Number),
    totalHeight: expect.any(Number),
    image: expect.any(String),
    baseMeasurement: {
      height: expect.any(Number),
      length: expect.any(Number),
      width: expect.any(Number),
    },
    medicalMattress: {
      height: expect.any(Number),
      length: expect.any(Number),
      width: expect.any(Number),
    },
  });
});
