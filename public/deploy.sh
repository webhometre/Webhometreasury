#!/bin/bash

# Colores para la terminal (opcional, para que se vea pro)
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # Sin color

echo -e "${BLUE}--- Iniciando proceso de despliegue ---${NC}"

# 1. Ejecutar el build (si usas React, Vue o similares)
# Si es HTML puro, puedes comentar la siguiente línea con un #
echo -e "${GREEN}1. Compilando el proyecto...${NC}"
npm run build

# 2. Subir cambios a GitHub
echo -e "${GREEN}2. Subiendo cambios a GitHub...${NC}"
git add .
read -p "Introduce el mensaje del commit: " commit_msg
git commit -m "$commit_msg"
git push origin main

# 3. Desplegar en Firebase Hosting
echo -e "${GREEN}3. Desplegando en Firebase Hosting...${NC}"
firebase deploy --only hosting

echo -e "${BLUE}--- ¡Despliegue completado con éxito! ---${NC}"
