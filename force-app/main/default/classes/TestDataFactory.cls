public with sharing class TestDataFactory {
    public static Id createTestContact() {
        // Create test contact
        Contact contactTest = new Contact(Salutation='Mr.', FirstName='Magda', LastName='Test', Email='mytest@testsfdx.com');
        insert contactTest;
        return contactTest.Id;
    }
    
    public static List<Contact> createContacts(Integer numberOfContacts) {
        List<Contact> contacts = new List<Contact>();
        
        for (Integer i = 0 ; i < numberOfContacts; i++) {
            contacts.add(new Contact(Salutation='Ms.',
                                     FirstName = 'contactName-9'+i, 
                                     LastName ='LastName-9'+i, 
                                     Email = 'email9'+i+'@legarant.fr'));
        }
        insert contacts;
        return contacts;
    }
    
    public static id createNewAccount() {
        Account account = new Account(
            Name = 'Account1'
        );
        insert account;
        return account.Id;
    }
    
    public static Id createAccountAndContractRecord() {
        // Create test record for Account
        Account accountTest = new Account();
        accountTest.Name ='TestAccount';
        insert accountTest;
        
        // Create test record for Contract
        Contract contractTest = new Contract(
            Name = 'TestContract',
            Status = 'Draft',
            AccountId = accountTest.Id,
            StartDate = Date.today().addDays(1),
            ContractTerm = 12
        );
        insert contractTest;
        return contractTest.Id;
    }  
}