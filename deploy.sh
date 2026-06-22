#!/bin/bash

# Configuración de colores
GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m'

echo -e "${BLUE}>>> Iniciando Auto-Deploy...${NC}"

# 1. Agregar y Commit
echo -e "${GREEN}1. Guardando cambios en Git...${NC}"
git add .
git commit -m "Auto-deploy: $(date)"

# 2. Subir a GitHub
echo -e "${GREEN}2. Subiendo a GitHub...${NC}"
if git push origin main; then
    echo -e "${GREEN}Éxito en GitHub.${NC}"
else
    echo -e "${RED}Error: Falló el push a GitHub. Deteniendo proceso.${NC}"
    exit 1
fi

# 3. Desplegar en Firebase
echo -e "${GREEN}3. Desplegando en Firebase...${NC}"
firebase deploy --only hosting

echo -e "${BLUE}>>> ¡Todo listo! Web y GitHub actualizados.${NC}"
