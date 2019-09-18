# Orange
api gateway  
# Install
```
curl -sfL https://raw.githubusercontent.com/dakesolo/orange/master/install.sh | sh -  
```

# Start

```
sh /home/orange/start.sh
```
That's means restart.
# Config
```
/home/orange/conf/orange.conf
/home/orange/conf/nginx.conf
```
Config your mysql connect at `/home/orange/conf/orange.conf`,then import `/home/orange/conf/install/*.sql`.  
At last:
```
sh /home/orange/start.sh
```