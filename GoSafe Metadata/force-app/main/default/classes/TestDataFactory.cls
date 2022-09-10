public class TestDataFactory {

    public static Contact createContact() {
        Contact con = new Contact(
        	LastName = 'Test'
        );
        return con;
    }
    
    public static Opportunity createOpportunity() {
        
        Contact con = createContact();
        insert con;
        
        Account acc = createAccount();
        insert acc;
        
        Opportunity opp = new Opportunity(
        	Name = 'test', 
        	StageName = 'Open', 
            CloseDate = Date.today(), 
            States_Travelled_To__c = 'TX',
            Effective_Date__c = Date.today(), 
            Policy_Expiration_Date__c = Date.today(), 
            Power_Units__c = 1, 
            Producer_Owner__c = con.Id,
            Radius_of_Operation__c = '1', 
            Years_in_Business__c = 1,
            AccountId = acc.Id
        );
        
        return opp;
    }
    
    /*public static Opportunity createOpportunityFromAccount(Id accountId) {
        
        Contact con = createContact();
        insert con;
        
        Opportunity opp = new Opportunity(
        	Name = 'test', 
        	StageName = 'Open', 
            CloseDate = Date.today(), 
            States_Travelled_To__c = 'TX',
            Effective_Date__c = Date.today(), 
            Policy_Expiration_Date__c = Date.today(), 
            Power_Units__c = 1, 
            Producer_Owner__c = con.Id,
            Radius_of_Operation__c = '1', 
            Years_in_Business__c = 1,
            AccountId = accountId
        );
        
        return opp;
    }*/
    
    /*public static Commodity__c createCommodity() {
        Commodity__c comm = new Commodity__c();
        return comm;
    }*/
    
    public static Account createAccount() {
        Account objAccount = new Account(Name = 'Test Acc1', BillingCity = 'Test City', BillingState = 'Test State', 
                                         BillingStreet = 'Test Street', BillingPostalCode = '12345', 
                                         BillingCountry = 'Test Country', Phone = '123456',Company_Rep__c = 'Test');
        
        return objAccount;
    }
    
    /*public static Lead createLead() {
        
        Contact con = createContact();
        insert con;
        
        Lead testLead = new Lead(
            FirstName='Demo 100800',
            LastName = 'Demo 100800 UnitTest',
            Status='Qualified',
            company='Lacosta',
            street='1211 E I-40 Service Rd',
            city=' Oklahoma City',
            state='OK',
        	Email='test@test.com',
        	Company_Rep__c = 'Test',
            Original_Policy_Effective_Date__c = Date.today(), 
            Policy_Expiration_Date__c =Date.today(),
            //Radius_of_Operation__c = '1', 
            Power_Units__c = 1,
            Years_in_Business__c = 3
            //Producer_Owner__c = con.Id
            
        );
        return testLead;
    }
    
    public static Case createLossRunsCase() {
        
        Case cs = new Case();
        Id lossRuns = Schema.SObjectType.Case.getRecordTypeInfosByName().get('Loss Runs').getRecordTypeId();
		//cs.RecordTypeId = lossRuns;
        return cs;
    }
    
    public static Case createEndorsementCase() {
        
        Case cs = new Case();
        Id endorsement = Schema.SObjectType.Case.getRecordTypeInfosByName().get('Endorsement').getRecordTypeId();
		//cs.RecordTypeId = endorsement;
        cs.Subject = 'Subj';
        return cs;
    }
    
    public static Case createFormalQuoteCase() {
        
        Case cs = new Case();
        Id formalQuote = Schema.SObjectType.Case.getRecordTypeInfosByName().get('Formal Quote').getRecordTypeId();
		//cs.RecordTypeId = formalQuote;
        return cs;
    }
    
    public static Trailer__c createTrailer(Id accId) {
        
        Trailer__c t = new Trailer__c(Account__c = accId);
        return t;
    }
    
    public static Vehicle__c createVehicle(Id accId) {
        
        Vehicle__c v = new Vehicle__c(Account__c = accId);
        return v;
    }
    
    public static Task createTask() {
        
        Opportunity opp = createOpportunity();
        insert opp;
        
        Contact cn = createContact();
        insert cn;
        
        Task tsk = new Task();
        tsk.Subject = 'Follow up with Lead';
        tsk.WhatId = opp.Id;
        tsk.OwnerId = UserInfo.getUserId();
        tsk.Status = 'New';
        tsk.Type = 'Call';
		//tsk.Contacted_by__c = cn.Id;
            
        return tsk;
    }*/
    
}