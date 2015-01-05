docker-teamspeak3
=================

This docker image provides a TeamSpeak3 server that will automatically download the latest stable version at startup. You can also run/upgrade to any other specific version. See the *Versions* section below for more information.

Usage
-----

To simply use the latest stable version, run

    docker run -d -p 9987:9987/udp -p 10011:10011 -p 30033:30033 --name=teamspeak3-server aheil/teamspeak3-server

where the default server ports will be exposed on your host machine. If you want to serve up multiple TeamSpeak3 servers or just use an alternate port, change the host-side port mapping such as

    docker run -d -p 9988:9987/udp -p 10012:10011 -p 30034:30033 ...

will serve your TeamSpeak3 server on your host's port 9988/udp, 10011/tcp, 30033/tcp sind the `-p` syntax is `host-port:container-port`.

Speaking of multiple servers, it's handy to give your containers ecplicit names using `--name` as seen above.

### First Run

If you are starting the server for the first time, you need the Admin-Token:

    docker run -d -p 9987:9987/udp -p 10011:10011 -p 30033:30033 --name=teamspeak3-server aheil/teamspeak3-server
    docker logs -f teamspeak3-server

There are two important sections in the logfiles:

```
------------------------------------------------------------------
                      I M P O R T A N T                           
------------------------------------------------------------------
               Server Query Admin Account created                 
         loginname= "serveradmin", password= "qyF2d07R"
------------------------------------------------------------------
```

and:
```
------------------------------------------------------------------
                      I M P O R T A N T                           
------------------------------------------------------------------
      ServerAdmin privilege key created, please use it to gain 
      serveradmin rights for your virtualserver. please
      also check the doc/privilegekey_guide.txt for details.

       token=P5fO1Cbbv5DbM5kg9xR3LlfpYjlJe6cT9QeMhjY+
------------------------------------------------------------------
```

**COPY THEM FOR LATER USE!**
