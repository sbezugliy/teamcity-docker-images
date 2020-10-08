## teamcity-server tags

Other tags

- [teamcity-agent](teamcity-agent.md)
- [teamcity-minimal-agent](teamcity-minimal-agent.md)

#### multi-architecture

When running an image with multi-architecture support, docker will automatically select an image variant which matches your OS and architecture.

- [EAP](#EAP)

#### linux

- 18.04
  - [EAP-linux](#EAP-linux)

#### windows

- 1909
  - [EAP-nanoserver-1909](#EAP-nanoserver-1909)
- 1903
  - [EAP-nanoserver-1903](#EAP-nanoserver-1903)
- 1809
  - [EAP-nanoserver-1809](#EAP-nanoserver-1809)
- 1803
  - [EAP-nanoserver-1803](#EAP-nanoserver-1803)


### EAP

Supported platforms: linux 18.04, windows 1903, windows 1909

#### Content

- [EAP-linux](#EAP-linux)
- [EAP-nanoserver-1903](#EAP-nanoserver-1903)
- [EAP-nanoserver-1909](#EAP-nanoserver-1909)


### EAP-linux

[Dockerfile](linux/Server/Ubuntu/18.04/Dockerfile)

This is an official [JetBrains TeamCity](https://www.jetbrains.com/teamcity/) server image. The image is suitable for production use and evaluation purposes.

The docker image is available on:

- [https://hub.docker.com/r/jetbrains/teamcity-server](https://hub.docker.com/r/jetbrains/teamcity-server)

Installed components:

- [JDK <img align="center" height="18" src="/logo/corretto.png"> Amazon Corretto x64 v.11.0.8.10.1](https://corretto.aws/downloads/resources/11.0.8.10.1/amazon-corretto-11.0.8.10.1-linux-x64.tar.gz)

Container platform: linux

Docker pull command:

```
docker pull jetbrains/teamcity-server:EAP-linux
```

Docker build commands:

```
echo 2> context/.dockerignore
echo TeamCity/buildAgent >> context/.dockerignore
echo TeamCity/temp >> context/.dockerignore
docker build -f "context/generated/linux/Server/Ubuntu/18.04/Dockerfile" -t teamcity-server:EAP-linux "context"
```

Base images:

```
docker pull ubuntu:18.04
```

_The required free space to generate image(s) is about **1 GB**._
### EAP-nanoserver-1903

[Dockerfile](windows/Server/nanoserver/1903/Dockerfile)

This is an official [JetBrains TeamCity](https://www.jetbrains.com/teamcity/) server image. The image is suitable for production use and evaluation purposes.

The docker image is available on:

- [https://hub.docker.com/r/jetbrains/teamcity-server](https://hub.docker.com/r/jetbrains/teamcity-server)

Installed components:

- [PowerShell](https://github.com/PowerShell/PowerShell#get-powershell)
- [JDK <img align="center" height="18" src="/logo/corretto.png"> Amazon Corretto x64 v.11.0.8.10.1](https://corretto.aws/downloads/resources/11.0.8.10.1/amazon-corretto-11.0.8.10.1-windows-x64-jdk.zip)
- [Git x64 v.2.19.1](https://github.com/git-for-windows/git/releases/download/v2.19.1.windows.1/MinGit-2.19.1-64-bit.zip)

Container platform: windows

Docker pull command:

```
docker pull jetbrains/teamcity-server:EAP-nanoserver-1903
```

Docker build commands:

```
echo 2> context/.dockerignore
echo TeamCity/buildAgent >> context/.dockerignore
echo TeamCity/temp >> context/.dockerignore
docker build -f "context/generated/windows/Server/nanoserver/1903/Dockerfile" -t teamcity-server:EAP-nanoserver-1903 "context"
```

Base images:

```
docker pull mcr.microsoft.com/powershell:nanoserver-1903
```

_The required free space to generate image(s) is about **6 GB**._
### EAP-nanoserver-1909

[Dockerfile](windows/Server/nanoserver/1909/Dockerfile)

This is an official [JetBrains TeamCity](https://www.jetbrains.com/teamcity/) server image. The image is suitable for production use and evaluation purposes.

The docker image is available on:

- [https://hub.docker.com/r/jetbrains/teamcity-server](https://hub.docker.com/r/jetbrains/teamcity-server)

Installed components:

- [PowerShell](https://github.com/PowerShell/PowerShell#get-powershell)
- [JDK <img align="center" height="18" src="/logo/corretto.png"> Amazon Corretto x64 v.11.0.8.10.1](https://corretto.aws/downloads/resources/11.0.8.10.1/amazon-corretto-11.0.8.10.1-windows-x64-jdk.zip)
- [Git x64 v.2.19.1](https://github.com/git-for-windows/git/releases/download/v2.19.1.windows.1/MinGit-2.19.1-64-bit.zip)

Container platform: windows

Docker pull command:

```
docker pull jetbrains/teamcity-server:EAP-nanoserver-1909
```

Docker build commands:

```
echo 2> context/.dockerignore
echo TeamCity/buildAgent >> context/.dockerignore
echo TeamCity/temp >> context/.dockerignore
docker build -f "context/generated/windows/Server/nanoserver/1909/Dockerfile" -t teamcity-server:EAP-nanoserver-1909 "context"
```

Base images:

```
docker pull mcr.microsoft.com/powershell:nanoserver-1909
```

_The required free space to generate image(s) is about **6 GB**._
### EAP-nanoserver-1803

[Dockerfile](windows/Server/nanoserver/1803/Dockerfile)

This is an official [JetBrains TeamCity](https://www.jetbrains.com/teamcity/) server image. The image is suitable for production use and evaluation purposes.
The docker image is not available and may be created manually.

Installed components:

- [PowerShell](https://github.com/PowerShell/PowerShell#get-powershell)
- [JDK <img align="center" height="18" src="/logo/corretto.png"> Amazon Corretto x64 v.11.0.8.10.1](https://corretto.aws/downloads/resources/11.0.8.10.1/amazon-corretto-11.0.8.10.1-windows-x64-jdk.zip)
- [Git x64 v.2.19.1](https://github.com/git-for-windows/git/releases/download/v2.19.1.windows.1/MinGit-2.19.1-64-bit.zip)

Container platform: windows

Docker build commands:

```
echo 2> context/.dockerignore
echo TeamCity/buildAgent >> context/.dockerignore
echo TeamCity/temp >> context/.dockerignore
docker build -f "context/generated/windows/Server/nanoserver/1803/Dockerfile" -t teamcity-server:EAP-nanoserver-1803 "context"
```

Base images:

```
docker pull mcr.microsoft.com/powershell:nanoserver-1803
```

_The required free space to generate image(s) is about **6 GB**._
### EAP-nanoserver-1809

[Dockerfile](windows/Server/nanoserver/1809/Dockerfile)

This is an official [JetBrains TeamCity](https://www.jetbrains.com/teamcity/) server image. The image is suitable for production use and evaluation purposes.
The docker image is not available and may be created manually.

Installed components:

- [PowerShell](https://github.com/PowerShell/PowerShell#get-powershell)
- [JDK <img align="center" height="18" src="/logo/corretto.png"> Amazon Corretto x64 v.11.0.8.10.1](https://corretto.aws/downloads/resources/11.0.8.10.1/amazon-corretto-11.0.8.10.1-windows-x64-jdk.zip)
- [Git x64 v.2.19.1](https://github.com/git-for-windows/git/releases/download/v2.19.1.windows.1/MinGit-2.19.1-64-bit.zip)

Container platform: windows

Docker build commands:

```
echo 2> context/.dockerignore
echo TeamCity/buildAgent >> context/.dockerignore
echo TeamCity/temp >> context/.dockerignore
docker build -f "context/generated/windows/Server/nanoserver/1809/Dockerfile" -t teamcity-server:EAP-nanoserver-1809 "context"
```

Base images:

```
docker pull mcr.microsoft.com/powershell:nanoserver-1809
```

_The required free space to generate image(s) is about **6 GB**._
