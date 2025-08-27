# app-repo
Exemplo de aplicação Node.js + Dockerfile.

Este repositório contém:
- src/index.js: app Express de exemplo
- Dockerfile: construção da imagem
- .github/workflows/ci.yml: workflow para build/push para OCIR (OCI Registry) e atualização do repo Fleet

Secrets necessários (no GitHub - Settings > Secrets and variables > Actions):
- OCIR_REGISTRY: ex: iad.ocir.io (mude conforme sua região)
- OCIR_USERNAME: formato: <tenancy-namespace>/<username>
- OCIR_AUTH_TOKEN: token de autenticação (criado no console da OCI -> User -> Auth Tokens)
- IMAGE_NAMESPACE: tenancy-namespace (ou namespace do repositório)
- IMAGE_NAME: nome do repositório de imagem (ex: app-teste)
- FLEET_REPO_URL: URL HTTPS do repositório Fleet (ex: https://github.com/ORG/fleet-repo.git)
- FLEET_REPO_PAT: Personal Access Token com permissão de `repo` (para dar push no repo Fleet)
- FLEET_BRANCH (opcional): branch do repo Fleet (default: main)

Como usar:
1. Criar o repositório `app-repo` no GitHub e subir este conteúdo.
2. Criar os secrets listados acima nas configurações do repositório.
3. Criar o repositório `fleet-repo` (veja o outro pacote) e configurar o Rancher Fleet para apontar para ele.
4. Ao dar push na branch main, o workflow construirá a imagem, fará push para OCIR e atualizará o manifest no repo Fleet.
