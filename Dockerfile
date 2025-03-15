FROM mysterysd/wzmlx:latest
WORKDIR /usr/src/app
RUN chmod 777 /usr/src/app

# Upgrade setuptools before installing requirements
RUN pip3 install --upgrade pip wheel setuptools>=61.0.0

# Copy and modify requirements.txt to use an older version of pymediainfo
COPY requirements.txt .
RUN sed -i 's/pymediainfo==6.0.1/pymediainfo==5.1.0/g' requirements.txt
RUN pip3 install --no-cache-dir -r requirements.txt

COPY . .
CMD ["bash", "start.sh"]
