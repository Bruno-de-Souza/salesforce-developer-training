@isTest
public class EmployeeTest {

    @isTest
    public static void testEmployee() {

        Advisor advisor = new advisor();
        advisor.name = 'advisor';
        advisor.salary = 3000;
        System.debug(advisor.getBonus());
    
        Manager manager = new Manager();
        manager.name = 'manager';
        manager.salary = 10000;
        System.debug(manager.getBonus());

    }

}