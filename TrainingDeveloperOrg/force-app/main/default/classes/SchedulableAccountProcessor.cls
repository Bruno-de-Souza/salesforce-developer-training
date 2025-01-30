/**
 * @author bruno.moreira
 */
global class SchedulableAccountProcessor implements Schedulable {
    
    global void execute(SchedulableContext SC) {

        Set<String> Ids;
       
        AccountProcessor.countContacts(Ids);
    
    }

 }