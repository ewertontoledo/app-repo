# --- Base image ---
FROM node:16-alpine

# --- Criar usuário não-root ---
RUN addgroup -S appgroup && adduser -S appuser -G appgroup

# --- Diretório de trabalho ---
WORKDIR /app

# --- Copiar apenas arquivos de dependências primeiro ---
COPY package.json package-lock.json* ./

# --- Atualizar npm e instalar dependências de produção ---
RUN npm install -g npm@9 \
    && npm install --production \
    && npm cache clean --force

# --- Copiar o restante do código da aplicação ---
COPY . .

# --- Alterar para usuário não-root ---
USER appuser

# --- Expor porta da aplicação ---
EXPOSE 9000

# --- Comando de inicialização ---
CMD ["node", "src/index.js"]