#!/bin/bash

# 1. Definir un mensaje de commit automático
TIMESTAMP=$(date +"%Y-%m-%d %H:%M:%S")
COMMIT_MSG="Auto-deploy: $TIMESTAMP"

# Colores para la terminal
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m'

echo -e "${BLUE}>>> Iniciando Auto-Deploy Seguro...${NC}"

# 2. Agregar todos los cambios
echo -e "${GREEN}1. Agregando archivos a Git...${NC}"
git add .

# 3. Hacer el commit
echo -e "${GREEN}2. Creando commit: $COMMIT_MSG${NC}"
git commit -m "$COMMIT_MSG"

# 4. Empujar a GitHub (Usará la configuración del paso 1)
echo -e "${GREEN}3. Subiendo a GitHub...${NC}"
git push origin main

# 5. Desplegar en Firebase Hosting
echo -e "${GREEN}4. Desplegando en Firebase...${NC}"
firebase deploy --only hosting

echo -e "${BLUE}>>> ¡Todo listo! Web y GitHub actualizados correctamente.${NC}"
