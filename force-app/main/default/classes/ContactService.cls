@RestResource(urlMapping='/Contact/*')
global with sharing class ContactService {

    @HttpGet
    global static Contact getContactById() {
        RestRequest request = RestContext.request;
        // Get the contactId from the end of the URL
        String contactId = request.requestURI.substring(
                request.requestURI.lastIndexOf('/') + 1);
        //Id contactId = RestContext.request.params.get('Id');

        Contact result = [
                SELECT Salutation, FirstName, LastName, Email, Phone
                FROM Contact
                WHERE Id = :contactId
        ];
        return result;
    }
    
    @HttpPost
    global static String createNewContact() {
        RestRequest request = RestContext.request;
        Map<String, Object> requestResult = (Map<String, Object>) JSON.deserializeUntyped(request.requestBody.toString());
        List<Object> contacts = (List<Object>) requestResult.get('records');
        List<Contact> contactsToInsert = new List<Contact>();
        for (Object contactObject : contacts) {
            Map<String, Object> parsedContact = (Map<String, Object>) contactObject;
            Contact thisContact = new Contact(
                    Active__c = true,
                    FirstName = (String) parsedContact.get('FirstName'),
                    LastName = (String) parsedContact.get('LastName'),
                    Email = (String) parsedContact.get('Email'),
                    Email_Unique__c = (String) parsedContact.get('Email')
            );
            contactsToInsert.add(thisContact);
            
        }

        Database.upsert(contactsToInsert, Contact.Email_Unique__c, true);
        
        Map<String, String> stringMap = new Map<String, String>();
        for (Contact contact : contactsToInsert) {
            if (contact.Id != null) {
            stringMap.put(contact.Id, contact.Email_Unique__c);
            }
        }
        return JSON.serializePretty(stringMap);
    }
    
    @HttpPatch
    global static Id updateContact(String Salutation, String FirstName, String LastName, String Phone, String Email) {

        // Add the Contact Id as a parameter in the URL
        RestRequest request = RestContext.request;
        String contactId = request.requestURI.substring(request.requestURI.lastIndexOf('/') + 1);

        // Check if contact exist 
        List<Contact> matchingContacts = [SELECT Id FROM Contact WHERE Id = :contactId];
        if (matchingContacts.isEmpty()) {
            // Case : ID does not exist
            // return an error
            return 'Contact with ID ' + contactId + ' does not exist';
        }

        Contact thisContact = matchingContacts[0];
        //convert JSON data from request 
        Map<String, Object> params = (Map<String, Object>) JSON.deserializeUntyped(request.requestBody.toString());
        //update fields on object    
        for (String fieldName : params.keySet()) {
            thisContact.put(fieldName, params.get(fieldName));
        }

        update thisContact;
        return thisContact.Id;
    }


    //supprimer un Contact consiste à décocher le champ Active__c donc Patch ????
    @HttpDelete
    global static Id deactivateContact() {
        // Add the Contact Id as a parameter in the URL
        RestRequest request = RestContext.request;
        String id = request.requestURI.substring(request.requestURI.lastIndexOf('/') + 1);

        // Retrieve value of Active__c field based on the Id
        Contact thisContact = new Contact();
        thisContact.Id = id;
        thisContact.Active__c = false;
        update thisContact;
        return thisContact.Id;
    }


    
}