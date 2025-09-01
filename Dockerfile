# Usa Node.js 18 Alpine
FROM node:18-alpine

# Cria usuário não-root
RUN addgroup -S appgroup && adduser -S appuser -G appgroup

# Diretório de trabalho
WORKDIR /app

# Copia arquivos de configuração do Node
COPY package.json package-lock.json* ./

# Atualiza npm e instala dependências de produção
RUN npm install -g npm@9 \
    && npm install --production \
    && npm cache clean --force

# Copia o restante do código da aplicação
COPY . .

# Altera para usuário não-root
USER appuser

# Porta da aplicação
EXPOSE 9000

# Comando para iniciar a aplicação
CMD ["node", "src/index.js"]
