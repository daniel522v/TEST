public class OpportunityService {

    private final Id oppId;
    Opportunity opp = new Opportunity();
    
    public OpportunityService(ApexPages.StandardController stdController) {
        this.oppId = (Id)stdController.getRecord().Id;
        this.opp = [SELECT AccountId, CommoditiesP1__c, CommoditiesP2__c, CommoditiesP3__c, CommoditiesP4__c,
                    CommoditiesP5__c, CommoditiesP6__c, CommoditiesP7__c, CommoditiesP8__c
                    FROM Opportunity WHERE Id = :oppId];
    }

    public String getBaner() {
        List<ContentDocument> logo = [SELECT LatestPublishedVersionId FROM ContentDocument WHERE Title = 'baner1'];
        String logoId = null;
        if (logo.size() > 0) {
            logoId = logo[0].LatestPublishedVersionId;
        }
        return logoId;
    }

    public String getTruckIcon() {
        List<ContentDocument> logo = [SELECT LatestPublishedVersionId FROM ContentDocument WHERE Title = 'truck icon'];
        String logoId = null;
        if (logo.size() > 0) {
            logoId = logo[0].LatestPublishedVersionId;
        }
        return logoId;
    }
    
    public List<Driver__c> getAccountDrivers() {
        List<Driver__c> drivers = [SELECT Name, DOB__c, CDL__c, CDL_Class__c, State_License__c, Driver_Experience__c 
                                   FROM Driver__c 
                                   WHERE Account__c = :opp.AccountId];
        return drivers;
    }
    
    public List<Vehicle__c> getAccountVehicles() {
        List<Vehicle__c> vehicles = [SELECT Name, Year__c, Make__c, Status__c, Value__c
                                     FROM Vehicle__c 
                                     WHERE Account__c = :opp.AccountId];
        return vehicles;
    }
    
    public List<Trailer__c> getAccountTrailers() {
        List<Trailer__c> trailers = [SELECT Name, Year__c, Type__c, Make__c, Status__c, Value__c
                                     FROM Trailer__c 
                                     WHERE Account__c = :opp.AccountId];
        return trailers;
    }
    
    public Decimal getCommoditiesTotalPercent() {
        Decimal total = 0; 
        if (opp.CommoditiesP1__c != null) {
            total += opp.CommoditiesP1__c;
        }
        if (opp.CommoditiesP2__c != null) {
            total += opp.CommoditiesP2__c;
        }
        if (opp.CommoditiesP3__c != null) {
            total += opp.CommoditiesP3__c;
        }
        if (opp.CommoditiesP4__c != null) {
            total += opp.CommoditiesP4__c;
        }
        if (opp.CommoditiesP5__c != null) {
            total += opp.CommoditiesP5__c;
        }
        if (opp.CommoditiesP6__c != null) {
            total += opp.CommoditiesP6__c;
        }
        if (opp.CommoditiesP7__c != null) {
            total += opp.CommoditiesP7__c;
        }
        if (opp.CommoditiesP8__c != null) {
            total += opp.CommoditiesP8__c;
        }

        return total;
    }
    
}