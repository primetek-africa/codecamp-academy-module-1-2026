# PHP and Composer Installation Guide

This guide explains how to install PHP and Composer on:

* Windows
* Linux
* macOS

It also explains how to verify the installation and create a Laravel project.

---

# 1. What Are PHP, Composer, and Laravel?

Before installing anything, it is important to understand the role of each
component.

## PHP

PHP is a server-side programming language used to build web applications,
APIs, command-line tools, and other backend systems.

```text
PHP
 |
 +-- Executes PHP source code
 +-- Provides the PHP runtime
 +-- Provides the CLI used by Laravel
```

## Composer

Composer is the dependency manager for PHP.

It is responsible for installing and managing PHP packages and libraries.

```text
Composer
 |
 +-- Installs PHP dependencies
 +-- Manages package versions
 +-- Creates the vendor directory
 +-- Generates the autoloader
```

## Laravel

Laravel is a PHP web application framework.

Laravel is normally installed using Composer.

```text
PHP
 |
 +-- Composer
       |
       +-- Laravel
```

## Artisan

Artisan is Laravel's command-line interface.

It is used to manage many aspects of a Laravel application.

```text
php artisan
 |
 +-- Create controllers
 +-- Create models
 +-- Create migrations
 +-- Run migrations
 +-- Start the development server
 +-- Execute application commands
```

---

# 2. System Requirements

Before starting, make sure you have:

* A Windows, Linux, or macOS computer
* Internet access
* A terminal application
* Administrator privileges when required
* A code editor such as Visual Studio Code

You should also verify the version of PHP required by the Laravel version
you intend to use.

For a course environment, all students should preferably use compatible
versions of PHP, Composer, and Laravel.

---

# 3. Installing PHP on Windows

There are several ways to install PHP on Windows.

For this course, we recommend using **Chocolatey** because it provides a
simple way to install and manage development tools from the command line.

Windows students can also use **winget**, which is included with modern
Windows installations.

We will cover both methods.

---

# 4. Option A: Install PHP with Chocolatey

## 4.1 What Is Chocolatey?

Chocolatey is a package manager for Windows.

It allows developers to install software from PowerShell or Command Prompt
without manually downloading and configuring every application.

For example:

```text
Chocolatey
    |
    +-- PHP
    |
    +-- Composer
    |
    +-- Git
    |
    +-- Node.js
    |
    +-- Other development tools
```

This makes Chocolatey useful when preparing a development environment.

---

# 5. Install Chocolatey

## 5.1 Open PowerShell as Administrator

Open the Windows Start menu and search for:

```text
PowerShell
```

Right-click **PowerShell** and select:

```text
Run as administrator
```

You should see an Administrator PowerShell window.

---

## 5.2 Check PowerShell

Run:

```powershell
$PSVersionTable.PSVersion
```

You should see the installed PowerShell version.

---

## 5.3 Configure the Execution Policy

Run:

```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force
```

This changes the execution policy only for the current PowerShell
process.

It does not permanently change the execution policy for the system.

---

## 5.4 Configure TLS

Run:

```powershell
[System.Net.ServicePointManager]::SecurityProtocol = `
    [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
```

This enables the TLS protocol required by the Chocolatey installation
script.

---

## 5.5 Install Chocolatey

Run the official Chocolatey installation command:

```powershell
iex ((New-Object System.Net.WebClient).DownloadString(
    'https://community.chocolatey.org/install.ps1'
))
```

Wait until the installation finishes.

If the installation succeeds, Chocolatey should be available from the
terminal.

---

# 6. Verify Chocolatey

Close PowerShell.

Open a **new PowerShell window as Administrator**.

Run:

```powershell
choco --version
```

You should see a version similar to:

```text
2.x.x
```

You can also use:

```powershell
choco -v
```

Both commands display the installed Chocolatey version.

---

# 7. Install PHP with Chocolatey

Once Chocolatey is installed, PHP can be installed with:

```powershell
choco install php -y
```

Chocolatey will download and install PHP.

After the installation completes, close PowerShell and open a new terminal.

Verify PHP:

```powershell
php -v
```

You should see output similar to:

```text
PHP 8.x.x (cli)
```

The exact version depends on the package currently provided by Chocolatey.

---

# 8. Find PHP on Windows

Use:

```powershell
where.exe php
```

You should see the location of the PHP executable.

For example:

```text
C:\tools\php\php.exe
```

The exact location can vary depending on the installation.

You can also inspect the PHP configuration:

```powershell
php --ini
```

---

# 9. Install Composer with Chocolatey

Chocolatey can also install Composer.

Run:

```powershell
choco install composer -y
```

After installation, close PowerShell and open a new terminal.

Verify Composer:

```powershell
composer -V
```

You should see something similar to:

```text
Composer version 2.x.x
```

You can find the Composer executable with:

```powershell
where.exe composer
```

---

# 10. Option B: Install PHP with winget

`winget` is Microsoft's Windows Package Manager.

Check whether it is installed:

```powershell
winget --version
```

Search for PHP packages:

```powershell
winget search PHP.PHP
```

For example, you can install PHP 8.3 with:

```powershell
winget install PHP.PHP.8.3
```

After installation, close PowerShell and open a new terminal.

Verify:

```powershell
php -v
```

---

# 11. Which Windows Installation Method Should I Use?

Both Chocolatey and winget can be used to install development software.

For this course, we recommend choosing **one package manager** rather than
installing the same software with both.

### Chocolatey

```text
Chocolatey
    |
    +-- PHP
    +-- Composer
```

### winget

```text
winget
    |
    +-- PHP
```

If you use Chocolatey for PHP, it is convenient to use Chocolatey for
Composer as well.

For example:

```powershell
choco install php -y
choco install composer -y
```

---

# 12. PHP PATH on Windows

The `PATH` environment variable tells Windows where to find executable
programs.

When you execute:

```powershell
php -v
```

Windows searches the directories configured in `PATH` until it finds
`php.exe`.

Check the PHP executable:

```powershell
where.exe php
```

If Windows cannot find PHP, you may see:

```text
INFO: Could not find files for the given pattern(s).
```

This means PHP is not available through the current `PATH`.

---

# 13. Add PHP to PATH Manually

If PHP was installed but Windows cannot find it:

1. Open Windows Search.
2. Search for `Environment Variables`.
3. Select **Edit the system environment variables**.
4. Select **Environment Variables**.
5. Find the `Path` variable.
6. Select **Edit**.
7. Add the directory containing `php.exe`.
8. Save the changes.
9. Close PowerShell.
10. Open a new PowerShell window.

Then verify:

```powershell
php -v
```

---

# 14. Installing PHP on Linux

PHP installation depends on the Linux distribution.

This section demonstrates installation on Debian and Ubuntu-based systems.

---

## 14.1 Update the Package Repository

Open a terminal and run:

```bash
sudo apt update
```

You can also upgrade installed packages:

```bash
sudo apt upgrade
```

---

## 14.2 Install PHP

Install PHP using:

```bash
sudo apt install php
```

Verify the installation:

```bash
php -v
```

You should see output similar to:

```text
PHP 8.x.x (cli)
```

The exact version depends on your Linux distribution and repositories.

---

# 15. Install Common PHP Extensions on Linux

Laravel applications commonly require additional PHP extensions.

A typical installation may include:

```bash
sudo apt install php-cli
sudo apt install php-mbstring
sudo apt install php-xml
sudo apt install php-curl
sudo apt install php-zip
sudo apt install php-pgsql
```

For PostgreSQL-based Laravel projects, `php-pgsql` is particularly
important.

You can verify installed extensions with:

```bash
php -m
```

To check PostgreSQL support:

```bash
php -m | grep pgsql
```

---

# 16. Installing Composer on Linux

Install the tools required by the Composer installer:

```bash
sudo apt update
```

```bash
sudo apt install curl php-cli unzip
```

Download the Composer installer:

```bash
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
```

Run the installer:

```bash
php composer-setup.php
```

This creates:

```text
composer.phar
```

Install Composer globally:

```bash
sudo mv composer.phar /usr/local/bin/composer
```

Make it executable:

```bash
sudo chmod +x /usr/local/bin/composer
```

Verify:

```bash
composer -V
```

---

# 17. Installing PHP on macOS

The recommended approach for macOS development is Homebrew.

Homebrew is a package manager for macOS.

---

## 17.1 Check Homebrew

Open Terminal and run:

```bash
brew --version
```

If Homebrew is installed, you should see its version.

If Homebrew is not installed, visit:

https://brew.sh/

and follow the official installation instructions.

---

## 17.2 Update Homebrew

Run:

```bash
brew update
```

---

## 17.3 Install PHP

Install PHP using:

```bash
brew install php
```

Verify:

```bash
php -v
```

You should see something similar to:

```text
PHP 8.x.x (cli)
```

---

# 18. Verify PHP on macOS

Check which PHP executable is being used:

```bash
which php
```

You may see:

```text
/opt/homebrew/bin/php
```

on Apple Silicon Macs.

On Intel Macs, the path may be:

```text
/usr/local/bin/php
```

You can also check the PHP configuration:

```bash
php --ini
```

---

# 19. Installing Composer on macOS

Composer can be installed using Homebrew.

Run:

```bash
brew install composer
```

Verify:

```bash
composer -V
```

You should see:

```text
Composer version 2.x.x
```

Check the Composer executable:

```bash
which composer
```

---

# 20. Verify PHP and Composer

Regardless of the operating system, verify both tools.

Run:

```bash
php -v
```

Then:

```bash
composer -V
```

Also check the executable locations.

### Windows

```powershell
where.exe php
```

```powershell
where.exe composer
```

### Linux

```bash
which php
```

```bash
which composer
```

### macOS

```bash
which php
```

```bash
which composer
```

---

# 21. PHP Configuration

PHP uses a configuration file called:

```text
php.ini
```

Find the active configuration file with:

```bash
php --ini
```

On Windows:

```powershell
php --ini
```

This is useful when troubleshooting PHP extensions or configuration
problems.

---

# 22. Check Installed PHP Extensions

Use:

```bash
php -m
```

This displays the PHP extensions currently loaded.

You can inspect the complete PHP configuration with:

```bash
php -i
```

For example, to check PostgreSQL support:

### Linux and macOS

```bash
php -m | grep pgsql
```

### Windows PowerShell

```powershell
php -m | Select-String pgsql
```

---

# 23. Test Composer with a PHP Project

Create a test directory:

```bash
mkdir php-test
```

Enter the directory:

```bash
cd php-test
```

Initialize Composer:

```bash
composer init
```

Composer will ask several questions.

For a basic test, you can accept the default values.

Composer will create:

```text
composer.json
```

---

# 24. Install Dependencies

Run:

```bash
composer install
```

Composer will install the dependencies defined in `composer.json`.

It may create:

```text
vendor/
```

and:

```text
composer.lock
```

The `vendor` directory contains installed PHP packages.

The `composer.lock` file records the exact dependency versions installed
for the project.

---

# 25. Composer Autoloading

Composer generates an autoloader that allows PHP applications to load
installed classes automatically.

After running:

```bash
composer install
```

you will normally have:

```text
vendor/autoload.php
```

PHP applications can load it using:

```php
<?php

require __DIR__ . '/vendor/autoload.php';
```

Laravel uses Composer's autoloading system extensively.

---

# 26. Create a Laravel Project

After PHP and Composer are working correctly, create a Laravel application.

Run:

```bash
composer create-project laravel/laravel vehicle-registration-api
```

Composer will download Laravel and its dependencies.

The command creates:

```text
vehicle-registration-api/
```

---

# 27. Enter the Laravel Project

Run:

```bash
cd vehicle-registration-api
```

Verify Laravel:

```bash
php artisan --version
```

You should see output similar to:

```text
Laravel Framework 12.x
```

The exact version depends on the Laravel version installed.

---

# 28. Start the Laravel Development Server

Run:

```bash
php artisan serve
```

Laravel should display a local development address similar to:

```text
http://127.0.0.1:8000
```

Open that address in your browser.

You should see the Laravel application.

---

# 29. Laravel Project Structure

A new Laravel project contains several important directories.

A simplified structure is:

```text
vehicle-registration-api/
|
+-- app/
|   +-- Http/
|   +-- Models/
|
+-- bootstrap/
|
+-- config/
|
+-- database/
|   +-- migrations/
|   +-- seeders/
|
+-- public/
|
+-- resources/
|
+-- routes/
|
+-- storage/
|
+-- tests/
|
+-- vendor/
|
+-- artisan
+-- composer.json
+-- composer.lock
+-- .env
```

Some directories and files may vary between Laravel versions.

---

# 30. Understanding the Laravel CLI

Laravel provides the Artisan command-line interface.

Display available commands:

```bash
php artisan
```

Display the Laravel version:

```bash
php artisan --version
```

Display application routes:

```bash
php artisan route:list
```

Create a controller:

```bash
php artisan make:controller VehicleController
```

Create a model:

```bash
php artisan make:model Vehicle
```

Create a migration:

```bash
php artisan make:migration create_vehicles_table
```

---

# 31. Common Installation Problems

## PHP Command Not Found

Windows may display:

```text
php is not recognized
```

Linux or macOS may display:

```text
php: command not found
```

PHP may not be installed or may not be available through `PATH`.

### Windows

```powershell
where.exe php
```

### Linux and macOS

```bash
which php
```

---

## Composer Command Not Found

If you see:

```text
composer: command not found
```

or the equivalent Windows error, verify Composer's installation and
`PATH`.

### Windows

```powershell
where.exe composer
```

### Linux and macOS

```bash
which composer
```

---

## Wrong PHP Version

Check the installed version:

```bash
php -v
```

Laravel has specific PHP version requirements.

Always check the Laravel documentation for the version you are teaching
before standardizing the PHP version for a class.

---

## Missing PHP Extension

Composer may report errors such as:

```text
ext-xxx is missing
```

This means a required PHP extension is not installed or enabled.

Check installed extensions:

```bash
php -m
```

Then install or enable the required extension for your operating system.

---

# 32. Recommended Installation Checklist

Before starting the Laravel project, verify all of the following.

## PHP

```bash
php -v
```

Expected:

```text
PHP 8.x.x (cli)
```

## Composer

```bash
composer -V
```

Expected:

```text
Composer version 2.x.x
```

## PHP Extensions

```bash
php -m
```

Confirm that the extensions required by your Laravel project are available.

## Laravel

```bash
php artisan --version
```

Expected:

```text
Laravel Framework 12.x
```

## Laravel Server

```bash
php artisan serve
```

Expected:

```text
http://127.0.0.1:8000
```

---

# 33. Complete Installation Flow

The overall development environment can be represented as:

```text
Operating System
       |
       +-- Package Manager
       |     |
       |     +-- Windows: Chocolatey / winget
       |     +-- Linux: apt
       |     +-- macOS: Homebrew
       |
       +-- PHP
       |    |
       |    +-- PHP CLI
       |    +-- PHP Extensions
       |
       +-- Composer
       |    |
       |    +-- PHP Dependencies
       |    +-- Autoloading
       |
       +-- Laravel
            |
            +-- Artisan
            +-- Application
            +-- API
            +-- Database
```

The basic workflow is:

```text
Install Package Manager
          |
          v
Install PHP
          |
          v
Verify PHP
          |
          v
Install Composer
          |
          v
Verify Composer
          |
          v
Create Laravel Project
          |
          v
Enter Project Directory
          |
          v
Run Artisan
          |
          v
Start Laravel Server
```

---

# 34. Quick Reference

## Windows with Chocolatey

```powershell
choco install php -y
choco install composer -y
php -v
composer -V
composer create-project laravel/laravel vehicle-registration-api
cd vehicle-registration-api
php artisan --version
php artisan serve
```

## Windows with winget

```powershell
winget install PHP.PHP.8.3
php -v
composer -V
composer create-project laravel/laravel vehicle-registration-api
cd vehicle-registration-api
php artisan --version
php artisan serve
```

## Ubuntu / Debian

```bash
sudo apt update
sudo apt install php php-cli php-mbstring php-xml php-curl php-zip
php -v
composer -V
composer create-project laravel/laravel vehicle-registration-api
cd vehicle-registration-api
php artisan --version
php artisan serve
```

## macOS

```bash
brew update
brew install php
brew install composer
php -v
composer -V
composer create-project laravel/laravel vehicle-registration-api
cd vehicle-registration-api
php artisan --version
php artisan serve
```

---

# 35. Final Verification

At the end of the installation, every student should be able to execute:

```bash
php -v
```

```bash
composer -V
```

and, inside a Laravel project:

```bash
php artisan --version
```

Finally:

```bash
php artisan serve
```

If all four commands work correctly, the PHP and Laravel development
environment is ready.

---

# 36. Important Concepts to Remember

| Tool            | Purpose                            |
| --------------- | ---------------------------------- |
| PHP             | Programming language and runtime   |
| Chocolatey      | Windows package manager            |
| winget          | Windows package manager            |
| Homebrew        | macOS package manager              |
| apt             | Debian/Ubuntu package manager      |
| Composer        | PHP dependency manager             |
| Laravel         | PHP web application framework      |
| Artisan         | Laravel command-line interface     |
| PHP Extensions  | Additional PHP functionality       |
| `php.ini`       | PHP configuration                  |
| `composer.json` | Project dependency definition      |
| `composer.lock` | Exact dependency versions          |
| `vendor/`       | Installed Composer dependencies    |
| `.env`          | Environment-specific configuration |

The most important relationship is:

```text
Operating System
       |
       +-- Package Manager
       |
       +-- PHP
             |
             +-- Composer
                   |
                   +-- Laravel
                         |
                         +-- Artisan
```

Once this environment is correctly installed, you can continue with the
**Vehicle Registration API** project and begin working with Laravel,
PostgreSQL, migrations, models, controllers, services, and REST endpoints.
