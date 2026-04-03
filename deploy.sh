#!/bin/bash

# --- CONFIGURACIÓN DE SEGURIDAD ---
# PEGA TU TOKEN DE GITHUB AQUÍ ABAJO:
GITHUB_TOKEN="TU_TOKEN_AQUÍ"
REPO_URL="https://webhometre:$GITHUB_TOKEN@github.com/webhometre/Webhometreasury.git"

# 1. Definir un mensaje de commit automático con fecha y hora
TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")
COMMIT_MSG="Auto-deploy: $TIMESTAMP"

# Colores para la terminal
GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${BLUE}>>> Iniciando Auto-Deploy Total (Modo Silencioso)...${NC}"

# Validar que pusiste el token
if [ "$GITHUB_TOKEN" == "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" ]; then
    echo -e "${RED}ERROR: No has puesto tu token en la línea 5 del script.${NC}"
    exit 1
fi

# 2. Agregar todos los cambios
echo -e "${GREEN}1. Agregando archivos a Git...${NC}"
git add .

# 3. Hacer el commit con el mensaje automático
echo -e "${GREEN}2. Creando commit: $COMMIT_MSG${NC}"
git commit -m "$COMMIT_MSG"

# 4. Empujar a GitHub usando la URL con Token
echo -e "${GREEN}3. Subiendo a GitHub (Rama main)...${NC}"
# Usamos la URL directa para evitar que pida usuario/pass
git push "$REPO_URL" main

# 5. Desplegar en Firebase Hosting
echo -e "${GREEN}4. Desplegando en Firebase...${NC}"
firebase deploy --only hosting

echo -e "${BLUE}>>> ¡Todo listo! Web y GitHub actualizados sin preguntas.${NC}"
