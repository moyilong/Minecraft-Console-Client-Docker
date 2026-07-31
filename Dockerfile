FROM mcr.microsoft.com/dotnet/sdk:10.0 AS base


COPY app /app

ENTRYPOINT ["dotnet", "/app/MinecraftClient.dll"]
