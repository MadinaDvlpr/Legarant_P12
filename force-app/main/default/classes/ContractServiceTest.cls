@isTest

public class ContractServiceTest {
 @testSetup
   static void setupForTest(){
        
    }
    
    @isTest static void testGetContractById() {
        Id contractForThisTest = TestDataFactory.createAccountAndContractRecord();
        Id recordId = contractForThisTest;
         Test.startTest();
        // Set up a test request
        RestRequest request = new RestRequest();
        request.requestUri ='https://legarant-b-dev-ed.develop.lightning.force.com/services/apexrest/Contact/'+ recordId;
        request.httpMethod = 'GET';
        RestContext.request = request;
        
        // Call the method to test
        Contract thisContract = ContractService.getContractById();
        Test.stopTest();

        // Verify results
        System.assert(thisContract != null);
    }
    
     @isTest
    static void testCreateContract() {
     
        RestRequest request = new RestRequest();
        request.requestUri ='https://legarant-b-dev-ed.develop.lightning.force.com//services/apexrest/Contact/';
        request.httpMethod = 'POST';
        RestContext.request = request;        
        request.requestBody = Blob.valueOf('{"records" : [{"attributes" : {"type" : "Contract"},"Name": "ContractName-1","AccountId": "0010600002Cw3Z3AAJ","Status": "Draft","StartDate": "2024-02-01","ContractTerm": "6"}]}');
        System.debug('r body : ' + request.requestBody);
         Test.startTest();
        
        Id thisContractId = ContractService.createNewContract();
        Contract thisContract = [SELECT Id, Name, StartDate, ContractTerm, Status FROM Contract WHERE Id =:thisContractId];
        Test.stopTest();
        
        // Check contract is created
        System.assertEquals(thisContract.ContractTerm, 6);
        System.assertEquals(thisContract.Status, 'Draft');
        System.assertEquals(thisContract.Name, 'ContractName-1');
        System.assert(thisContract.Id != null);
    }
    
    
    @isTest 
    static void testUpdateContract(){
        // create account
        Account account = new Account();
        account.Name ='AccountTest';
        insert account;
        ID accountId = account.Id;
        
       // Création d'un contrat de test dans Salesforce
        Contract testContract = new Contract();
        testContract.AccountId = account.Id;
        testContract.ContractTerm = 12;
        testContract.StartDate = Date.today();
        insert testContract;

        // Création des données JSON pour la mise à jour du contrat
        Map<String, Object> dataToUpdate = new Map<String, Object>{
            'contractTerm' => 24
            //'startDate' => Date.today().addDays(10)
        };

        // Set up a request test
        
        RestRequest request = new RestRequest();
        request.requestURI = '/contract/' + testContract.Id;
        request.httpMethod = 'PATCH';
        request.requestBody = Blob.valueOf(JSON.serialize(dataToUpdate));
        RestContext.request = request;
        
        // Appel de la méthode updateContract du service web

        Test.startTest();
        ContractService.updateContract();  
        // Update all fields of existing record (only phone has changed)
        Id thisContractId = ContractService.updateContract();   
        // Retrieve Id & Name of the updated Contract
        Contract thisContract = [SELECT Id, Name, contractTerm FROM Contract WHERE Id=:thisContractId];     
        Test.stopTest();
      
        // Vérification de la mise à jour des champs du contrat
        System.assertEquals(24, thisContract.ContractTerm);
    
    }
    
    @isTest 
    static void testUpdateContractStatus(){
           
       // create account
        Account account = new Account();
        account.Name ='AccountTest';
        insert account;
        ID accountId = account.Id;
        
       // Création d'un contrat de test dans Salesforce
        Contract testContract = new Contract();
        testContract.AccountId = account.Id;
        testContract.Name = 'CONTRACT TEST';
        testContract.ContractTerm = 12;
        testContract.StartDate = Date.today();
        insert testContract;
        
        
        // Création des données JSON pour la mise à jour du contrat
        Map<String, Object> dataToUpdate = new Map<String, Object>{
            'Status' => 'Activated'
            //'startDate' => Date.today().addDays(10)
        };

        // Set up a request test
        
        RestRequest request = new RestRequest();
        request.requestURI = '/contract/' + testContract.Id;
        request.httpMethod = 'PATCH';
        request.requestBody = Blob.valueOf(JSON.serialize(dataToUpdate));
        RestContext.request = request;
        
        // Appel de la méthode updateContract du service web

        Test.startTest();
        ContractService.updateContract();  
        // Update all fields of existing record (only phone has changed)
        Id thisContractId = ContractService.updateContract();   
        // Retrieve Id & Name of the updated Contract
        Contract thisContract = [SELECT Id, Name, Status FROM Contract WHERE Id=:thisContractId];     
        Test.stopTest();
      
        // Vérification de la mise à jour des champs du contrat
        System.assertEquals('Activated', thisContract.Status);
        System.assertEquals('CONTRACT TEST', thisContract.Name);
    
    }
    
    
}