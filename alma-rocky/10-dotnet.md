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