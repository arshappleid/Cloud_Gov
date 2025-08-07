# 1. Create a new user without a home directory and no shell access. Only one user in the group
sudo useradd --no-create-home --shell /usr/sbin/nologin deployuser

# 2. Set ownership of /app to the new user, but only for the code (except the .jar and deploy.sh)
sudo chown -R deployuser:deployuser /app

# 3. Set permissions:
#   - Grant read/write/execute to deployuser on /app except .jar and deploy.sh
#   - Grant only execute to deployuser for the .jar file and deploy.sh

# 3a. Set restrictive permissions for all files in /app
sudo chmod -R o-rwx,g-rwx /app

# 3b. Give deployuser full access to all files except the .jar and deploy.sh
sudo find /app -type f ! -name "*.jar" ! -name "deploy.sh" -exec chmod 700 {} \;

# 3c. Set execute-only permission on the jar and deploy.sh for deployuser. Jar file needs read permission for the JVM.
sudo chmod 500 /app/your-app.jar
sudo chmod 100 /app/deploy.sh

