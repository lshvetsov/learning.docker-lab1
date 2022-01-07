FROM ubuntu:jammy-20211122
MAINTAINER lshvetsov

RUN apt-get update -y && apt-get upgrade -y && apt-get install -y nginx && apt-get clean && rm -rf /var/www && mkdir -p /var/www/company.com /var/www/company.com/img

COPY index.html /var/www/company.com/
COPY x-company.jpg /var/www/company.com/img/

RUN useradd user_nginx && groupadd nginx && usermod -a -G nginx user_nginx && chmod -R 754 /var/www/company.com && chown -R user_nginx:nginx /var/www/company.com

RUN sed -i 's#/var/www/html#/var/www/company.com#g' /etc/nginx/sites-enabled/default && sed -i 's#user\s*\S*;#user  user_nginx;#g' /etc/nginx/nginx.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]

	

	
	



	


