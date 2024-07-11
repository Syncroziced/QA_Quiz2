How to set up device until runable
<pre>
Table of Contents
1.Prerequisites
2.Installation
3.Project Structure
4.Running Tests
</pre>

1.Prerequisites
Before you begin, ensure you have the following installed on your machine:
- Python 3.6 or later
- pip (Python package installer)

2.Installation
- Install Robot Framework
- pip install robotframework

If you plan to use Selenium with Robot Framework, install the Selenium library:
- pip install robotframework-seleniumlibrary

Depending on the browser you want to use, download and install the corresponding driver:
- ChromeDriver for Chrome
- Make sure the driver is in your system's PATH.
- Dowload driver from https://googlechromelabs.github.io/chrome-for-testing/#stable (chromedriver win64 for windows11)
- Set path chrome driver ref. https://www.qahive.com/blog/2017/07/31/selenium-library-and-chrome-web-driver/


3.Project Structure
<pre>
QA_Quiz2/
│
├── Keywords/
│   ├── TodoListComponent.robot
│   ├── TodoListTestStep.robot
│
├── Resources/
│   ├── Env.robot
│
├── results
│
├── Testsuite/
│   ├── Quiz2_TodoList_Testcases.robot
│
└── README.md
└── Testcase.xlsx
</pre>
4.Running Tests
ต้องติดตั้ง Plugins เพิ่มเติม

- pip install -U robotframework-robocop

มีติดตั้ง VSCode Extension เพิ่มเติม 

![image](https://github.com/Syncroziced/QA_Quiz2/assets/130890785/b47bddd2-6a8c-47cd-b68e-1ab746b0bcf0)
