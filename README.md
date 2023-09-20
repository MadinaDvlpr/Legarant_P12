<!-- Improved compatibility of back to top link: See: https://github.com/Magda-dev -->
<a name="readme-top"></a>
<!--
*** Thanks for checking out this Heroku project
*** Don't forget to give the project a star!
*** Thanks again! Now go create your AWESOME Heroku App! :D
-->
<!-- HEADER README -->

<div align="center">
  <a href="https://github.com/Magda-dev/LearnGit">
    <img width="950" height="500" src="images/header-img.png" alt="Logo" width="80" height="80">
  </a>

  <h1> align="center">Legarant Application Connectée Salesforce</h1>
  <img src="images/img-header.png" alt="Logo" width="80" height="80">

| 👩‍💼Contributors      |📅 Release Date             |🛠    Build              |🧪 Social  |
|:----   |:----:    |:----:    |----:    |
| [![CONTRIBUTOR](https://img.shields.io/badge/Larmet-white?style=flat&label=Magdalena%20&labelColor=%23000000&color=%2361DBD1)](https://www.linkedin.com/in/magdalenalarmet-salesforce-developpeur/)      | [![RELEASE DATE](https://img.shields.io/badge/September%202023-white?style=flat&label=Snapshot&labelColor=%23000000&color=%23FFFFFF)](https://github.com/Magda-dev/Legarant_P12)      |  [![BUILD](https://img.shields.io/badge/passed-brightgreen?style=flat&label=BUILD&labelColor=%23000000&color=%2361f522)](https://github.com/Magda-dev/Legarant_P12)      |   [![LINKEDIN](https://img.shields.io/badge/Magdalena%20Larmet-white?style=flat&label=Linkedin&labelColor=%23000000&color=%23004182&link=https%3A%2F%2Fwww.linkedin.com%2Fin%2Fmagdalenalarmet-salesforce-developpeur%2F)](https://www.linkedin.com/in/magdalenalarmet-salesforce-developpeur/) |   


<!-- PROJECT SHIELDS -->
<!--
*** I'm using markdown "reference style" links for readability.
*** Reference links are enclosed in brackets [ ] instead of parentheses ( ).
*** See the bottom of this document for the declaration of the reference variables
*** for contributors-url, forks-url, etc. This is an optional, concise syntax you may use.
*** https://www.markdownguide.org/basic-syntax/#reference-style-links
-->


</div>

## About the project
*Author : * Magdalena Larmet

This project is part of Openclassrooms' studying path.
This mobile web application has been completed for Legarant Company. LEGARANT is a life insurance company founded in 1980 and located in Nantes, France. They offer insurance products with several options at competitive prices.

### Technologies and Languages

This is an Salesforce Apex project usine API calls with Postman. It is running on Heroku and use Heroku Connect and Heeroku Postgre to get and insert data into Salesforce. 


## How to deploy the app ?

### Install the app package in your Salesforce org 

Go to Salesforce and create you own regular org or sandbox.
Then simply use the deploy to Salesforce org button to install the package on your own org and follow the 3 steps.</br>

<a href="https://githubsfdeploy.herokuapp.com/?owner=Magda-dev;repo=Legarant_P12">
  <img alt="Deploy to Salesforce"
       src="https://raw.githubusercontent.com/afawcett/githubsfdeploy/master/src/main/webapp/resources/img/deploy.png">
</a>
</br>

Here are some documentation resources to get you started with Salesforce :


#### Configure Your Salesforce DX Project
The `sfdx-project.json` file contains useful configuration information for your project. See [Salesforce DX Project Configuration](https://developer.salesforce.com/docs/atlas.en-us.sfdx_dev.meta/sfdx_dev/sfdx_dev_ws_config.htm) in the _Salesforce DX Developer Guide_ for details about this file.


#### Read more About Salesforce
- [Salesforce Extensions Documentation](https://developer.salesforce.com/tools/vscode/)
- [Salesforce CLI Setup Guide](https://developer.salesforce.com/docs/atlas.en-us.sfdx_setup.meta/sfdx_setup/sfdx_setup_intro.htm)
- [Salesforce DX Developer Guide](https://developer.salesforce.com/docs/atlas.en-us.sfdx_dev.meta/sfdx_dev/sfdx_dev_intro.htm)
- [Salesforce CLI Command Reference](https://developer.salesforce.com/docs/atlas.en-us.sfdx_cli_reference.meta/sfdx_cli_reference/cli_reference.htm)


### Install Postman
You can use the Postman desktop app or the Postman web UI to connect to Salesforce with the Salesforce APIs collection:

<a href="https://www.postman.com/downloads/" target="_blank"><img src="https://run.pstmn.io/button.svg" alt="Run in Postman"></a>

<a href="https://www.youtube.com/watch?v=W-IwW6RM4F0&ab_channel=SalesforceDevelopers">🎥 Video instructions</a></br>
<a href="https://www.postman.com/downloads/">Downloap Postman</a></br>
<a href="https://github.com/forcedotcom/postman-salesforce-apis/blob/master/install-with-app.md#install-the-postman-app">Install the Postman App </a></br>
<a href="https://quickstarts.postman.com/">How to get started with Postman</a></br>

For instructions on how to install and set up Postman please visit : 

🎥 [Video instructions](https://youtu.be/W-IwW6RM4F0)

- [Install the Postman App](#install-the-postman-app)
- [Fork the Collection](#fork-the-collection)
- [Configure the Collection](#configure-the-collection)
- [Authenticate with Salesforce](#authenticate-with-salesforce)
- [Execute a Request](#execute-a-request)

See [additional documentation](README.md#additional-documentation) for more information on how to keep the collection up to date and work with multiple Salesforce orgs.


### Connect and deploy The app with Heroku in a few clicks

Sign in to a paid account on Heroku to get started. 
In this app Contact and Contract object are used and mapped in Heroku.
Only Heroku Postgre (paid) and Heroku Connect add-ons are needed (Free version).

For simple deployment on Heroku platform use this handy Heroku-button 
[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy?template=https://github.com/Magda-dev/Legarant_P12)

## Command lines for Heroku
```
$ heroku create
$ git push heroku main
$ heroku open
```

Now you are all set to try out the app ! 
