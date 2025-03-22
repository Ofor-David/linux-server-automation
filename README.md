**# Automated Linux Server Setup & Monitoring**

## Overview

This project provides a single-script solution to transform an existing Ubuntu installation into a lean, production-like server environment. The script automatically updates the system, installs essential server components, creates a new administrative user, and configures the firewall and SSH services. With one command, you can have your server up and running, secure and ready for further customization.

## Features

- ****System Update****: Updates and upgrades installed packages to ensure the system is current.
- ****Essential Package Installation****: Installs critical packages such as:
  - `openssh-server` for remote access,
  - `nginx` as a web server,
  - `ufw` for firewall management,
  - `fail2ban` for security,
  - `git` for version control.
- ****User Management****: Creates a new administrative user and grants sudo privileges.
- ****Firewall Configuration****: Configures UFW to allow SSH and Nginx traffic, securing the server.
- ****Automation****: A single `setup.sh` script performs all the necessary tasks for a streamlined server setup.

## Requirements

- An Linux system (Server)
- A working internet connection

## Installation & Setup

### Step 1: Clone the Repository on Your Server

From your server, clone the repository:

```bash
git clone https://github.com/Ofor-David/linux-server-automation.git
cd linux-server-automation
```

### Step 2: Run the Setup Script

Make the script executable and run it with root privileges:

```bash
chmod +x setup.sh
sudo ./setup.sh
```

### What the Script Does

1. ****Updates the System****
   - Executes `apt update && apt upgrade -y` to ensure all packages are current.

2. ****Installs Essential Server Packages****
   - Installs `openssh-server` for SSH access.
   - Installs `nginx` for web serving.
   - Installs `ufw` for firewall management.
   - Installs `fail2ban` for added security.
   - Installs `git` if it’s not already present.

3. ****Configures SSH****
   - Enables and starts the SSH service to allow remote connections.

4. ****Creates a New User****
   - Creates a new user with a specified password (default: 'password123')
   - Adds the user to the sudo group.

5. ****Configures the Firewall****
   - Allows SSH and Nginx traffic via UFW.
   - Enables UFW to secure the server.

## Testing the Setup

### Verify SSH Connectivity

1. Find your server's IP address:
   ```bash
   ip addr show
   ```
2. Connect via SSH:
   ```bash
   ssh serveradmin@<SERVER_IP>
   ```
   _(Replace_ _`<SERVER_IP>`_ _with your server’s actual IP address.)_

### Test Nginx

1. Open a web browser and navigate to:
   ```
   http://<SERVER_IP>
   ```
2. You should see the default Nginx welcome page if Nginx is running correctly.

## Troubleshooting

- ****SSH Service Issues****:
  If SSH is not active, start it manually:
  ```bash
  sudo systemctl start ssh
  sudo systemctl status ssh
  ```

## Future Enhancements

- Automate SSH key-based authentication.
- Integrate additional security configurations (e.g., custom Fail2Ban rules).
- Add monitoring tools for system performance.
- Allow custom package installation options.

## License

This project is licensed under the MIT License.

## Contributing

Feel free to fork this repository and submit pull requests with improvements.
