FROM mcr.microsoft.com/dotnet/runtime:10.0 AS base

ARG TARGETPLATFORM
ENV TARGETPLATFORM=${TARGETPLATFORM}
COPY app/${TARGETPLATFORM} /app

ENTRYPOINT ["dotnet", "/app/MinecraftClient.dll"]
