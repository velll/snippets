---
title: 'Python 3 environments'
---
Packing stuff to your global environment isn't good, mkay? Python 3 comes with out-of-the-box support for environments.

Create a new environment  in the current directory.
```bash
$ python3 -m venv env
```
The command will create a new directory called `env`.
```bash
$ ls -l
total 0
drwxr-xr-x  6 paul  staff  192 Jan 27 18:52 env
```

Your environment is there but it's not quite over yet. **Activate** it
```bash
$ source env/bin/activate
```
`env` is again the name of the environment. You're gonna see it's working as your prompt has changed to
```
(env) $
```

# Deactivating
```bash
(env) $ deactivate
```
deactivates the environment. You're gonna see it's working as your prompt has changed back to
```
$
```

Now you can leave your project and go about doing something else. When you're back, just activate the environment again.

# One more thing

Hey, about that directory you've created. Don't touch it, and it's gonna be fine. Make sure to add it to your .gitignore.
```bash
$ echo "env/*" >> .gitignore
```
