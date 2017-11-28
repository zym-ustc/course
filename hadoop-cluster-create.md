## hadoop 完全分布式集群搭建

#### 环境
在物理机上利用VMware 安装三台CentOS虚拟机进行实验，用户为root

软件版本
```sh
CentOS-16.11 jdk-8u144 hadoop-2.7.4
```
网络环境
```sh
192.168.187.130/24 master
192.168.187.131/24 slave1
192.168.187.132/24 slave2
```
#### ssh免密登陆：
将master的公钥拷贝到各个slave节点的authorized_keys中

master
```bash
ssh-keygen –t rsa
cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys

scp ~/.ssh/id_rsa.pub root@slave1:~/.ssh/master_key
scp ~/.ssh/id_rsa.pub root@slave2:~/.ssh/master_key
```

slave
```bash
ssh-keygen –t rsa
cat ~/.ssh/master_key >> ~/.ssh/authorized_keys
rm master_key
```

#### 主要配置文件：
core-site.xml
```xml
<configuration>
  <property>
  <name>fs.default.name</name>
  <value>hdfs://master:9000</value>
  </property>
  <property>
  <name>hadoop.tmp.dir</name>
  <value>/root/Downloads/hadoop-2.7.4/tmp</value>
  </property>
</configuration>
```
hdfs-site.xml 默认配置即可

mapred-site.xml
```xml
<configuration>
  <property>
  <name>mapreduce.jobtracker.http.address</name>
  <value>master:50030</value>
  </property>
  <property>
  <name>mapreduce.jobhistory.address</name>
  <value>master:10020</value>
  </property>
  <property>
  <name>mapred.job.tracker</name>
  <value>http://master:9001</value>
  </property>
</configuration>
```
yarn-site.xml 默认配置即可

#### 启动集群

##### 启动（在master节点上操作）:

start-all.sh 逐渐被弃用，这里我们使用start-dfs.sh与start-yarn.sh脚本
```
[root@localhost sbin]# ./start-all.sh

This script is Deprecated. Instead use start-dfs.sh and start-yarn.sh
```
启动hdfs
```
[root@localhost sbin]# ./start-dfs.sh

Starting namenodes on [master]
master: starting namenode, logging to /root/Downloads/hadoop-2.7.4/logs/hadoop-root-namenode-localhost.localdomain.out
slave1: starting datanode, logging to /root/Downloads/hadoop-2.7.4/logs/hadoop-root-datanode-localhost.localdomain.out
slave2: starting datanode, logging to /root/Downloads/hadoop-2.7.4/logs/hadoop-root-datanode-localhost.localdomain.out
Starting secondary namenodes [0.0.0.0]
0.0.0.0: secondarynamenode running as process 3368. Stop it first.
```
启动yarn
```
[root@localhost sbin]# ./start-yarn.sh

starting yarn daemons
resourcemanager running as process 3516. Stop it first.
slave1: starting nodemanager, logging to /root/Downloads/hadoop-2.7.4/logs/yarn-root-nodemanager-localhost.localdomain.out
slave2: starting nodemanager, logging to /root/Downloads/hadoop-2.7.4/logs/yarn-root-nodemanager-localhost.localdomain.out
```

##### 查看jps结果

master:
```bash
4326 Jps
3368 SecondaryNameNode
3516 ResourceManager
```
slave1:
```bash
2787 Jps
2565 DataNode
2693 NodeManager
```

slave2:
```bash
2720 NodeManager
2822 Jps
2604 DataNode
```
