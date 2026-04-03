#!/bin/bash

# --- CONFIGURACIÓN DE SEGURIDAD ---
# Tu token ya está integrado aquí abajo
GITHUB_TOKEN="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"
REPO_URL="https://webhometre:$GITHUB_TOKEN@github.com/webhometre/Webhometreasury.git"

# 1. Definir un mensaje de commit automático
TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")
COMMIT_MSG="Auto-deploy: $TIMESTAMP"

# Colores para la terminal
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m'

echo -e "${BLUE}>>> Iniciando Auto-Deploy Total...${NC}"

# 2. Agregar todos los cambios
echo -e "${GREEN}1. Agregando archivos a Git...${NC}"
git add .

# 3. Hacer el commit
echo -e "${GREEN}2. Creando commit: $COMMIT_MSG${NC}"
git commit -m "$COMMIT_MSG"

# 4. Empujar a GitHub usando la URL con Token
echo -e "${GREEN}3. Subiendo a GitHub (Rama main)...${NC}"
# Forzamos el uso de la URL con el token para que no pida usuario
git push "$REPO_URL" main --force

# 5. Desplegar en Firebase Hosting
echo -e "${GREEN}4. Desplegando en Firebase...${NC}"
firebase deploy --only hosting

echo -e "${BLUE}>>> ¡Todo listo! Web y GitHub actualizados.${NC}"
