const request = require("supertest");
const app = require("../src/app");

describe("GET /health", () => {
  test("retourne status 200 avec les checks", async () => {
    const res = await request(app).get("/health");
    expect(res.status).toBe(200);
    expect(res.body.status).toBe("ok");
    expect(res.body.checks).toBeDefined();
    expect(res.body.timestamp).toBeDefined();
  });

  test("retourne le nom du service", async () => {
    const res = await request(app).get("/health");
    expect(res.body.service).toBe("shoplite-api");
  });
});
