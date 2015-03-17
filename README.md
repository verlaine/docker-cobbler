# docker-cobbler
Docker container for Cobbler 2.6.5 Ubuntu 14.04

### Check Pipework for the SDN part
https://github.com/jpetazzo/pipework

### Update start.sh script
####Update some parameters to fit your environment
`dhcp-range=IP_START,IP_END`
`dhcp-option=3,ROUTER`
`dhcp-option=6,DNS`

### Update run.sh script
####Update some parameters to fit your environment
`IP="IP/MASK"`
`DNS="IP"`
`GW="IP"`

and the different mountpoints to point to you iso location and kickstart files

### Build the container with Docker
`docker build -t cobbler:latest .`

### Launch the container
`./run.sh cobbler:latest`

### Test and finish the install
you should be good to go. try to access http://IP/cobler_web
execute import-isos.sh to import the profile and distro to cobbler.
