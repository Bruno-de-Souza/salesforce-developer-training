trigger MaintenanceRequest on Case (before update, after update) {
    // ToDo: Call MaintenanceRequestHelper.updateWorkOrders

    if (Trigger.isUpdate) {

        MaintenanceRequestHelper.updateWorkOrders();

        System.debug('Trigger on Cases');

    }

}