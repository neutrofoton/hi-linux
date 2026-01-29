```bash
❯ docker container ls -a
permission denied while trying to connect to the docker API at unix:///var/run/docker.sock

❯ sudo usermod -aG docker $USER
[sudo] password for neutro: 

```

- `usermod` 
   Singkatan dari **user modify**, merupakan tool Linux untuk mengubah properti user (group, shell, home, dll)

- -a = append
  - Menambahkan group docker
  - Tanpa menghapus group lain yang sudah kamu punya
  - JANGAN pernah pakai `-G` tanpa `-a`, kecuali kamu tahu risikonya.
    ```bash
    sudo usermod -G docker junaidi
    ```
    👉 User bisa kehilangan group penting (sudo, wheel, dll)
    <br/>
    
- `-G docker`
  ```bash
  set group tambahan (supplementary group) user ke group `docker`
  ```
  
- `$USER`
   ```bash
   username kamu yang sedang login
   ```
