# Etapa 1: Compilar la aplicación
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /app

# Copiar el archivo de proyecto
COPY src/hotel/hotel.csproj ./

# Restaurar las dependencias
RUN dotnet restore

# Copiar todo el código
COPY src/hotel/ ./

# Compilar la aplicación
RUN dotnet publish -c Release -o /app/publish

# Etapa 2: Crear imagen final más pequeña
FROM mcr.microsoft.com/dotnet/aspnet:8.0
WORKDIR /app

# Copiar la aplicación compilada desde la etapa anterior
COPY --from=build /app/publish .
# Asegurar que Kestrel escuche en el puerto 80 dentro del contenedor
ENV ASPNETCORE_URLS="http://+:80"

# Exponer el puerto 80 (HTTP)
EXPOSE 80

# Ejecutar la aplicación
ENTRYPOINT ["dotnet", "hotel.dll"]
