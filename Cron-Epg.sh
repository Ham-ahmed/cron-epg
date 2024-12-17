#!/bin/sh

declare -A files=(

["/usr/lib/enigma2/python/Plugins/Extensions/EPGGrabber/providers/qatarpriet5.py"]="https://raw.githubusercontent.com/Saiedf/EpgGrabber/refs/heads/main/Files/EPGGrabber/providers/qatarpriet5.py"


["/usr/lib/enigma2/python/Plugins/Extensions/EPGGrabber/providers/egypt2iet5.py"]="https://raw.github.com/Saiedf/EpgGrabber/blob/main/Files/EPGGrabber/providers/egypt2iet5.py"

["/usr/lib/enigma2/python/Plugins/Extensions/EPGGrabber/providers/arabiapriet5.py"]="https://raw.githubusercontent.com/Saiedf/EpgGrabber/refs/heads/main/Files/EPGGrabber/providers/arabiapriet5.py"

["/usr/lib/enigma2/python/Plugins/Extensions/EPGGrabber/providers/qatareniet5.py"]="https://raw.githubusercontent.com/Saiedf/EpgGrabber/refs/heads/main/Files/EPGGrabber/providers/qatareniet5.py"

["/usr/lib/enigma2/python/Plugins/Extensions/EPGGrabber/providers/uae1iet5.py"]="https://raw.githubusercontent.com/Saiedf/EpgGrabber/refs/heads/main/Files/EPGGrabber/providers/uae1iet5.py"

["/usr/lib/enigma2/python/Plugins/Extensions/EPGGrabber/providers/uaeariet5.py"]="https://raw.githubusercontent.com/Saiedf/EpgGrabber/refs/heads/main/Files/EPGGrabber/providers/uaeariet5.py"

["/usr/lib/enigma2/python/Plugins/Extensions/EPGGrabber/providers/uaeariet5.py"]="https://raw.githubusercontent.com/Saiedf/EpgGrabber/refs/heads/main/Files/EPGGrabber/providers/uaeariet5.py"

["/usr/lib/enigma2/python/Plugins/Extensions/EPGGrabber/providers/uaeeniet5.py"]="https://raw.githubusercontent.com/Saiedf/EpgGrabber/refs/heads/main/Files/EPGGrabber/providers/uaeeniet5.py"

["/etc/epgimport/custom.sources.xml"]="https://raw.githubusercontent.com/Saiedf/EpgGrabber/refs/heads/main/Files/epgimport/custom.sources.xml"

["/etc/epgimport/ziko_config/arabiapriet5.channels.xml"]="https://raw.githubusercontent.com/Saiedf/EpgGrabber/refs/heads/main/Files/epgimport/ziko_config/arabiapriet5.channels.xml"

["/etc/epgimport/ziko_config/qatareniet5.channels.xml"]="https://raw.githubusercontent.com/Saiedf/EpgGrabber/refs/heads/main/Files/epgimport/ziko_config/qatareniet5.channels.xml"

["/etc/epgimport/ziko_config/qatarpriet5.channels.xml"]="https://raw.githubusercontent.com/Saiedf/EpgGrabber/refs/heads/main/Files/epgimport/ziko_config/qatarpriet5.channels.xml"

["/etc/epgimport/ziko_config/uae1iet5.channels.xml"]="https://raw.githubusercontent.com/Saiedf/EpgGrabber/refs/heads/main/Files/epgimport/ziko_config/uae1iet5.channels.xml"

["/etc/epgimport/ziko_config/uae1iet5.channels.xml"]="https://raw.githubusercontent.com/Saiedf/EpgGrabber/refs/heads/main/Files/epgimport/ziko_config/uae1iet5.channels.xml"

["/etc/epgimport/ziko_config/uae1iet5.channels.xml"]="https://raw.githubusercontent.com/Saiedf/EpgGrabber/refs/heads/main/Files/epgimport/ziko_config/uae1iet5.channels.xml"
)

for file in "${!files[@]}"; do
    wget --show-progress -qO "$file" "${files[$file]}"
    sleep 1
    echo "$file"
    if [ $? -ne 0 ]; then
        echo "Failed to download $file"
        exit 1
    fi
done

echo 1 > /proc/sys/vm/drop_caches
echo 2 > /proc/sys/vm/drop_caches
echo 3 > /proc/sys/vm/drop_caches

declare -a scripts=(
    "qatarpriet5.py"
    "egypt2iet5.py"
    "osnen.py"
    "elcinEN.py"
    "nilesatiet5.py"
    "arabiapriet5.py"
    "qatareniet5.py"
    "uae1iet5.py"
    "uaeariet5.py"
    "uaeeniet5.py"
    "sportiet5.py"
)

for script in "${scripts[@]}"; do
    python "/usr/lib/enigma2/python/Plugins/Extensions/EPGGrabber/providers/$script"
    if [ $? -ne 0 ]; then
        echo "Failed to execute $script"
        echo ""
echo "" 
echo "*********************************************************"
echo "*                   INSTALLED SUCCESSFULLY              *"
echo "*                       ON - Panel                      *"
echo "*                Enigma2 restart is required            *"
echo "*********************************************************"
echo "               UPLOADED BY  >>>>   HAMDY_AHMED           "
sleep 4;
	echo '================================================='
###########################################                                                                                                                  
echo ". >>>>         RESTARING     <<<<"
echo "*********************************************************"
        exit 1
        sleep 2;
    fi
done
