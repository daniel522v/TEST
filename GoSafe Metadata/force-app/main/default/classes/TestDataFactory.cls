public class TestDataFactory {

    public static ContentVersion createContentVersion(String fileName, String extension) {
        ContentVersion cv = new ContentVersion(
            Title = fileName,
            PathOnClient = fileName+'.'+extension,
            VersionData = Blob.valueOf('Test Content'),
            IsMajorVersion = true
        );
        return cv;
    }
    
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
    
    public static Account createAccount() {
        Account objAccount = new Account(Name = 'Test Acc1', BillingCity = 'Test City', BillingState = 'Test State', 
                                         BillingStreet = 'Test Street', BillingPostalCode = '12345', 
                                         BillingCountry = 'Test Country', Phone = '123456',Company_Rep__c = 'Test');
        
        return objAccount;
    }
    
    public static List<Driver__c> createDrivers(Id accountId, Decimal amount) {
        List<Driver__c> drivers = new List<Driver__c>();
        
        for (Decimal i=1; i < amount; i++) {
            Driver__c driver = new Driver__c(
                Account__c = accountId,
                Name = 'Test'+i,
                Status__c = 'Active'
            );
            drivers.add(driver);
        }
        return drivers;
        
    }
    
    public static List<Vehicle__c> createVehicles(Id accountId, Decimal amount) {
        List<Vehicle__c> vehicles = new List<Vehicle__c>();
        
        for (Decimal i=1; i < amount; i++) {
            Vehicle__c vehicle = new Vehicle__c(
                Account__c = accountId,
                Name = 'Test'+i,
                Status__c = 'Active'
            );
            vehicles.add(vehicle);
        }
        return vehicles;
        
    }
    
    public static List<Trailer__c> createTrailers(Id accountId, Decimal amount) {
        List<Trailer__c> trailers = new List<Trailer__c>();
        
        for (Decimal i=1; i < amount; i++) {
            Trailer__c trailer = new Trailer__c(
                Account__c = accountId,
                Name = 'Test'+i,
                Status__c = 'Active'
            );
            trailers.add(trailer);
        }
        return trailers;
        
    }
    
}