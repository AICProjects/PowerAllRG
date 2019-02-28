#Connect to Azure if needed
#az connect

#Define Resource group
$RG_name="<Your RG Name HERE>"

#Define the action Accepted actions are start and stop
$vm_action="stop"

#Show me the vms in the resource group
Write-Host "These are the affected vms.They are in Resource Group " $RG_name -ForegroundColor DarkCyan
az vm list -g $RG_name --query "[].id" -o tsv

#Display the action that will take place
Write-Host "A" $vm_action "action is being performed on the vms" -ForegroundColor DarkBlue

#power on/off the list of vms in the resource group
az vm $vm_action --ids $(az vm list -g $RG_name --query "[].id" -o tsv)
