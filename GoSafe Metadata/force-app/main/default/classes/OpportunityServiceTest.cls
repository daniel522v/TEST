@isTest
private class OpportunityServiceTest {

    @testSetup 
    static void testSetup() {
        ContentVersion cvBanner = TestDataFActory.createContentVersion('baner1', 'png');
        insert cvBanner;
        
        ContentVersion truckIcon = TestDataFActory.createContentVersion('truck icon', 'png');
        insert truckIcon;
        
        Opportunity opp = TestDataFactory.createOpportunity();
        insert opp;
        
        List<Driver__c> drivers = TestDataFactory.createDrivers(opp.AccountId, 3);
        insert drivers;
        
        List<Vehicle__c> vehicles = TestDataFactory.createVehicles(opp.AccountId, 3);
        insert vehicles;
        
        List<Trailer__c> trailers = TestDataFactory.createTrailers(opp.AccountId, 3);
        insert trailers;
    }
    
    @isTest
    public static void testGetBanner() {
		
        Opportunity opp = [SELECT Id FROM Opportunity LIMIT 1];          
        
        PageReference pageRef = Page.OpportunityQuickQuote;
        Test.setCurrentPage(pageRef);
        pageRef.getParameters().put('Id', String.valueOf(opp.Id));
        ApexPages.StandardController sc = new ApexPages.StandardController(opp);
        
        Test.startTest();
        OpportunityService os = new OpportunityService(sc);
        	String bannerId = os.getBaner();
        Test.stopTest();
        
        System.assert(bannerId != null);
    }
    
    @isTest
    public static void testGetIcon() {
		
        Opportunity opp = [SELECT Id FROM Opportunity LIMIT 1];          
        
        PageReference pageRef = Page.OpportunityQuickQuote;
        Test.setCurrentPage(pageRef);
        pageRef.getParameters().put('Id', String.valueOf(opp.Id));
        ApexPages.StandardController sc = new ApexPages.StandardController(opp);
        
        Test.startTest();
        OpportunityService os = new OpportunityService(sc);
        	String iconId = os.getTruckIcon();
        Test.stopTest();
        
        System.assert(iconId != null);

    }
    
    @isTest
    public static void testGetAccountDrivers() {
        
        Opportunity opp = [SELECT Id FROM Opportunity LIMIT 1];          
        
        PageReference pageRef = Page.OpportunityQuickQuote;
        Test.setCurrentPage(pageRef);
        pageRef.getParameters().put('Id', String.valueOf(opp.Id));
        ApexPages.StandardController sc = new ApexPages.StandardController(opp);
        
        Test.startTest();
        OpportunityService os = new OpportunityService(sc);
        	List<Driver__c> drivers = os.getAccountDrivers();
        Test.stopTest();
        
        System.assert(!drivers.isEmpty());
    }
    
    @isTest
    public static void testGetAccountVehicles() {
        
        Opportunity opp = [SELECT Id FROM Opportunity LIMIT 1];          
        
        PageReference pageRef = Page.OpportunityQuickQuote;
        Test.setCurrentPage(pageRef);
        pageRef.getParameters().put('Id', String.valueOf(opp.Id));
        ApexPages.StandardController sc = new ApexPages.StandardController(opp);
        
        Test.startTest();
        OpportunityService os = new OpportunityService(sc);
        	List<Vehicle__c> vehicles = os.getAccountVehicles();
        Test.stopTest();
        
        System.assert(!vehicles.isEmpty());
    }
    
    @isTest
    public static void testGetAccountTrailers() {
        
        Opportunity opp = [SELECT Id FROM Opportunity LIMIT 1];          
        
        PageReference pageRef = Page.OpportunityQuickQuote;
        Test.setCurrentPage(pageRef);
        pageRef.getParameters().put('Id', String.valueOf(opp.Id));
        ApexPages.StandardController sc = new ApexPages.StandardController(opp);
        
        Test.startTest();
        OpportunityService os = new OpportunityService(sc);
        	List<Trailer__c> trailers = os.getAccountTrailers();
        Test.stopTest();
        
        System.assert(!trailers.isEmpty());
    }
    
    @isTest
    public static void testGetCommoditiesTotalPercentNegative() {
        
        Opportunity opp = [SELECT Id FROM Opportunity LIMIT 1];          
        
        PageReference pageRef = Page.OpportunityQuickQuote;
        Test.setCurrentPage(pageRef);
        pageRef.getParameters().put('Id', String.valueOf(opp.Id));
        ApexPages.StandardController sc = new ApexPages.StandardController(opp);
        
        Test.startTest();
        OpportunityService os = new OpportunityService(sc);
        	Decimal total = os.getCommoditiesTotalPercent();
        Test.stopTest();
        
        System.assertEquals(total, 0);
    }
    
    @isTest
    public static void testGetCommoditiesTotalPercentPositive() {
        
        Opportunity opp = [SELECT Id FROM Opportunity LIMIT 1];          
        opp.Commodities1__c = 'Beer';
        opp.CommoditiesP1__c = 10;
        opp.Commodities2__c = 'Beer';
        opp.CommoditiesP2__c = 10;
        opp.Commodities3__c = 'Beer';
        opp.CommoditiesP3__c = 10;
        opp.Commodities4__c = 'Beer';
        opp.CommoditiesP4__c = 10;
        opp.Commodities5__c = 'Beer';
        opp.CommoditiesP5__c = 10;
        opp.Commodities6__c = 'Beer';
        opp.CommoditiesP6__c = 10;
        opp.Commodities7__c = 'Beer';
        opp.CommoditiesP7__c = 10;
        opp.Commodities8__c = 'Beer';
        opp.CommoditiesP8__c = 10;
            
        update opp;
        
        PageReference pageRef = Page.OpportunityQuickQuote;
        Test.setCurrentPage(pageRef);
        pageRef.getParameters().put('Id', String.valueOf(opp.Id));
        ApexPages.StandardController sc = new ApexPages.StandardController(opp);
        
        Test.startTest();
        OpportunityService os = new OpportunityService(sc);
        	Decimal total = os.getCommoditiesTotalPercent();
        Test.stopTest();
        
        System.assertEquals(total, 80);
    }

   
}