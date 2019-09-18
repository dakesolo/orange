yum install -y pcre-devel openssl-devel gcc curl
yum install -y yum-utils
yum-config-manager --add-repo https://openresty.org/package/centos/openresty.repo
yum install -y openresty
yum install -y openresty-resty
yum install -y openresty-opm
yum install -y wget
yum install -y unzip

# lua-resty-template
wget https://github.com/bungle/lua-resty-template/archive/v1.9.tar.gz -O lua-resty-template-v1.9.tar.gz
tar zxvf lua-resty-template-v1.9.tar.gz
cp -a ./lua-resty-template-1.9/lib/resty/* /usr/local/openresty/lualib/resty/

# lua-resty-dns-client
wget https://github.com/Kong/lua-resty-dns-client/archive/4.1.0.tar.gz -O lua-resty-dns-client-4.1.0.tar.gz
tar zxvf lua-resty-dns-client-4.1.0.tar.gz
cp -a ./lua-resty-dns-client-4.1.0/src/resty/* /usr/local/openresty/lualib/resty/

# lua-resty-dns-client
wget https://github.com/cloudflare/lua-resty-cookie/archive/v0.1.0.tar.gz -O lua-resty-cookie-v0.1.0.tar.gz
tar zxvf lua-resty-cookie-v0.1.0.tar.gz
cp -a ./lua-resty-cookie-v0.1.0/lib/resty/* /usr/local/openresty/lualib/resty/

# luarocks
wget https://luarocks.github.io/luarocks/releases/luarocks-3.2.1.tar.gz
tar zxvf luarocks-3.2.1.tar.gz
cd luarocks-3.2.1
./configure --with-lua-include=/usr/local/openresty/luajit/include/luajit-2.1/
make bootstrap
export PATH=/usr/local/bin:$PATH
cd

# orange
mkdir -p /home/orange
wget https://github.com/orlabs/orange/archive/v0.7.1.tar.gz -O orange-v0.7.1.tar.gz
tar zxvf orange-v0.7.1.tar.gz
cp -a ./orange-0.7.1/* /home/orange/

cd /home/orange
opm --install-dir=./ get zhangbao0325/orangelib
luarocks install luafilesystem
luarocks install luasocket
luarocks install lrandom
sed -i "s/nginx -p/openresty -p/g" ./start.sh
cd

# lor
wget https://github.com/orlabs/lor/archive/v0.3.4.tar.gz -O lor-v0.3.4.tar.gz
tar zxvf lor-v0.3.4.tar.gz
cp -a ./lor-0.3.4/lib/* /home/orange/

# start
cd /home/orange
sh start.sh
cd

