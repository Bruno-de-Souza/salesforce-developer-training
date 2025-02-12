trigger HelloWorldTrigger on Account (before insert) {

    for (Account account: trigger.new) {

        account.Description = 'New Description From a Trigger!';

    }

}