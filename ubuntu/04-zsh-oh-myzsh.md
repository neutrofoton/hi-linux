# Steps
1. Update
    ```bash
    sudo apt update && sudo apt upgrade -y
    ```

2. Install tools
    ```bash
    sudo apt install git curl
    ```

3. Check current shell
    ```bash
    echo $SHELL

    # output
    /bin/bash
    ```

4. Install and change shell to zsh
    ```bash
    # install zsh
    sudo apt install zsh

    # update default shell to zsh
    chsh
    ```

    Enter your account password and give the new login shell path as <code>/bin/zsh</code>.

    **You will need to log out and log in again to apply the changes in your shell**

    ```bash
    # check current default shell
    echo $SHELL
    ```

5. Download oh-my-zsh
    ```bash
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
    ```

6. Edit <code>.zshrc</code>
    
    Open ~/.zshrc, find the line that sets ZSH_THEME, and change its value to <code>powerlevel10k/powerlevel10k</code>

7. Download font from https://github.com/romkatv/powerlevel10k?tab=readme-ov-file#meslo-nerd-font-patched-for-powerlevel10k.
8. Create folder <code>~/.fonts</code>. Copy the downloaded font into the folder.

9. In the terminal profile/preference/setting, set the font to <code>MesloLGS NF</code>

10. Configuring Powerlevel10k 
    Type <code>p10k configure</code> if the configuration wizard doesn't start automatically
    

# Reference
- https://github.com/romkatv/powerlevel10k