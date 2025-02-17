/**
 * @author bruno.moreira
 */
global class WarehouseSyncSchedule implements Schedulable{
    
    global void execute (SchedulableContext SC) {

        WarehouseCalloutService warehouseSync = new WarehouseCalloutService();

        System.enqueueJob(warehouseSync);

    }

}