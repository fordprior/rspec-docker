# Pull base image.
FROM cato1971/alpine-rspec

# make a directory to put our test repo when we clone it
RUN mkdir -p /usr/src/repo

# make a directory for our dummy test scripts
RUN mkdir -p /usr/src/helloworld

#copy helloworld rspec test and supporting file into new directory
WORKDIR /usr/src/helloworld
COPY ./helloworld/bowling.rb ./
COPY ./helloworld/bowling_spec.rb ./

# Make python directory
RUN mkdir -p /usr/src/pythonScript

# make that our working directory, CP to that directory and place our python script
WORKDIR /usr/src/pythonScript
COPY ./clone.py ./

# Install Git & Python.
RUN apk add --update \
    git \
    python \
    python-dev \
    py-pip \
    build-base \
  && pip install virtualenv \
  && rm -rf /var/cache/apk/*


# Install GitPython
RUN pip install GitPython

# Should I expose a port?
EXPOSE 80 

# Define working directory.
WORKDIR /data

# Define default command.
CMD ["bash"]