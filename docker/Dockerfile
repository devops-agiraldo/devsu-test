FROM maven:3.8-openjdk-17-slim

# Crea el usuario devsu con un ID específico
RUN useradd -u 1000 -m devsu

# Cambia al usuario devsu
USER root

RUN printenv > /etc/environment

WORKDIR /tmp/app/

COPY ./demo-devops-java/ /tmp/app

# Otorga permisos como root
RUN chown -R devsu /tmp/app

USER devsu

ENV APP_PORT=8000 \
    SWAGGER_URL=http://localhost:8000/api/swagger-ui/index.html \
    OWNER=DEVSU \
    PURPOSE=DEVOPS_TEST
   

RUN  mvn clean install

EXPOSE 8000

HEALTHCHECK --interval=30s --timeout=10s --start-period=5s CMD curl -f http://localhost:8000/api/swagger-ui/index.html || exit 1

# Etiqueta para metadatos
LABEL version="1.0" \
      description="Image to Devsu test" \
      author="Andres Felipe Giraldo"

CMD ["java", "-jar", "/tmp/app/target/demo-0.0.1.jar"]
