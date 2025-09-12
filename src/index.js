const express = require("express");
const app = express();

app.get("/", (req, res) => {
  res.send("🚀 Tarefa no Monday não pode ser duplicada, somente atualizar a imagem docker após o deploy no Rancher");
});

// Porta definida via variável de ambiente ou fallback para 9000
const port = process.env.PORT || 9000;

app.listen(port, "0.0.0.0", () => {
  console.log(`✅ App running and listening on port ${port}`);
  console.log(`➡️ Access it via Nginx reverse proxy: http://stage-smart.surf.com.br`);
});

