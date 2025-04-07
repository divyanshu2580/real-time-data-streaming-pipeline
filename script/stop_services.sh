#!/bin/bash
set -e

echo "🛑 Stopping Real-Time Data Streaming Stack..."

# 🧨 Stop Airflow Webserver
echo "🧨 Stopping Airflow Webserver..."
pkill -f "airflow webserver" || echo "Airflow webserver not running."

# 🧨 Stop Airflow Scheduler
echo "🧨 Stopping Airflow Scheduler..."
pkill -f "airflow scheduler" || echo "Airflow scheduler not running."

# 🛑 Stop PostgreSQL (if running)
echo "🛑 Stopping PostgreSQL..."
sudo /usr/sbin/service postgresql stop|| echo "PostgreSQL service not running or permission denied."

# 📴 Stop Kafka Broker
echo "📴 Stopping Kafka Broker..."
pkill -f "kafka.Kafka" || echo "Kafka broker not running."

# 📴 Stop Zookeeper
echo "📴 Stopping Zookeeper..."
pkill -f "zookeeper" || echo "Zookeeper not running."

# 🗃️ Stop Cassandra
echo "🗃️ Stopping Cassandra..."
pkill -f "org.apache.cassandra.service.CassandraDaemon" || echo "Cassandra not running."

# ⚡ Stop Spark Worker
echo "⚡ Stopping Spark Worker..."
~/spark-3.5.5-bin-hadoop3/sbin/stop-worker.sh || echo "Spark Worker not running."

# ⚡ Stop Spark Master
echo "⚡ Stopping Spark Master..."
~/spark-3.5.5-bin-hadoop3/sbin/stop-master.sh || echo "Spark Master not running."

# 🐍 Stop Kafka Python Producer (custom process name optional)
echo "🐍 Stopping Kafka Python Producer..."
pkill -f "test_producer.py" || echo "Kafka Python producer not running."

echo "✅ All services stopped."
