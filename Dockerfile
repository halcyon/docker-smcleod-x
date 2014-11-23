FROM smcleod/base:latest

ADD ttf-mac-fonts /usr/share/fonts/truetype

RUN apt-get install -y $(apt-cache depends emacs24 | grep Depends | grep -v "<" | sed "s/.*ends:\ //" | tr '\n' ' ')  && \
    apt-get clean

RUN curl -L https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - && \
    sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list' && \
    apt-get update && \
    apt-get install -y $(apt-cache depends google-chrome-stable | grep Depends | grep -v "<" | sed "s/.*ends:\ //" | tr '\n' ' ')  && \
    apt-get clean
