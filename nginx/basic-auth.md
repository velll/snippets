---
title: "Basic authentication in nginx"
---

You're gonna need a `htpasswd` file. doesnt matter where you put it really. I just leave it with all the other nginx stuff.

```
# cd /etc/nginx
# touch htpasswd
```

Here's approximately what contents you're shooting for.
```
john:$apr1$1234567890abcdef
```

So add your login first. Notice `:`.
```
# sh -c "echo -n 'john:' >> htpasswd"
```

Then generate a hash and add it.
```
# sh -c "openssl passwd -apr1 >> htpasswd"
```

OpenSSL will ask for a password
```
Password:
Verifying - Password:
```

Check your file contents:
```
# less htpasswd
```

Go to your nginx config then and specify the file you've just created.
```
location / {
   try_files $uri $uri.html $uri/ =404;

   auth_basic "Restricted Content";
   auth_basic_user_file /etc/nginx/htpasswd;
 }
```
