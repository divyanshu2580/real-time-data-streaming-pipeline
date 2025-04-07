#!/bin/bash
set -e

echo "🚀 Starting Real-Time Data Streaming Stack on WSL2..."

# 🦓 Start Zookeeper
echo "🦓 Starting Zookeeper..."
nohup ~/kafka_2.13-3.6.0/bin/zookeeper-server-start.sh ~/kafka_2.13-3.6.0/config/zookeeper.properties > ~/zookeeper.log 2>&1 &

sleep 5

# 📡 Start Kafka Broker (with kafka_env)
echo "📡 Starting Kafka Broker..."
source ~/kafka_env/bin/activate
nohup ~/kafka_2.13-3.6.0/bin/kafka-server-start.sh ~/kafka_2.13-3.6.0/config/server.properties > ~/kafka.log 2>&1 &
deactivate


echo "💾 Starting Cassandra..."
source ~/cassandra_env/bin/activate

# Temporarily set JAVA_HOME and PATH for Cassandra
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
export PATH=$JAVA_HOME/bin:$PATH

nohup ~/apache-cassandra-4.1.8/bin/cassandra > ~/cassandra.log 2>&1 &

deactivate
# ⚡ Start Spark Master (with spark_env)
echo "⚡ Starting Spark Master..."
source ~/spark_env/bin/activate
nohup ~/spark-3.5.5-bin-hadoop3/sbin/start-master.sh > ~/spark-master.log 2>&1 &
sleep 2

# ⚡ Start Spark Worker
echo "⚡ Starting Spark Worker..."
nohup ~/spark-3.5.5-bin-hadoop3/sbin/start-worker.sh spark://localhost:7077 > ~/spark-worker.log 2>&1 &
deactivate

echo "✅ All services started in the background. Logs are in your home directory:"
echo "   - zookeeper.log"
echo "   - kafka.log"
echo "   - cassandra.log"
echo "   - spark-master.log"
echo "   - spark-worker.log"
