# doctor-credentialing-app
Doctor Credentialing Application

## Angular Highlights
* Authentication Guards
* i18n - Internationalization / Localization using locale property from JWT
* Setting page title
* CRUD using modal
* Form Validations

## Default Accounts
* Admin
    * U: admin@email.com
    * P: Password@123
* Approver
    * U: approver@email.com
    * P: Password@123

## How to create certificate.pfx?

To create a certificate in the **`.pfx `** format, you can use various tools and methods. One common approach is to use OpenSSL, a widely used open-source tool for working with SSL/TLS protocols and certificates.

Here are the general steps to create a self-signed certificate and export it as a **`.pfx`** file using OpenSSL:

1. **`Install OpenSSL`**:
Make sure you have OpenSSL installed on your machine. You can download it from the official website or use a package manager if you're on a Unix-like system.

* **`Windows`**: https://www.xolphin.com/support/OpenSSL/OpenSSL_-_Installation_under_Windows

2. **`Open a Terminal or Command Prompt`**:

Open a terminal or command prompt where you can run OpenSSL commands.

3. **`Generate a Private Key`**:

Use the following command to generate a private key. You'll be prompted to enter a passphrase for the key.

```bash
openssl genpkey -algorithm RSA -out private-key.pem
```

4. **`Generate a Certificate Signing Request (CSR)`**:

Use the following command to generate a CSR. You'll be prompted to enter information about your organization.

```bash
openssl req -new -key private-key.pem -out csr.pem
```

5. **`Generate a Self-Signed Certificate`**:

Use the following command to generate a self-signed certificate using the private key and CSR.

```bash
openssl x509 -req -in csr.pem -signkey private-key.pem -out certificate.pem
```

6. **`Export as PFX`**:

Finally, use the following command to export the private key and certificate as a **`.pfx`** file. You'll be prompted to set a password for the **`.pfx`** file.

```bash
openssl pkcs12 -export -out certificate.pfx -inkey private-key.pem -in certificate.pem
```

At this point, you'll have a **`certificate.pfx`** file that you can use in your C# application.

Please note that using a self-signed certificate is suitable for development and testing, but for production, you should obtain a certificate from a trusted Certificate Authority (CA). The process for obtaining a certificate from a CA typically involves creating a CSR, submitting it to the CA, and then installing the CA-issued certificate on your server.

## Docker Actual Commands
```bash

docker-compose build
docker network create app_network
docker images -a
docker ps -a
docker create --network=app_network --name db --hostname db -p 1433:1433 [image_id]
docker start db
docker logs db
docker create --network=app_network --name app --hostname app -p 44449:80 [image_id]
docker start app
docker logs app

```

## Docker Test Commands
```bash

sudo -s

sudo docker build -t doctor-credentialing-app .
sudo docker create --name doctor-credentialing-app --hostname doctor-credentialing-app [image_id]
sudo docker images
sudo docker ps -a
sudo docker create --name doctor-credentialing-app --hostname doctor-credentialing-app -p 8001:80 [image_id]
sudo docker run -p 8001:80 -it --rm doctor-credentialing-app --name doctor-credentialing-app --hostname doctor-credentialing-app

sudo docker container stop $(sudo docker ps -aq)
sudo docker rm -vf $(sudo docker ps -aq)
sudo docker rm -f $(sudo docker ps -aq)
sudo docker rmi -f $(sudo docker images -aq)
docker system prune

# https://medium.com/bright-days/basic-docker-image-dockerfile-sql-server-with-custom-prefill-db-script-8f12f197867a
# https://augustl.com/blog/2019/sql_server_docker_image_recipe/

docker build -t doctor-credentialing-db .
docker create --name doctor-credentialing-db --hostname doctor-credentialing-db -p 1433:1433 [image_id]
docker start doctor-credentialing-db
docker exec -it doctor-credentialing-db "bash"

/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P "Password123"

```

```sql
--https://discourse.ubuntu.com/t/microsoft-sql-server-2019-on-ubuntu-20-04/21943
SELECT Name from sys.Databases;
GO
USE DoctorCredentialingApp;
GO

--https://chartio.com/resources/tutorials/sql-server-list-tables-how-to-show-all-tables/
SELECT * FROM INFORMATION_SCHEMA.TABLES;
GO

--https://learn.microsoft.com/en-us/sql/t-sql/functions/serverproperty-transact-sql?view=sql-server-ver16
SELECT SERVERPROPERTY('ServerName') AS ComputerName
GO
```

