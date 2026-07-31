# Using the .NET official image for .NET 6.0
FROM mcr.microsoft.com/dotnet/sdk:10.0 AS base

# RUN \
#   sed -i 's@//.*archive.ubuntu.com@//mirrors.ustc.edu.cn@g' /etc/apt/sources.list.d/ubuntu.sources; \
#   sed -i 's/security.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list.d/ubuntu.sources; \
#   sed -i 's/ports.ubuntu.com/mirrors.ustc.edu.cn/g' /etc/apt/sources.list.d/ubuntu.sources;

RUN apt-get update

FROM base AS build

RUN apt install -y git

WORKDIR /Minecraft-Console-Client

RUN git clone https://github.com/MCCTeam/Minecraft-Console-Client -b 20260719-481 --recursive /Minecraft-Console-Client

RUN dotnet build -c Release -o /app MinecraftClient.sln


FROM base

COPY --from=build /app /app

ENTRYPOINT ["dotnet", "/app/MinecraftClient.dll"]
