# real time data streaming pipeline
 🚀 Real-Time Data Streaming Pipeline with Kafka, Spark, Cassandra, and Airflow
## 🔧 Tech Stack
- Apache Kafka
- Apache Spark (Structured Streaming)
- Apache Cassandra
- Apache Airflow
- Python
- WSL2 (local setup)

## 📌 Overview
This project streams user data from a public API to Kafka, processes it in real-time using Spark, and stores it in Cassandra. Airflow is used to schedule and monitor the workflow.

## 🛠️ Components
- `spark_stream.py`: Spark app for consuming Kafka data and writing to Cassandra.
- Airflow DAG: Automates API ingestion and pipeline execution.
- AKHQ: Web UI to inspect Kafka topics.
- WSL2: Local Linux environment for realistic deployment setup.

## 📂 Project Setup
Instructions for running services, environment setup, and troubleshooting common issues.

## 🧠 Learning Outcome
- End-to-end streaming pipeline orchestration
- Real-time processing with Spark
- Integration between Kafka and Cassandra
- Using Airflow for automation

## 🧪 How to Run (Locally in WSL2)
# 🔧 Prerequisites
 WSL2 with Ubuntu

 Python 3.10+ installed

 Apache Spark, Kafka, Cassandra installed in ~/

 #Virtual environments for each service:

~/kafka_env

~/cassandra_env

~/spark_env

~/airflow_env

 Airflow project already initialized with:

airflow.cfg

# DAGs folder

SQLite DB (airflow.db)

 run_services.sh to start backend services

 run_airflow.sh to launch Airflow

# ▶️ 1. Clone the Repo

git clone https://github.com/your-username/real-time-data-streaming.git

cd real_time_data_streaming
# ▶️ 2. Start All Backend Services (Kafka, Spark, Cassandra)

bash script/run_services.sh

# ✅ This will:

Start Kafka with zookeeper

Launch Cassandra

Start Spark Master & Spark Worker

Each service logs to your home directory (e.g., ~/kafka.log, ~/spark-master.log)

# ▶️ 3. Start Apache Airflow
bash script/run_airflow.sh
# ✅ This will:

Activate the airflow_env virtual environment

Initialize the Airflow DB (if not done already)

Start the Airflow scheduler and webserver

Visit: http://localhost:8080

# ▶️ 4. Trigger the DAG
In the Airflow UI, trigger the DAG named: real_time_pipeline_dag

This will fetch user data from an API and send it to the Kafka topic (user_data)

# ▶️ 5. Run Spark Streaming Script
source ~/spark_env/bin/activate

spark-submit \
  --master spark://localhost:7077 \
  --packages org.apache.spark:spark-sql-kafka-0-10_2.12:3.5.0,\
              com.datastax.spark:spark-cassandra-connector_2.12:3.5.0 \
  spark_stream.py
# ✅ This will:

Read data from Kafka

Process and transform the stream

Insert the transformed data into a Cassandra table

# ▶️ 6. Monitor Kafka Topics (AKHQ Optional)
java -Dconfig.file=application.conf -jar akhq.jar
Then visit http://localhost:8081 to inspect Kafka topics.

# 🧼 Stop All Services
bash script/stop_services.sh
