#!/bin/bash
set -e

export AIRFLOW_HOME=/mnt/c/Users/user/OneDrive/Desktop/real_time_data_streaming
export AIRFLOW__CORE__DAGS_FOLDER=$AIRFLOW_HOME/dags

source ~/airflow_env/bin/activate

echo "Starting PostgreSQL..."
sudo service postgresql start

echo "🌐 Starting Airflow..."

# Force airflow to use correct home directory
cd $AIRFLOW_HOME

if [ ! -f "$AIRFLOW_HOME/airflow.db" ]; then
  echo "🔧 Initializing Airflow..."
  airflow db init
  airflow users create \
    --username divyanshu \
    --firstname Divyanshu \
    --lastname Sharma \
    --role Admin \
    --email divyanshu@gmail.com \
    --password divyanshu
fi

echo "⏱️ Starting Airflow Scheduler..."
airflow scheduler > "$AIRFLOW_HOME/scheduler.log" 2>&1 &

echo "🌍 Opening Airflow Webserver..."
airflow webserver -p 8082
