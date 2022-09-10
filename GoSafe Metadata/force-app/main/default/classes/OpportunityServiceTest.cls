@isTest
private class OpportunityServiceTest {

    @isTest
    public static void testOpportunityServiceQuickQuote() {
		
        Opportunity opp = TestDataFactory.createOpportunity();
        insert opp;           
        
        PageReference pageRef = Page.OpportunityQuickQuote;
        Test.setCurrentPage(pageRef);
        pageRef.getParameters().put('Id', String.valueOf(opp.Id));
        ApexPages.StandardController sc = new ApexPages.StandardController(opp);
        
        Test.startTest();
        OpportunityService os = new OpportunityService(sc);
        OpportunityService.getBaner();
        OpportunityService.getTruckIcon();
        Test.stopTest();
    }

   
}