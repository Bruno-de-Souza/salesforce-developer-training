trigger ExampleTrigger on Contact (after insert, after delete) {
    if (Trigger.isInsert) {
        Integer recordCount = Trigger.new.size();
        // Call a method from a class
        EmailManager.sendMail('brunomoreiramg@gmail.com', 'Hello World!', recordCount + ' contact(s) were inserted! ');
    } else if (Trigger.isDelete){
        //Process after the delete
    }
}