#!/bin/bash
SCRIPT_VERSION=0.5

# Source functions.sh
source /azs/common/functions.sh \
  && echo "Sourced functions.sh" \
  || { echo "Failed to source functions.sh" ; exit ; }

################################## Task: Auth #################################
azs_task_start auth

# Login to Azure Stack cloud 
# Provide argument "adminmanagement" for authenticating to admin endpoint
# Provide argument "management" for authenticating to tenant endpoint
azs_login management

azs_task_end auth
################################## Task: Read #################################
azs_task_start read

RESOURCES=$(az resource list) \
  && azs_log_field T status tenant_storage_read \
  || azs_log_field T status tenant_storage_read fail

azs_task_end read
############################### Job: Complete #################################
azs_job_end