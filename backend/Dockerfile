#pull down .NET image from docker
FROM mcr.microsoft.com/dotnet/core/sdk:3.1-buster AS build





WORKDIR /backend
COPY . /backend

#Install dependencies
RUN dotnet restore "./backend.csproj"

#Compile and prep for deployment.
RUN dotnet publish "backend.csproj" -c Release -o /app/publish

#Pull down docker hub image that includes only the ASP.NET Core runtime.
FROM mcr.microsoft.com/dotnet/core/aspnet:3.1-buster-slim

EXPOSE 80

#Copy published app to this container.
COPY --from=build /app/publish .

#ENTRYPOINT ["dotnet", "backend.dll"]
