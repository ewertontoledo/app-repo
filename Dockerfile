# Usa uma imagem Node.js base
FROM node:18-alpine

# Define o diretório de trabalho dentro do contêiner
WORKDIR /app

# Copia os arquivos de configuração e lockfile
COPY package.json package-lock.json ./

# Atualiza o npm para versão 9+ e instala dependências de produção
RUN npm install -g npm@9 && npm install --omit=dev

# Copia o restante dos arquivos da aplicação
COPY . .

# Expõe a porta que a aplicação irá usar
EXPOSE 9000

# Comando para iniciar a aplicação
CMD ["node", "src/index.js"]
