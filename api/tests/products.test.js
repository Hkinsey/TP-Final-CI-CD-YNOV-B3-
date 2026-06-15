const request = require("supertest");
const app = require("../src/app");

describe("GET /api/products", () => {
  test("retourne un tableau de produits", async () => {
    const res = await request(app).get("/api/products");
    expect(res.status).toBe(200);
    expect(Array.isArray(res.body)).toBe(true);
  });

  test("chaque produit a un id et un name", async () => {
    const res = await request(app).get("/api/products");
    if (res.body.length > 0) {
      expect(res.body[0]).toHaveProperty("id");
      expect(res.body[0]).toHaveProperty("name");
    }
  });

  test("retourne 404 sur un produit inexistant", async () => {
    const res = await request(app).get("/api/products/99999");
    expect(res.status).toBe(404);
  });
});
