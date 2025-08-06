- Install OpenJDK 21
    ```bash
    sudo dnf install java-21-openjdk java-21-openjdk-devel -y
    ```

- Select Java 21 as **default**
    ```bash
    sudo alternatives --config java

    There are 3 programs which provide 'java'.

    Selection    Command
    -----------------------------------------------
    *+ 1           java-17-openjdk.x86_64 (/usr/lib/jvm/java-17-openjdk-17.0.16.0.8-2.el9.x86_64/bin/java)
    2           java-1.8.0-openjdk.x86_64 (/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.452.b09-2.el9.x86_64/jre/bin/java)
    3           java-21-openjdk.x86_64 (/usr/lib/jvm/java-21-openjdk-21.0.8.0.9-1.el9.x86_64/bin/java)

    Enter to keep the current selection[+], or type selection number: 3


    ```

- Do the same for Javac
    ```bash
    sudo alternatives --config javac

    There are 2 programs which provide 'javac'.

    Selection    Command
    -----------------------------------------------
    *+ 1           java-17-openjdk.x86_64 (/usr/lib/jvm/java-17-openjdk-17.0.16.0.8-2.el9.x86_64/bin/javac)
    2           java-21-openjdk.x86_64 (/usr/lib/jvm/java-21-openjdk-21.0.8.0.9-1.el9.x86_64/bin/javac)

    Enter to keep the current selection[+], or type selection number: 2

    ```