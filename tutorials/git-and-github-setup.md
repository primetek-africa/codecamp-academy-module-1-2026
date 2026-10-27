# Git Bash SSH Integration with GitHub on Windows

---

## Prerequisites

Before starting, make sure you have the following:

- Windows 10 or Windows 11
- Git for Windows installed
- A GitHub account
- Git Bash available from the Start menu
- An Internet connection

> **Note**
>
> GitHub recommends using **Ed25519** keys because they provide strong
> security with excellent performance. This tutorial uses the recommended
> algorithm.

---

## Tutorial

### 1. Generate a new SSH key

Open **Git Bash** and run:

```bash
ssh-keygen -t ed25519 -C "your_email@example.com"
```

### 2. Choose the SSH key location

Press **Enter** to save the key in the default location:

```text
C:\Users\YOUR_USERNAME\.ssh\
```

Or specify a custom location if preferred.

### 3. Create a passphrase

Enter a secure passphrase and then enter it again to confirm.

> **Recommendation**
>
> Although a passphrase is optional, it is strongly recommended because it
> protects your private SSH key if your computer is lost or compromised.

---

## Configure the SSH Agent

### 4. Open PowerShell as Administrator

Search for **PowerShell**, right-click it, and select **Run as
administrator**.

### 5. Configure the SSH Agent service

Run the following command:

```powershell
Get-Service ssh-agent | Set-Service -StartupType Automatic
```

This configures the **OpenSSH Authentication Agent** service to start
automatically whenever Windows starts.

### 6. Start the SSH Agent

```powershell
Start-Service ssh-agent
```

### 7. Close the Administrator PowerShell window

---

## Add the SSH Key to the Agent

### Using PowerShell

### 8. Open a normal PowerShell window

### 9. Add the SSH private key to the SSH Agent

```powershell
ssh-add $env:USERPROFILE\.ssh\id_ed25519
```

Enter your passphrase when prompted.

---

### Alternative Using Command Prompt (CMD)

Open a normal **Command Prompt** window and run:

```cmd
ssh-add C:\Users\YOUR_USERNAME\.ssh\id_ed25519
```

Enter your passphrase when prompted.

---

## Register the Public Key on GitHub

### 10. Display the public SSH key

Open **Git Bash** and run:

```bash
cat ~/.ssh/id_ed25519.pub
```

Copy the entire contents of the displayed public key to your clipboard.

---

### 11. Add the SSH key to your GitHub account

In your GitHub account, navigate to:

```text
Settings
└── SSH and GPG keys
    └── New SSH key
```

Complete the form:

- **Title:** Enter a descriptive name for the device (for example,
  **My Windows Laptop**).
- **Key:** Paste the public SSH key copied in the previous step.

Click **Add SSH key**.

---

## Verify the SSH Connection

### 12. Test the connection

Open **Git Bash** and run:

```bash
ssh -T git@github.com
```

The first time you connect, you may see a message similar to:

```text
The authenticity of host 'github.com (IP ADDRESS)' can't be established.
ED25519 key fingerprint is
SHA256:+DiY3wvvV6TuJJhbpZisF/zLDA0zPMSvHdkr4UvCOqU.
Are you sure you want to continue connecting (yes/no/[fingerprint])?
```

### 13. Confirm the connection

Type:

```text
yes
```

If everything is configured correctly, GitHub will respond with a message
similar to:

```text
Hi USERNAME! You've successfully authenticated, but GitHub does not
provide shell access.
```

---

## Troubleshooting

### "ssh-agent service is not running"

If you receive an error indicating that the SSH Agent is not running,
verify that the service has been started by running:

```powershell
Start-Service ssh-agent
```

If necessary, repeat Steps **4–6**.

---

### "Permission denied (publickey)"

If authentication fails:

- Verify that the public key was correctly added to your GitHub account.
- Confirm that the correct private key has been added to the SSH Agent.
- Check that you are using the correct GitHub account.

You can list the currently loaded SSH keys with:

```bash
ssh-add -l
```

---

### Verify the registered remote repository

To confirm that your Git repository uses SSH instead of HTTPS, run:

```bash
git remote -v
```

An SSH remote should look similar to:

```text
origin  git@github.com:USERNAME/REPOSITORY.git (fetch)
origin  git@github.com:USERNAME/REPOSITORY.git (push)
```

If your remote uses HTTPS instead, update it with:

```bash
git remote set-url origin git@github.com:USERNAME/REPOSITORY.git
```

---

## References

- GitHub Docs — Connecting to GitHub with SSH
- GitHub Docs — Generating a new SSH key
- GitHub Docs — Testing your SSH connection
