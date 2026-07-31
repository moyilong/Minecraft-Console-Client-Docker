FROM base

COPY app /app

ENTRYPOINT ["dotnet", "/app/MinecraftClient.dll"]
