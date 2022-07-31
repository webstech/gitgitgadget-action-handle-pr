@echo off

rem Command file to run a basic test of the action.  The specific command
rem is one of the various test command flavours in package.json.  User
rem setup is needed to create a specific test case.
rem
rem Generally the user specified options on the test command are:
rem
rem 1. action to perform: push or comment
rem 2. URL for the pull request or a specific comment, depnding on the
rem    action to perform
rem 3. location of config file describing this project
rem
rem The local copy of the test repo is expected to have a .secret file
rem which contains the PAT to access the GitHub repo.
rem
rem set up by the developer for the test situation needed.

set action=%1
set config=%3

rem extract args from url
for /f "tokens=3,4,6 delims=/#" %%i IN ("%~2") do (set owner=%%~i&& set repo=%%~j&& set pr=%%k)
for /f "tokens=2 delims=-" %%i IN ("%~n2") do (set commentid=%%~i)

for /f "tokens=2 delims==" %%i in (..\%repo%\.secret) do set INPUT_TOKEN=%%i

set INPUT_ACTION=%action%
set INPUT_REPOSITORY-DIR=../%repo%
set INPUT_CONFIG=%config%
set INPUT_REPO-OWNER=%owner%
set INPUT_REPO-BASEOWNER=%owner%
set INPUT_REPO-NAME=%repo%
set INPUT_PULL-REQUEST-NUMBER=%pr%
if .%commentid% neq . set INPUT_COMMENT-ID=%commentid%

set GITGITGADGET_PUBLISHREMOTE=../%repo%
set GITGITGADGET_SMTPUSER=test
set GITGITGADGET_SMTPHOST=test
set GITGITGADGET_SMTPPASS=test
set GITGITGADGET_SMTPOPTS=

ncc run ./dist/index.js

goto :eof

rem older version not using url parsing

@echo off

rem Command file to run a basic test of the action.  The specific command
rem is one of the various test command flavours in package.json.  User
rem setup is needed to create a specific test case.
rem
rem Generally the user specified options on the test command are:
rem
rem 1. function to perform (push or comment)
rem 2. repo owner
rem 3. repo name (located at the same directory tree level)
rem 4. location of config file describing this project
rem 5. pull request number
rem 6. comment id from pull request if function is comment

set func=%1
set owner=%2
set repo=%3
set config=%4
set pull=%5
set comment=%6

for /f "tokens=2 delims==" %%i in (..\%repo%\.secret) do set INPUT_TOKEN=%%i

set INPUT_ACTION=%func%
set INPUT_REPOSITORY-DIR=../%repo%
set INPUT_CONFIG=%config%
set INPUT_REPO-OWNER=%owner%
set INPUT_REPO-BASEOWNER=%owner%
set INPUT_REPO-NAME=%repo%
set INPUT_PULL-REQUEST-NUMBER=%pull%
set INPUT_COMMENT-ID=%comment%

set GITGITGADGET_PUBLISHREMOTE=../%repo%
set GITGITGADGET_SMTPUSER=test
set GITGITGADGET_SMTPHOST=test
set GITGITGADGET_SMTPPASS=test
set GITGITGADGET_SMTPOPTS=

ncc run ./dist/index.js
