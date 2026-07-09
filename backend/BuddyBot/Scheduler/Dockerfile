FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src
COPY BuddyBot.sln ./
COPY Domain/Domain.csproj                 Domain/
COPY Application/Application.csproj        Application/
COPY Contracts/Contracts.csproj           Contracts/
COPY Infrastructure/Infrastructure.csproj Infrastructure/
COPY Admin.Api/Admin.Api.csproj           Admin.Api/
COPY TelegramBot/TelegramBot.csproj       TelegramBot/
COPY Scheduler/Scheduler.csproj           Scheduler/
RUN dotnet restore Scheduler/Scheduler.csproj
COPY . .
RUN dotnet publish Scheduler/Scheduler.csproj -c Release -o /app/publish /p:UseAppHost=false /p:ErrorOnDuplicatePublishOutputFiles=false

FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS final
WORKDIR /app
COPY --from=build /app/publish .
ENV ASPNETCORE_HTTP_PORTS=8080
EXPOSE 8080
ENTRYPOINT ["dotnet", "Scheduler.dll"]