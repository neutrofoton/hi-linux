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