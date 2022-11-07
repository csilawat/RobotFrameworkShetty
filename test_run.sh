#!/bin/bash

RESULTS=Results/$(date +"%m_%d_%Y")_Result

# Section 1: Activate Python Virtual environment
echo ==========================
echo "Activating Python Virtual environment"
echo ============================
#Section 2: run robot test scripts
echo ==========================
echo "run robot test scripts"
#echo "Executing Automation scripts in : " $ENV
echo ============================
echo  ============================
robot --listener 'allure_robotframework;./RESULTS/allure' TestCases/*.robot

#Section 3: Generate Allure report
echo ==========================
echo "Generating allure report"
echo ============================
allure generate ./Results/allure  --clean
#allure serve ./Results/allure   --clean
