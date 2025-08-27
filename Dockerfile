# Usa uma imagem Node.js base
FROM node:18-alpine

# Define o diretório de trabalho dentro do contêiner
WORKDIR /app

# Copia os arquivos de configuração e lockfile
# Isso garante que o npm ci tenha o package-lock.json para uma instalação determinística
COPY package.json package-lock.json ./

# Instala as dependências de produção com o comando npm ci
RUN npm ci --only=production

# Copia o restante dos arquivos da aplicação
COPY . .

# Expõe a porta que a aplicação irá usar
EXPOSE 9000

# Comando para iniciar a aplicação
CMD ["node", "src/index.js"]