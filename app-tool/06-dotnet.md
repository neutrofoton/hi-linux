#  dotnet Installation
    ```bash
    sudo dnf install dotnet-runtime-8.0

    ```

# dotnet Command
    ```bash
    # show list installed runtime
    dotnet --list-runtimes

    # show package dependency of projects in a solution
    dotnet list package

    # restore nuget package dependency
    dotnet restore

    # clear local nuget cache
    dotnet nuget locals all --clear
    ```

# dotnet Tools
    ```bash
    # list dotnet tools installed
    dotnet tool list --global

    # install dotnet tool outdated and run it.
    dotnet tool install --global dotnet-outdated-tool
    dotnet outdated
    ```

# Manual Installation
 1. Download sdk
    ```bash
    curl -LO https://builds.dotnet.microsoft.com/dotnet/Sdk/9.0.200/dotnet-sdk-9.0.200-linux-x64.tar.gz
    ```

2.  Extract to specific folder
    ```bash
    # extract to specific director
    tar -xzf dotnet-sdk-9.0.200-linux-x64.tar.gz -C dotnet-sdk-9.0.200

    # create and extract
    mkdir dotnet-sdk-9.0.200 && tar -xzf dotnet-sdk-9.0.200-linux-x64.tar.gz -C dotnet-sdk-9.0.200

    ```

3. Export environment variable
    ```bash
    export DOTNET_ROOT=$HOME/sdk/dotnet/dotnet-sdk-9.0.200
    export PATH=$DOTNET_ROOT:$DOTNET_ROOT/sdk:$DOTNET_ROOT/shared:$PATH
    ```

4. Check
    ```bash
    dotnet --info
    ```

# Manual Installation (Multi Version)
```bash
tar -zxf Downloads/dotnet-sdk-9.0.313-linux-x64.tar.gz -C ~/.dotnet
tar -zxf Downloads/dotnet-sdk-10.0.203-linux-x64.tar.gz -C ~/.dotnet
```

Impact dari 2 command diatas akan merge dan replace di beberapa part:
```
~/.dotnet/
├── dotnet                  # updated/replaced
├── host                    # merged
├── packs                   # merged
├── sdk
│   ├── 9.0.313             # tetap ada
│   └── 10.0.203            # ditambah
├── shared
│   ├── Microsoft.NETCore.App
│   │   ├── 9.0.x           # tetap ada
│   │   └── 10.0.x          # ditambah
│   └── Microsoft.AspNetCore.App
│       ├── 9.0.x           # tetap ada
│       └── 10.0.x          # ditambah
```

| Flag | Arti             | Fungsi                   |
| ---- | ---------------- | ------------------------ |
| `-z` | gzip             | buka kompresi `.gz`      |
| `-x` | extract          | keluarkan isi archive    |
| `-f` | file             | pakai file archive ini   |
| `-C` | change directory | extract ke folder tujuan |

