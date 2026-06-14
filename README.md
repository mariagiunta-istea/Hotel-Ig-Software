# Hotel Bellavista - API Backend                                                                                                                               
                                                                                                                                                                 
  Sistema de gestión hotelera para el Hotel Bellavista. API REST desarrollada con ASP.NET Core y MySQL.                                                          
                                                                                                                                                                 
  ## Stack tecnológico
                                                                                                                                                                 
  - *Lenguaje:* C# / .NET 8                                                                                                                                    
  - *Framework:* ASP.NET Core Web API
  - *ORM:* Entity Framework Core                                                                                                                               
  - *Base de datos:* MySQL 8                           
  - *Conector:* Pomelo.EntityFrameworkCore.MySql
  - *Documentación:* Swagger / OpenAPI
                                                                                                                                                                 
  ## Estructura del proyecto
                                                                                                                                                                 
  src/                                                   
  └── hotel/
      ├── Controllers/        # Endpoints de la API
      ├── Data/               # Contexto de base de datos
      ├── Models/             # Modelos de entidades
      ├── Properties/
      ├── appsettings.json    # Configuración y connection string                                                                                                
      ├── Program.cs          # Punto de entrada
      └── hotel.csproj                                                                                                                                           
                                                         
  ## Cómo levantar el proyecto

  ### Requisitos previos                                                                                                                                         
  - Visual Studio 2022
  - .NET 8 SDK                                                                                                                                                   
  - MySQL 8 corriendo localmente                         

  ### Pasos

  1. Clonar el repositorio
  ```bash
  git clone https://github.com/mariagiunta-istea/Hotel-Ig-Software.git
                                                                                                                                                                 
  2. Abrir src/hotel/hotel.csproj en Visual Studio 2022
  3. Configurar el connection string en appsettings.json:                                                                                                        
  {                                                      
    "ConnectionStrings": {
      "DefaultConnection": "Server=127.0.0.1;Port=3307;Database=Hotel;User=root;Password=TU_PASSWORD;AllowPublicKeyRetrieval=True;SslMode=None;"
    }                                                                                                                                                            
  }  
                                                                                                                                                                 
  4. Restaurar paquetes y compilar:                      
  dotnet restore                                                                                                                                                 
  dotnet build
                                                                                                                                                                 
  5. Correr el proyecto:                                 
  dotnet run

  6. Abrir Swagger en el browser: http://localhost:5000/swagger

  Endpoints disponibles                                                                                                                                          
   
  ┌─────────────────────┬────────────────────────┬──────────────────────────────────────────────────────────────────────────┐                                    
  │       Entidad       │       Ruta base        │                                 Métodos                                  │
  ├─────────────────────┼────────────────────────┼──────────────────────────────────────────────────────────────────────────┤
  │ Huéspedes           │ /api/Huespedes         │ GET, GET/{id}, POST, PUT/{id}, DELETE/{id}                               │
  ├─────────────────────┼────────────────────────┼──────────────────────────────────────────────────────────────────────────┤
  │ Habitaciones        │ /api/Habitaciones      │ GET, GET/{id}, GET/disponibles, POST, PUT/{id}, DELETE/{id}              │
  ├─────────────────────┼────────────────────────┼──────────────────────────────────────────────────────────────────────────┤                                    
  │ Reservas            │ /api/Reservas          │ GET, GET/{id}, POST, PUT/{id}, DELETE/{id}                               │
  ├─────────────────────┼────────────────────────┼──────────────────────────────────────────────────────────────────────────┤                                    
  │ Estadías            │ /api/Estadias          │ GET, GET/{id}, POST, PUT/{id}, DELETE/{id}                               │
  ├─────────────────────┼────────────────────────┼──────────────────────────────────────────────────────────────────────────┤                                    
  │ Servicios           │ /api/Servicios         │ GET, GET/{id}, POST, PUT/{id}, DELETE/{id}                               │
  ├─────────────────────┼────────────────────────┼──────────────────────────────────────────────────────────────────────────┤
  │ Pagos               │ /api/Pagos             │ GET, GET/{id}, POST, PUT/{id}, DELETE/{id}                               │
  ├─────────────────────┼────────────────────────┼──────────────────────────────────────────────────────────────────────────┤                                    
  │ Servicios x Estadía │ /api/ServiciosEstadias │ GET, GET/{idServicio}/{idEstadia}, POST, DELETE/{idServicio}/{idEstadia} │
  ├─────────────────────┼────────────────────────┼──────────────────────────────────────────────────────────────────────────┤                                    
  │ Huéspedes x Estadía │ /api/HuespedesEstadias │ GET, GET/{idHuesped}/{idEstadia}, POST, DELETE/{idHuesped}/{idEstadia}   │
  └─────────────────────┴────────────────────────┴──────────────────────────────────────────────────────────────────────────┘                                    
                                                         
  Integrantes                                                                                                                                                    
   
  - María Belén Giunta                                                                                                                                           
  - Gonzalo Carbó                                        
  - Agustín Cuello
  - Máximo Pavesi
  - Franco Colón
