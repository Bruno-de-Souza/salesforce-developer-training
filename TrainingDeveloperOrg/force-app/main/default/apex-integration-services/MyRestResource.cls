/**
 * @author bruno.moreira
 */
@RestResource(urlMapping='/HelloWorld/')
global class MyRestResource {

    @HttpGet
    global static Account getAccount() {

        return null;

    }

}

/*

    The base endpoint for Apex REST is 
    https://yourInstance.my.salesforce.com/services/apexrest/Account/*

*/