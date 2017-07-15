OSECZ.org
=========
[OSECZ.org][WEBSITE] is a website for the [#osecz][CHANNEL] community.
The website and the community channel are meant to promote discussion
and collaboration on open source security projects, security tools,
protocols and standards.

This repository contains the source code of the website. The sections
below document how to set up the development and the live environment of
the website.

Note that the osecz website is developed primarily on a Debian system,
so the steps below are written for Debian system. To develop this
website on any other system, some of the steps below may have to be
modified.

[WEBSITE]: https://osecz.org/
[CHANNEL]: http://webchat.freenode.net/?channels=osecz


Contents
--------
* [Development Setup](#development-setup)
* [Live Setup](#live-setup)
* [Resources](#resources)
* [License](#license)
* [Support](#support)


Development Setup
-----------------
Perform the following steps to setup the development environment for
the website on local system.

 1. Install necessary tools.

        sudo apt-get update
        sudo apt-get -y install nginx git make
        wget https://raw.githubusercontent.com/sunainapai/oyster/master/oyster
        chmod u+x oyster
        sudo mv oyster /usr/local/bin

 2. Clone this repository.

        mkdir -p ~/git
        cd ~/git
        git clone https://github.com/osecz/osecz.org.git

 3. Configure Nginx for development.

        sudo ln -sf ~/git/osecz.org/etc/nginx/dev.osecz.org /etc/nginx/sites-enabled/osecz.org
        sudo ln -sf ~/git/osecz.org/_live /var/www/osecz.org
        sudo systemctl reload nginx

 4. Associate the hostname `osecz` with the loopback interface.

        echo 127.0.2.1 osecz | sudo tee -a /etc/hosts

 5. Generate the website.

        cd ~/git/osecz.org
        make

 6. Visit http://osecz/ with a web browser to see a local copy of the
    website.


Live Setup
----------
Perform the following steps to setup the live environment on an internet
facing server.

 1. Log in as root and create user account for the osecz service.

        adduser osecz --gecos ""
        adduser osecz sudo

 2. Log in as the new user and perform steps 1, 2, 3 and 6 from the
    previous section.

 3. Install certbot.

        echo 'deb http://ftp.debian.org/debian jessie-backports main' | sudo tee /etc/apt/sources.list.d/backports.list
        sudo apt-get update
        sudo apt-get install certbot -t jessie-backports

 3. Get TLS certificates.

       sudo certbot certonly --webroot -w /var/www/osecz.org osecz.org@gmail.com -d osecz.org,www.osecz.org --agree-tos -m 

 4. Configure Nginx for the live website.

        sudo rm /etc/nginx/sites-enabled/dev.osecz.org
        sudo ln -sf ~/git/osecz.org/etc/nginx/osecz.org /etc/nginx/sites-enabled
        sudo systemctl reload nginx

 5. Visit https://osecz.org/ with a web browser to see a local copy of
    the website.


Resources
---------
Here is a list of useful links about this project.

- [Source code](https://github.com/osecz/osecz.org)
- [Issue tracker](https://github.com/osecz/osecz.org/issues)
- [Freenode IRC: #osecz](http://webchat.freenode.net/?channels=osecz)


License
-------
This is free and open source software. You can use, copy, modify,
merge, publish, distribute, sublicense, and/or sell copies of it,
under the terms of the MIT License. See [LICENSE.md][L] for details.

This software is provided "AS IS", WITHOUT WARRANTY OF ANY KIND,
express or implied. See [LICENSE.md][L] for details.

[L]: LICENSE.md


Support
-------
To report bugs, suggest improvements, or ask questions, please visit
<https://github.com/susam/osecz/osecz.org>.
