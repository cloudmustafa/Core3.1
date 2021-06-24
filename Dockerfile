#See https://aka.ms/containerfastmode to understand how Visual Studio uses this Dockerfile to build your images for faster debugging.

FROM mcr.microsoft.com/dotnet/core/aspnet:3.1-buster-slim AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/core/sdk:3.1-buster AS build
WORKDIR /src
COPY Core31API.csproj ./
RUN dotnet restore "./Core31API.csproj"
COPY . .
WORKDIR "/src/."
RUN dotnet build "Core31API.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "Core31API.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "Core31API.dll"]
