/**
 * @author bruno.moreira
 */
@isTest
public with sharing class MaintenanceRequestHelperTest {

    private static final String STATUS_NEW = 'New';
    private static final String WORKING = 'Working';
    private static final String CLOSED = 'Closed';
    private static final String REPAIR = 'Repair';
    private static final String REQUEST_ORIGIN = 'Web';
    private static final String REQUEST_TYPE = 'Routine Maintenance';
    private static final String SUBJECT = 'Test Maitenance';
    
    
    private static Vehicle__c shouldCreateVehicle () {

        Vehicle__c vehicles = new Vehicle__c(
            Name = 'Test Vehicle'
        );

        return vehicles;

    }

    
    private static Product2 shouldCreateEquipment () {
    
        Product2 equipments = new Product2(

            Name = 'Test Equipment',
            Lifespan_Months__c = 10,
            Maintenance_Cycle__c = 10,
            Replacement_Part__c = true

        );

        return equipments;

    }

    
    private static Case shouldCreateCase (id vehicleId, id equipmentId) {

        Case cases = new Case(

            Type = REQUEST_TYPE,
            Status = STATUS_NEW,
            Origin = REQUEST_ORIGIN,
            Subject = SUBJECT,
            Equipment__c = equipmentId,
            Vehicle__c = vehicleId

        );

        return cases;
    
    }

    public static Equipment_Maintenance_Item__c shouldCreateEquipmentMaintenanceItem (id equipmentId, id requestId) {

        Equipment_Maintenance_Item__c requestMaintenance = new Equipment_Maintenance_Item__c(

            Equipment__c = equipmentId,
            Maintenance_Request__c = requestId

        );

        return requestMaintenance;

    }
    
    @isTest
    public static void shouldCreateMaintenanceTestPositive () {

        Vehicle__c vehicle = shouldCreateVehicle();
        insert vehicle;
        id vehicleId = vehicle.Id;

        Product2 equipment = shouldCreateEquipment();
        insert equipment;
        id equipmentId = equipment.Id;

        Case casesToUpdate = shouldCreateCase(vehicleId, equipmentId);
        insert casesToUpdate;

        Equipment_Maintenance_Item__c equipmentMaintenance = shouldCreateEquipmentMaintenanceItem(equipmentId, casesToUpdate.id);
        insert equipmentMaintenance;

        Test.startTest();
        casesToUpdate.Status = CLOSED;
        update casesToUpdate;
        Test.stopTest();

        Case caseUpdated = [

            Select id, subject, type, Equipment__c, Date_Reported__c, Vehicle__c, Date_Due__c
            from case
            where status =:STATUS_NEW

        ];

        Equipment_Maintenance_Item__c equipmentsMaintanenceItems = [

            select id
            from Equipment_Maintenance_Item__c
            where Maintenance_Request__c =:caseUpdated.Id

        ];

        Assert.isNotNull(caseUpdated);
        Assert.areEqual('Routine Maintenance', caseUpdated.Subject);
        Assert.areEqual(caseUpdated.Type, REQUEST_TYPE);
        Assert.areEqual(caseUpdated.Equipment__c, equipmentId);
        Assert.areEqual(caseUpdated.Vehicle__c, vehicleId);
        Assert.areEqual(caseUpdated.Date_Reported__c, System.today());
    
    }

    @isTesT
    public static void shouldCreateMaintenanceTestNegative () {

        Vehicle__c vehicle = shouldCreateVehicle();
        insert vehicle;
        id vehicleId = vehicle.Id;

        Product2 equipment = shouldCreateEquipment();
        insert equipment;
        id equipmentId = equipment.Id;

        Case casesToUpdate = shouldCreateCase(vehicleId, equipmentId);
        insert casesToUpdate;

        Equipment_Maintenance_Item__c equipmentMaintenance = shouldCreateEquipmentMaintenanceItem(equipmentId, casesToUpdate.id);
        insert equipmentMaintenance;

        Test.startTest();
        casesToUpdate.Status = WORKING;
        update casesToUpdate;
        Test.stopTest();

        List<Case> caseUpdated = [

            Select id from Case

        ];

        Equipment_Maintenance_Item__c equipmentsMaintanenceItems = [

            select id
            from Equipment_Maintenance_Item__c
            where Maintenance_Request__c =:casesToUpdate.Id

        ];

        Assert.isNotNull(equipmentsMaintanenceItems);
        Assert.areEqual(1, caseUpdated.Size());
    
    }

    @istest
    private static void shouldCreateTestMaintenanceRequestBulk(){

        list<Vehicle__C> vehicleList = new list<Vehicle__C>();
        
        list<Product2> equipmentList = new list<Product2>();
        
        list<Equipment_Maintenance_Item__c> workPartList = new list<Equipment_Maintenance_Item__c>();
        
        list<case> requestList = new list<case>();
        
        list<id> oldRequestIds = new list<id>();
        
        for(integer i = 0; i < 300; i++){
           
            vehicleList.add(createVehicle());
            equipmentList.add(createEq());
        
        }
        
        insert vehicleList;
        
        insert equipmentList;
        
        for(integer i = 0; i < 300; i++){
        
            requestList.add(createMaintenanceRequest(vehicleList.get(i).id, equipmentList.get(i).id));
        
        }
        
        insert requestList;
        
        for(integer i = 0; i < 300; i++){
        
            workPartList.add(createWorkPart(equipmentList.get(i).id, requestList.get(i).id));
        
        }
        
        insert workPartList;
        
        test.startTest();
        
        for(case req : requestList){
        
            req.Status = CLOSED;
        
            oldRequestIds.add(req.Id);
        
        }
        
        update requestList;
        
        test.stopTest();
        
        list<case> allRequests = [select id
                                 from case
                                 where status =: STATUS_NEW];
        
        list<Equipment_Maintenance_Item__c> workParts = [select id
                                                        from Equipment_Maintenance_Item__c
                                                        where Maintenance_Request__c in: oldRequestIds];
        
        Assert.areEqual(allRequests.size() == 300);
    }

}