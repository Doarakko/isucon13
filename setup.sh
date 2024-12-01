USER:=isucon

mkdir /home/$USER/log
mkdir /home/$USER/tools && cd /home/$USER/tools

mkdir -p /home/$USER/mysql/mysql.conf.d
cp /etc/mysql/mysql.conf.d/mysqld.cnf /home/$USER/mysql/mysql.conf.d/mysqld.cnf

mkdir /home/$USER/nginx
cp /etc/nginx/nginx.conf /home/$USER/nginx/nginx.conf

# pt-query-digest
wget https://github.com/percona/percona-toolkit/archive/refs/tags/v3.5.5.tar.gz
tar zxvf v3.5.5.tar.gz
./percona-toolkit-3.5.5/bin/pt-query-digest --version
sudo install ./percona-toolkit-3.5.5/bin/pt-query-digest /usr/local/bin
pt-query-digest --version

# alp
wget https://github.com/tkuchiki/alp/releases/download/v1.0.21/alp_linux_amd64.tar.gz
tar zxvf alp_linux_amd64.tar.gz
sudo install alp /usr/local/bin
alp --version

# pprof
sudo apt update
sudo apt install graphviz
