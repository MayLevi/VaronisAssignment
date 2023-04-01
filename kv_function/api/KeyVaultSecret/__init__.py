import logging
import azure.functions as func
from azure.keyvault.secrets import SecretClient
from azure.identity import DefaultAzureCredential

def main(req: func.HttpRequest) -> func.HttpResponse:
    logging.info('Python HTTP trigger function processed a request.')
    
    secret_name = req.params.get('name')
    
    if not secret_name:
        return func.HttpResponse(
            "Please provide a secret name in the 'name' query parameter.",
            status_code=400
        )
    
    credential = DefaultAzureCredential()
    vault_names = ["VaronisAssignmentKv11", "VaronisAssignmentKv22", "VaronisAssignmentKv33"] # list of key vault names
    results = [] # create an empty list to hold the results
    
    for vault_name in vault_names:
        vault_url = f"https://{vault_name}.vault.azure.net/"
        secret_client = SecretClient(vault_url=vault_url, credential=credential)
        
        try:
            secret = secret_client.get_secret(secret_name)
            
            result = {
                "KeyVaultName": vault_name,
                "SecretName": secret.name,
                "CreatedOn": secret.properties.created_on,
                "Value": secret.value
            }

            results.append(result) # add the result to the list
        
        except Exception as ex:
            logging.error(ex)
    
    if len(results) > 0:
        return func.HttpResponse(str(results))
    else:
        return func.HttpResponse(
            f"Secret '{secret_name}' not found in any of the specified key vaults.",
            status_code=404
        )