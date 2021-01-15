#!/bin/bash
sleep 30 ; ldapmodify -h ldap-service -p 389 -w '123456' -D 'cn=admin,dc=techinterview,dc=com'  -f  /ldif_files/create_ou_users.ldif