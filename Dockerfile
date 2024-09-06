FROM mcr.microsoft.com/dotnet/framework/sdk:4.8-20240709-windowsservercore-ltsc2019

RUN dotnet tool install --global altcover.global
RUN dotnet tool install --global dotnet-reportgenerator-globaltool

COPY . .
RUN nuget restore

# Build Project
RUN msbuild "./DockerApp/DockerApp.csproj" /p:Configuration=Release

# Test & Collect Coverage
RUN msbuild "./DockerApp.Test/DockerApp.Test.csproj"
RUN AltCover.exe --inputDirectory=C:/DockerApp.Test/bin/Debug --localSource --assemblyFilter=DockerApp.Test --outputDirectory=__Instrumented
RUN AltCover.exe Runner --recorderDirectory __Instrumented  --executable C:/packages/xunit.runner.console.2.9.0/tools/net472/xunit.console.exe   --  ./__Instrumented/DockerApp.Test.dll

# Generate reports
RUN reportgenerator.exe -reports:coverage.xml -targetdir:reports
