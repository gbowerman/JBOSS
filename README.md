# JBOSS EAP templates
Work in progress to create functional JBOSS EAP templates

<a href="https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fgbowerman%2FJBOSS%2Fmaster%2Fazuredeploy.json" target="_blank">
    <img src="https://raw.githubusercontent.com/Azure/azure-quickstart-templates/master/1-CONTRIBUTION-GUIDE/images/deploytoazure.png"/>
</a>

# Troubleshooting deployment
- Look at /var/log/cloud-init-output.log

## To do
- DONE: Create a storage account and container in the template (investigate using the VMSS storage account)
- DONE: Register and attach subscription manager pool & repo
- DONE: Install product
- DONE: Enable service
- DONE: start service
- DONE: Add JBOSS mgmt user
- Automate storage account naming based on VMSS name (cluster name)
- Write the Azure Ping config file in the cloud-init script
- Identify additional JBOSS/JGROUP configuration
- DONE: Update Load Balancer rules for default JBOSS default management port 9090
- DONE: Update Load Balancer rules for default JBOSS default server port 8080
- DONE: Switch VMs to use SSH key for auth
- Update Readme with user guide and reference links
