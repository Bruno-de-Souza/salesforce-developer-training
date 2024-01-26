trigger HelloWorldTrigger on Account (before insert) {
	//System.debug(' Hello World! ');
    for (Account a : Trigger.new) {
        a.Description = ' This Description comes from a before insert trigger event! ';
    }
}