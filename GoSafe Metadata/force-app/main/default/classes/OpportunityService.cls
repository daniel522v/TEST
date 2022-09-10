public class OpportunityService {

    private final Id oppId;
    Opportunity opp = new Opportunity();
    
    public OpportunityService(ApexPages.StandardController stdController) {
        this.oppId = (Id)stdController.getRecord().Id;
        //this.opp = [SELECT AccountId FROM Opportunity WHERE Id = :oppId];
    }

    public static String getBaner() {
        List<ContentDocument> logo = [SELECT LatestPublishedVersionId FROM ContentDocument WHERE Title = 'baner1'];
        String logoId = null;
        if (logo.size() > 0) {
            logoId = logo[0].LatestPublishedVersionId;
        }
        return logoId;
    }

    public static String getTruckIcon() {
        List<ContentDocument> logo = [SELECT LatestPublishedVersionId FROM ContentDocument WHERE Title = 'truck icon'];
        String logoId = null;
        if (logo.size() > 0) {
            logoId = logo[0].LatestPublishedVersionId;
        }
        return logoId;
    }

    
}
