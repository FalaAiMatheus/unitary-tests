-- CreateTable
CREATE TABLE "Product" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "tissue" TEXT NOT NULL,
    "internal_structure" TEXT NOT NULL,
    "base_box" TEXT NOT NULL,
    "height_of_feet" INTEGER NOT NULL,
    "total_height" INTEGER NOT NULL,
    "image" TEXT NOT NULL,
    "medical_mattress_id" INTEGER NOT NULL,
    "base_measurement_id" INTEGER NOT NULL,
    "created_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" DATETIME NOT NULL,
    CONSTRAINT "Product_medical_mattress_id_fkey" FOREIGN KEY ("medical_mattress_id") REFERENCES "MedicalMattress" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Product_base_measurement_id_fkey" FOREIGN KEY ("base_measurement_id") REFERENCES "BaseMeasurement" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "MedicalMattress" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "height" INTEGER NOT NULL,
    "length" INTEGER NOT NULL,
    "width" INTEGER NOT NULL,
    "created_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" DATETIME NOT NULL
);

-- CreateTable
CREATE TABLE "BaseMeasurement" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "height" INTEGER NOT NULL,
    "length" INTEGER NOT NULL,
    "width" INTEGER NOT NULL,
    "created_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" DATETIME NOT NULL
);

-- CreateTable
CREATE TABLE "Seller" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "created_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" DATETIME NOT NULL
);

-- CreateTable
CREATE TABLE "Contact" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "contact_type_id" INTEGER NOT NULL,
    "number" TEXT NOT NULL,
    "created_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" DATETIME NOT NULL,
    CONSTRAINT "Contact_contact_type_id_fkey" FOREIGN KEY ("contact_type_id") REFERENCES "ContactType" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "ContactType" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "created_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" DATETIME NOT NULL
);

-- CreateTable
CREATE TABLE "Order" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "product_id" INTEGER NOT NULL,
    "seller_id" INTEGER NOT NULL,
    "price" REAL NOT NULL,
    "payment_type" TEXT NOT NULL,
    "commission" REAL,
    "created_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" DATETIME NOT NULL,
    CONSTRAINT "Order_product_id_fkey" FOREIGN KEY ("product_id") REFERENCES "Product" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "Order_seller_id_fkey" FOREIGN KEY ("seller_id") REFERENCES "Seller" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "_ContactToSeller" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL,
    CONSTRAINT "_ContactToSeller_A_fkey" FOREIGN KEY ("A") REFERENCES "Contact" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT "_ContactToSeller_B_fkey" FOREIGN KEY ("B") REFERENCES "Seller" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);

-- CreateIndex
CREATE UNIQUE INDEX "Product_medical_mattress_id_key" ON "Product"("medical_mattress_id");

-- CreateIndex
CREATE UNIQUE INDEX "Product_base_measurement_id_key" ON "Product"("base_measurement_id");

-- CreateIndex
CREATE UNIQUE INDEX "Contact_contact_type_id_key" ON "Contact"("contact_type_id");

-- CreateIndex
CREATE UNIQUE INDEX "Order_product_id_key" ON "Order"("product_id");

-- CreateIndex
CREATE UNIQUE INDEX "Order_seller_id_key" ON "Order"("seller_id");

-- CreateIndex
CREATE UNIQUE INDEX "_ContactToSeller_AB_unique" ON "_ContactToSeller"("A", "B");

-- CreateIndex
CREATE INDEX "_ContactToSeller_B_index" ON "_ContactToSeller"("B");
