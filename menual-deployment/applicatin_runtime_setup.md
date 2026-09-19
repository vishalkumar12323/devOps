# In this guide we move our local application code to cloud, Install the required runtimes(Node.js, Python) and configure process managers(pm2, guvicorn).

We need to copy the project files from local machine to server machine.
First on the local machine create a .zip or .tar copy of your project inside the root of project dir.
```bash
tar -czvf project_code.tar.gz --exclude='node_modules' --exclude='venv' --exclude='__pycache__' --exclude='.git' .
```

Copy the zipped folder Using SCP (Secure Copy Protocol)
```bash
scp project_code.tar.gz <username>@<ip_address>:/tmp/my_app
```
