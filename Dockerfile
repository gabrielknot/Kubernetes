FROM jenkins/jenkins
USER root
RUN apt-get update && apt-get upgrade
RUN apt -y install lsb-release 
RUN wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
RUN echo "deb https://packages.sury.org/php/ $(lsb-release -sc) main" | tee /etc/apt/sources.list.d/php.list
RUN apt-get update 
RUN apt -y install php7.4 php-mbstring php-xml php-bcmath php-mysl php-redis
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=usr/local/bin --filename=composer

