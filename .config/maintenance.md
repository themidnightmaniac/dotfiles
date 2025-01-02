## Artix GNU/Linux Monthly  Maintenace Guide

- ### Check the news
    `$ news`

- ### Update manually installed packages
    ...

- ### Check for old config files
    ```
    $ ls .config
    $ ls .cache
    $ ls .local/share
    ```

- ### Check for unused packages
    `$ listpkg`

- ### Remove orphaned packages
    `# pacman -Qtd | pacman -Rsn -`

- ### Check for non-libre packages
    `$ absolutely-proprietary`

- ### Upgrade the system
    `# pacman -Syu`

    - ### Reboot on kernel upgrades
    `$ reboot`

- ### Clean package cache
    `# pacman -Sc`

- ### Backup package list and database
    ```
    $ pacman -Qqe > pkglist.txt
    $ tar -cjf pacman_database.tar.bz2 /var/lib/pacman/local
    ``` 
- ### Firecfg if new apps were installed
    `$ sudo firecfg`

- ### Clean the filesystem
    - ### Duplicates common cache etc
        `$ bleachbit`

    - ### Scrub
        `# btrfs scrub start /`

    - ### Balance (after the scrub is done)
        `# btrfs balance start --bg /`
        
    - ### Defragment (after the balance is done)
        `# btrfs filesystem defragment -r /`

    - ### Dedupe (after the defrag is done)
        ```
        # duperemove -r /home/user (check)
        # duperemove -dr (on the found directories)
        ```

- ### Check dmesg for fs errors
    ```# dmesg```

- ### Backup dotfiles
    ```
    $ dotfiles status
    $ dotfiles add (changes)
    $ dotfiles commit -m (changes)
    ```

- ### Reboot
    ```$ reboot```

### done (:
