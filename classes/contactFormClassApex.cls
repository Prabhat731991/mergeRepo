public with sharing class contactFormClassApex {
    
    @AuraEnabled
    public static string saveContactDetails(String jsonObject){

        map<String,Object> contactObjMap = (Map<String,Object>)JSON.deserializeUntyped(jsonObject);

        Contact con = new Contact();
        con.FirstName = (String)contactObjMap.get('firstName');
        con.LastName = (String)contactObjMap.get('lastName');
        con.MobilePhone = (String)contactObjMap.get('mobile');
        con.Email = (String)contactObjMap.get('email');
        con.MailingStreet = (String)contactObjMap.get('address');

        insert con; 

        return 'success';
    }
}
