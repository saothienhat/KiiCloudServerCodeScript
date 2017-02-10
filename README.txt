
Every command execution requires at least the following context information: site, app-id, app-key, client-id and client-secret or token

1) Step 1: download kii-cli lib from Kii ( Refer at https://docs.kii.com/en/guides/commandlinetools/)
2) Step 2: put downloaded kii-cli at Step 1 into folder which contains this README file. Then, you will have folder with below structure:

## Project structure

- Files folder: source code
- KiiHookConfig folder : server hook configuration file defines the timing when your server code is launched ( Refer https://docs.kii.com/en/guides/serverextension/managing_servercode/server_hook/)
- KiiServerCode folder: folder contain final servercode.js file
- Download kii-cli folder at step 1 : Kii command line interface to use with server code ( Refer at https://docs.kii.com/en/guides/commandlinetools/)
- runScript4Window.bat file: utility for Window system ==> RUN IT if your system is Window
- README.txt


3) Step 3: set up enviroments for your Kii project

### Install node modules
Install the command line tool by running the below commands in your terminal
`````````
cd kii-cli
npm install
`````````

### Setup configuration for your Kii project
-	In "runScript4Window.bat" file, input your configuration at "Initialize: please fill "your_" parameters with your data" part

### Change environments
Server code requires you to put your application's AppID and AppKey as well as your ClientID and ClientSecret as parameters. 
You can get the required parameters for authentication from the developer portal site of your application.

(Refer https://docs.kii.com/en/guides/commandlinetools/)

- Deploy server code

(Refer https://docs.kii.com/en/guides/serverextension/managing_servercode/tool_deploy/)

- Get log file server code

(Refer https://docs.kii.com/en/guides/commandlinetools/devlog/)

- List the available versions

(Refer https://docs.kii.com/en/guides/serverextension/managing_servercode/tool_listup/)

(Refer https://docs.kii.com/en/guides/serverextension/executing_servercode/tool_scheduled_list/)

4) Step 4: How to run

### Run script
-	Run runScript4Window.bat file if your system is Window

