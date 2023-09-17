@isTest
public class ContactServiceTest {
    private static String contactFirstName = 'Magda';
    private static String contactLastName = 'Test';
    
     @testSetup
    static void setupForTest(){
        
    }
    
    @isTest static void testGetContactById() {
        List<Contact> contactListForThisTest = TestDataFactory.createContacts(2);
        Id recordId = contactListForThisTest.get(0).Id;
         Test.startTest();
        // Set up a test request
        RestRequest request = new RestRequest();
        request.requestUri ='https://legarant4-dev-ed.develop.lightning.force.com/services/apexrest/Contact/'+ recordId;
        request.httpMethod = 'GET';
        RestContext.request = request;
        
        // Call the method to test
        Contact thisContact = ContactService.getContactById();
        Test.stopTest();

        // Verify results
        System.assert(thisContact != null);
    }
    
    @isTest 
    static void testCreateNewContacts() {
        List<Contact> contactsForThisTest = TestDataFactory.createContacts(3);
        // Call the method to test and add parameters
        
		RestRequest request = new RestRequest();
        request.requestUri ='https://legarant4-dev-ed.develop.lightning.force.com/services/apexrest/Contact/';
        request.httpMethod = 'POST';
        RestContext.request = request;        
        request.requestBody = Blob.valueOf('{"records" : [{"attributes" : {"type" : "Contact"},"FirstName": "TEST","LastName": "TESTAPEX","Email": "APEXTEST@gmail.com"}]}');
        //request.requestBody = JSONFile.creatJSONFile(contactsForThisTest);
        
        Test.startTest();
        String thisContactId = ContactService.createNewContact();
        //NB Je recupere une map json serialisezd pretty une foiis le contact crée 
        //
        //ICIIIIIIIIIII Map Id / Email Unique
        System.debug('This Contact Id : ' + thisContactId);
        
        // Retrieve Id & Email of the created Contact 
        //Contact thisContact = [SELECT Id, Salutation, Firstname, LastName, Salesforce_Id__c, Email FROM Contact WHERE Id = :thisContactId];
        Test.stopTest();

        // Check that we get a results and this contactId map is not empty
        System.assert(thisContactId != null);
        //System.assertEquals('TEST', thisContact.FirstName);

    }
    
    
    
    @isTest 
    static void testUpdateContact() { 
        
        // Set up a test request
        Id recordId = TestDataFactory.createTestContact();
        RestRequest request = new RestRequest();
        request.requestURI = 'https://legarant4-dev-ed.develop.lightning.force.com/services/apexrest/Contact/' + recordId;
        request.httpMethod = 'PATCH';
        request.addHeader('Content-Type', 'application/json');
        request.requestBody = Blob.valueOf('{"Phone":"+330987654321"}');
        RestContext.request = request;
        
        Test.startTest();
        // Update all fields of existing record (only phone has changed)
        Id thisContactId = ContactService.updateContact('Mr','Magda', 'Test','+330987654321', 'mytest@testsfdx.com');
        
        // Retrieve Id & Phone of the updated Contact
        Contact thisContact = [SELECT Id, Phone FROM Contact WHERE Id=:thisContactId];
        Test.stopTest();
        // Check Phone is equal to the updated Contact
        System.assertEquals(thisContact.Phone, '+330987654321');    
    }
    
    @isTest static void testDeactivateContact() {
         
        // Set up a test request
        Id recordId = TestDataFactory.createTestContact();
        RestRequest request = new RestRequest();
        request.requestURI =  'https://legarant4-dev-ed.develop.lightning.force.com/services/apexrest/Contact/' + recordId;
        request.httpMethod = 'DELETE';
        request.addHeader('Content-Type', 'application/json');
        request.requestBody = Blob.valueOf('{"Active__c" : "false"}');
        RestContext.request = request;
        
        Test.startTest();
        // Call the method to test
        Id thisContactId = ContactService.deactivateContact();
        
        // Retrieve Id & Deactivated__c fields of the updated Contact 
        Contact thisContact = [SELECT Id, Active__c FROM Contact WHERE Id =:thisContactId];
        Test.stopTest();
        // Verify Deactivated__c value is updated to true
        System.assertEquals(thisContact.Active__c, false);
    }  
}