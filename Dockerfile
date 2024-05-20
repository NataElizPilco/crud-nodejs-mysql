# Utiliza una imagen base oficial de Node.js
FROM node:18

# Establece el directorio de trabajo dentro del contenedor
WORKDIR /myapp

# Copia el archivo package.json y package-lock.json (si existe)
COPY package*.json .

# Instala las dependencias
#RUN npm i express mysql2 dotenv
RUN npm install
#RUN npm run dev

# Copia el resto del código de la aplicación
COPY . .

# Instalar dependencias y limpiar directorios temporales
RUN npm install && \
    npm cache clean --force && \
    rm -rf /tmp/* /var/tmp/*

# Expone el puerto en el que corre la aplicación
EXPOSE 3000

# Comando para correr la aplicación
CMD npm start
#CMD ["node", "src/index.js"]
