const express = require("express");
const router = express.Router();

router.get("/", async (req, res) => {
  throw new Error("INCIDENT CONTRÔLÉ : route products cassée volontairement");
});

module.exports = router;
