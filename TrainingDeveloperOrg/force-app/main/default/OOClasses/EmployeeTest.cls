@isTest
public class EmployeeTest {

    @isTest
    public static void shouldCreateEmployee() {

        Manager manager = new Manager();
        manager.name = manager.name;
        manager.salary = 20000;
        System.debug(manager);
        System.debug(manager.getBonus());

        Advisor advisor = new Advisor();
        advisor.name = advisor.name;
        advisor.salary = 10000;
        System.debug(advisor);
        System.debug(advisor.getBonus());

    }

}