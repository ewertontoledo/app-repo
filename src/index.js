// src/index.js
const express = require("express");
const app = express();

// Rota principal
app.get("/", (req, res) => {
  res.send("🧪 Teste do App-teste-4 rodando com sucesso!");
});

// Porta definida via variável de ambiente ou fallback para 9101
const port = process.env.PORT || 9101;

app.listen(port, "0.0.0.0", () => {
  console.log(`✅ App-teste-4 rodando na porta ${port}`);
  console.log(`➡️ Acesse pelo Nginx reverse proxy: http://stage-smart.surf.com.br/teste-4`);
});
