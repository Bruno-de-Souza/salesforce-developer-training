/**
 * @author bruno.moreira
 */
public with sharing class WarehouseCalloutService implements Queueable {

    public static final String WAREHOUSE_URL = 'https://th-superbadge-apex.herokuapp.com/equipment';

    @future(callout=true)
    public static void wareHouseCallout() {

        Http http = new Http();
        
        HttpRequest request = new HttpRequest();
        request.setEndpoint(WAREHOUSE_URL);
        request.setMethod('GET');
        System.debug('Request: ' + request);

        HttpResponse response = http.send(request);
        System.debug('Response: ' + response);

        List<Product2> WarehouseEquipment = new List<Product2> ();

        if (response.getStatusCode() == 200) {

            List<Object> warehouseResponse = (List<Object>) JSON.deserializeUntyped(response.getBody());
            System.debug('Response from Warehouse: ' + response.getBody());

            for (Object objects: warehouseResponse) {

                Map<String,Object> mapJson = (Map<String,Object>) objects;

                Product2 equipment = new Product2();

                equipment.ProductCode = (String) mapJson.get('_id');
                equipment.Replacement_Part__c = (Boolean) mapJson.get('replacement');
                equipment.Current_Inventory__c = (Double) mapJson.get('quantity');
                equipment.Name = (String) mapJson.get('name');
                equipment.Maintenance_Cycle__c = (Integer) mapJson.get('maintenanceperiod');
                equipment.Lifespan_Months__c = (Integer) mapJson.get('lifespan');
                equipment.Cost__c = (Integer) mapJson.get('cost');
                equipment.Warehouse_SKU__c = (String) mapJson.get('sku');

                WarehouseEquipment.add(equipment);

            }

            if (WarehouseEquipment.size() > 0) {

                upsert WarehouseEquipment;

                System.debug('Equipments Updated with Warehouse System');

            }

        }

    }
    
    public void execute (QueueableContext Context) {    

        wareHouseCallout();

    }

}