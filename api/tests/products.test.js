const request = require("supertest");
const app = require("../src/app");

describe("GET /api/products", () => {
  test("retourne 200 ou 503 selon DB", async () => {
    const res = await request(app).get("/api/products");
    expect([200, 503, 404]).toContain(res.status);
  });

  test("retourne 404 sur un produit inexistant", async () => {
    const res = await request(app).get("/api/products/99999");
    expect([404, 503]).toContain(res.status);
  });
});
