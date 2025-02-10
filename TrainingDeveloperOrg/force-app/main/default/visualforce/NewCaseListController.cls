/**
 * @author bruno.moreira
 */
public class NewCaseListController {
    
    public List<Case> getNewCases() {

        List<Case> newCases = [

        SELECT Id, CaseNumber, Status
        FROM Case
        WHERE Status = 'New'

        ];

        return newCases;

    }

}