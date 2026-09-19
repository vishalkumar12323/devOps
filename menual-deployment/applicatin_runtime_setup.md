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

Unzip the project files into runable dir ex. /application/my_project.
```bash
sudo mkdir /application/my_project
```
```bash
tar -xzvf /tmp/my_app
```

Change owner and permissions. pwd:/application/my_project
```bash
sudo chown -R username:group_name .
```

Install required modules and packages.
```bash
sudo apt update
sudo apt install nginx postgresql postgres-contrib
```

Install Node using NVM.
```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.7/install.sh | bash
\. "$HOME/.nvm/nvm.sh"

nvm install 24 # or --lts

# Verify
node -v # Return node version: v24.20.0
npm -v # Return npm version: 11.19.0
```
