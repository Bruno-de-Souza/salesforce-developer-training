public class MaintenanceRequestHelper {
    
    public static void updateWorkOrders() {
        // TODO: Complete the method to update workorders

        List<Case> cases = [

            SELECT Id, Status, Type FROM Case WHERE Type IN ('Repair', 'Routine Maintenance') AND status = 'Closed'

        ];

        if (!cases.isEmpty()) {

            Case records = new Case(

                Type = 'Routine Maintenance',
                Subject = 'Test'

            );

            insert records;

            System.debug('New Records: ' + records);

        }

    }        
    
}