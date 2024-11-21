import { Prisma, Product } from '@prisma/client';
import { PrismaService } from './prisma.service';

export class ProductService {
  private prisma = new PrismaService();

  async findById(id: number) {
    return await this.prisma.product.findUnique({
      where: { id },
      include: { baseMeasurement: true, medicalMattress: true },
    });
  }
  async findAll(): Promise<Product[]> {
    return await this.prisma.product.findMany({
      include: {
        baseMeasurement: true,
        medicalMattress: true,
      },
    });
  }
  async save(data: Prisma.ProductCreateInput) {
    return await this.prisma.product.create({
      data: {
        ...data,
      },
      include: {
        baseMeasurement: true,
        medicalMattress: true,
      },
    });
  }
}
