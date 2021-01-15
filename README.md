# REST LDAP API

Simple Rest API to manage users in an LDAP server. 

## Requirements

For building and running the application you need:

- [JDK 1.8](http://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html)
- [Maven](https://maven.apache.org)
- [Docker](https://docs.docker.com/install/)
- [Docker Compose](https://docs.docker.com/compose/install/)


This application has three services (**OPENLDAP Server**, **User management API** and **Phpldapadmin**)


In order to get started be sure to clone this project onto your Docker Host. 

### Clone this project

Clone this project onto your Docker Host. Create a directory on your host:

``` shell
git clone https://github.com/sabrinalanny/ldap.git
```

Once you've cloned the project to your host we can now start this project. Navigate to the directory in which you cloned the project. Run the following commands on directory ldap/ldapapi

``` shell
mvn clean install
```

In the ldap directory, run the following command

``` shell
docker-compose run
```

That's it.

You can access phpLDAPadmin on https://localhost:6443


## Test API

The REST API is described below.
### Request

`GET /Users/`

    curl -X GET "http://localhost:8080/Users" -H "accept: application/json;charset=UTF-8"
    
### Response

    HTTP/1.1 200 OK
    
    [  {  "cn":  "string",  "sn":  "string",  "uid":  "string"  }  ]

## Create a new user

### Request

`POST /Users`

    curl -X POST "http://localhost:8080/Users" -H "accept: application/json;charset=UTF-8" -H "Content-Type: application/json" -d "{ \"cn\": \"Nome\", \"sn\": \"Nome\", \"uid\": \"teste\"}"
    
### Response

    HTTP/1.1 201 Created
    
	{"uid":"teste","cn":"Nome","sn":"Nome"}

## Get a specific user

### Request

`GET /Users/uid`

    curl -X GET "http://localhost:8080/Users/sabrina" -H "accept: application/json;charset=UTF-8"
    
### Response

    HTTP/1.1 200 OK
    
    {"uid":"sabrina","cn":"Sabrina","sn":"Queiroz"}

## Get a non-existent user

### Request

`GET /Users/id`

    curl -X GET "http://localhost:8080/Users/jose" -H "accept: application/json;charset=UTF-8"

### Response

    HTTP/1.1 404 Not Found
   
    {"message":"User Not Found","details":["User not found : jose"]}
    
## Delete a user

### Request

`DELETE /Users/uid`

    curl -X DELETE "http://localhost:8080/Users/teste" -H "accept: application/json;charset=UTF-8"

### Response

    HTTP/1.1 200 OK
    
    {  "message":  "User deleted successfully"  }


## Try to delete same user again

### Request

`DELETE /Users/id`

    curl -X DELETE "http://localhost:8080/Users/teste" -H "accept: application/json;charset=UTF-8"
### Response

    HTTP/1.1 404 Not Found
    
    {  "message":  "User Not Found",  "details":  [  "User not found"  ]  }

## Swagger 

[swagger.json](http://localhost:8080/v2/api-docs)

[swagger-ui](http://localhost:8080/swagger-ui.html)
