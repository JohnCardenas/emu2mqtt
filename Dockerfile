FROM arm32v7/python:2
MAINTAINER John Cardenas <cardenas.john.j@gmail.com>

ENV MQTT_CLIENT_NAME=emu2mqtt \
    MQTT_SERVER=localhost \
    MQTT_PORT=1883 \
    MQTT_USERNAME=none \
    MQTT_PASSWORD=none \
    MQTT_TOPIC=emu2mqtt \
    MQTT_QOS=0 \
    SERIAL_PORT=ttyACM0

WORKDIR /usr/src/app

COPY emu-requirements.txt requirements.txt api_classes.py emu.py emu2mqtt.py ./
RUN pip install --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

CMD python emu2mqtt.py --mqtt_client_name $MQTT_CLIENT_NAME --mqtt_server $MQTT_SERVER --mqtt_port $MQTT_PORT --mqtt_username $MQTT_USERNAME \
    --mqtt_password $MQTT_PASSWORD --mqtt_topic $MQTT_TOPIC --mqtt_qos $MQTT_QOS $SERIAL_PORT
