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
RUN dotnet restore TelegramBot/TelegramBot.csproj
COPY . .
RUN dotnet publish TelegramBot/TelegramBot.csproj -c Release -o /app/publish /p:UseAppHost=false

FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS final
WORKDIR /app
COPY --from=build /app/publish .
ENTRYPOINT ["dotnet", "TelegramBot.dll"]