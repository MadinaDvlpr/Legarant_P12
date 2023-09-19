@RestResource(urlMapping='/Contract/*')
global with sharing class ContractService {
    
    
    @HttpGet
    global static Contract getContractById() {
        RestRequest request = RestContext.request;
        // Get the contactId from the end of the URL
        String contractId = request.requestURI.substring(
                request.requestURI.lastIndexOf('/') + 1);
        //Id contactId = RestContext.request.params.get('Id');

        Contract result = [
                SELECT Id, Name, StartDate, contractTerm
                FROM Contract
                WHERE Id = :contractId
        ];
        return result;
    }
    
    
        @HttpPost
    global static String createNewContract() {
        RestRequest request = RestContext.request;
        Map<String, Object> requestResult = (Map<String, Object>) JSON.deserializeUntyped(request.requestBody.toString());
        List<Object> contracts = (List<Object>) requestResult.get('records');
        List<Contract> contractsToInsert = new List<Contract>();
        
        for (Object contractObject : contracts) {
            Map<String, Object> parsedContract = (Map<String, Object>) contractObject;
            Contract thisContract = new Contract(
                   Name = (String) parsedContract.get('Name'),
                    Status =  (String) parsedContract.get('Status'),
                    AccountId =  Id.valueOf((String) parsedContract.get('AccountId')),
                    StartDate = Date.valueOf((String) parsedContract.get('StartDate')),
                    ContractTerm = Integer.valueOf((String) parsedContract.get('ContractTerm'))
            );
            contractsToInsert.add(thisContract);
        }
        Database.upsert(contractsToInsert, Contract.Id, true);
		
        Map<String, Object> stringMap = new Map<String, Object>();
        for (Contract contract : contractsToInsert) {
            if (contract.Id != null) {
                stringMap.put(contract.Id, contract.Name);
            }
        }
        return JSON.serializePretty(stringMap);
    }
    
    
    
    @HttpPatch
    global static Id updateContract(){
        // extract the Contract Id as a parameter in the URL
        RestRequest request = RestContext.request;
        String contractId = request.requestURI.substring(request.requestURI.lastIndexOf('/')+1);
    
        // Check if contact exist 
        List<Contract> matchingContracts = [SELECT Id, AccountId FROM Contract WHERE Id = :contractId];
        if (matchingContracts.isEmpty()) {
            // Case : ID does not exist
            // return an error
            return 'Contract with ID ' + contractId + ' does not exist';
        }
        
        Contract thisContract = matchingContracts[0];
        //convert JSON data from request 
        Map<String, Object> requestResult = (Map<String, Object>) JSON.deserializeUntyped(request.requestBody.toString());
        
        //update fields on object    
        for (String fieldName : requestResult.keySet()) { 
            thisContract.put(fieldName, requestResult.get(fieldName));
        }
    
        update thisContract;
        return thisContract.Id;
    }
        
    }