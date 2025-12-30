FROM nginx:alpine
COPY index.html /usr/share/nginx/html/index.html
COPY baubau.wav /usr/share/nginx/html/baubau.wav
COPY FUWAMOCO.webp /usr/share/nginx/html/FUWAMOCO.webp
EXPOSE 80
