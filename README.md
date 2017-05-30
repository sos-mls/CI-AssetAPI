# Deployment Scripts #

To start deploying AssetApi servers first create a running instance that is accessible by password and username.

### How to use install-on-server? ###

Simply run this command:
```shell
>$ bash install-on-server.sh -u=$MY_USERNAME -h=$MY_HOST
```

You will be prompted for a password. 
Once proper credentials are passed it will start to setup the SC server as necessary.
The Current OS for the AssetApi is Ubuntu 14.04x64

### How to use push-to-server? ###

Simply run this command:
```shell
>$ bash push-to-server.sh -u=$MY_USERNAME -h=$MY_HOST
```

You will be prompted for a password. 
If the credentials are accepted then it will update the server to the latest master code.