# 🚨 Imagem vulnerável propositalmente
FROM node:10

# Cria usuário não-root
RUN addgroup appgroup && useradd -M -g appgroup appuser

# Diretório de trabalho
WORKDIR /app

# Copia arquivos de configuração do Node
COPY package.json package-lock.json* ./

# Instala dependências (npm antigo com CVEs conhecidos)
RUN npm install --production \
    && npm cache clean --force

# Copia o restante do código da aplicação
COPY . .

# Altera para usuário não-root
USER appuser

# Porta da aplicação
EXPOSE 9000

# Comando para iniciar a aplicação
CMD ["node", "src/index.js"]
