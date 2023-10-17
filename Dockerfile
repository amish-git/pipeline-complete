# FROM nginx:latest
# COPY . /usr/share/nginx/html/
# WORKDIR /usr/share/nginx/html
# EXPOSE 80
# CMD ["nginx", "-g", "daemon off;"]

# base image
FROM alpine:3.5

# installing python and pip
RUN apk add --update py2-pip

# upgrade pip
RUN pip install --upgrade pip

# install Python modules needed by the Python app
COPY requirements.txt /usr/src/app/
RUN pip install --no-cache-dir -r /usr/src/app/requirements.txt

# copy files required for the app to run
COPY app.py /usr/src/app/
COPY templates/index.html /usr/src/app/templates/

# port number the container should expose
EXPOSE 5000

# working directory
WORKDIR /usr/src/app/
# run the application
CMD ["python", "app.py"]