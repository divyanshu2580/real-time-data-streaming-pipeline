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
