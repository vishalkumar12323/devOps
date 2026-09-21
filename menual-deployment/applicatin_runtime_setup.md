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

Change owner and permissions for the project directory. pwd:/application/my_project
```bash
sudo chown -R username:group_name .
```

Install required modules and packages.
```bash
sudo apt update
sudo apt install nginx postgresql postgres-contrib -y
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

Install pm2 for Node.js applications process management.
```bash
npm install --global pm2 # install globally
```

Go to project directory
```bash
cd /<project-folder>
```
Install project dependencies and build if using TypeScript.
```bash
npm install
npm run build
```

Run the backend using pm2 in the background
```bash
pm2 start ./dist/index.js
```
Adavnce Configration: Instead of passing long flags in the command line, declare your deployment settings in a configuration file.
Create a file named ecosystem.config.js in your backend root folder:
```bash
module.exports = {
    app: [
        {
            name: 'backend-api',
            script: './dist/server.js',
            instences: 'max', #🚀 Cluster mode: utilizes all available CPU cores
            exec_mode: 'cluster', # Enables load balancing across CPU cores
            watch: false, # Set true only in dev; false in production
            max_memory_restart: '1G', # Auto-restarts if a memory leak exceeds 1GB
            env_production: {
                NODE_ENV: 'production',
                PORT: 3001
            }
        }
    ]
}
```