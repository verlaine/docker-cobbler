#!/bin/bash
#Parameters
IP="CONTAINERIP/MASK"
DNS="DNSIP"
GW="GWIP"

# launch the container
CID=$(docker run --name="cobbler" --privileged -d -v ISOLOCATION:/mnt/iso -v kickstart_templates_LOACTION:/var/lib/cobbler/kickstarts --dns=$DNS $1)

# Launch Pipework and associate the right br
pipework brNB $CID $IP@$GW

# Get infos printed
echo "Container created with ID: $CID and IP: $IP."
