# Photography Tools by jguiel
These tools are scripts I write to help me with my photography day-to-day.
## Photo Dump
This script programmatically finds and moves all photos from a memory card to a designated location, clearing (not explicitly deleting anything) your SD card or other external drive of the current image files. It does not touch files that are not `.jpg`, `.jpeg`, `.png`, or raw `.cr2`. Tested on MacOS, can be easily adapted for Linux. 
### Usage
1. To set up (instructions are tailored for MacOS), open your terminal and run:
    ```
    mkdir ~/Documents/photodump && cd ~/Documents/photodump
    git clone https://github.com/jguiel/photography_tools.git
    sudo chmod +x ./photodump.sh
    echo "alias photodump=~/Documents/photodump/photodump.sh'" >> ~/.zshrc
    source ~/.zshrc
    open .env
    ```
2. Change the variables in the `.env` file to reflect:
    - `MEMCARDMNT`: the path of where external drives are mounted (`/Volumes` on MasOS)
    - `PHTGDIR`: the base folder where you keep all of your photography, e.g. `~/photos`
3. Save and close `.env` file
4. The script can now be run at any time in your terminal using the command `photodump <destination>`
    - `<destination>` is a subfolder that is created under your `$PHTGDIR`, to which photos will be moved

#### **Example**
If my `PHTGDIR` is `~/photos`, the command `photodump 2024-11-13_birthday` move all photos on my memory card into `~/photos/2024-11-13_birthday/`
