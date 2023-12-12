public class PrimitiveDataTypes {
    String name;
    Integer age;
    Decimal salary;
    Boolean isMarried;
    public void dataTypesMethod() {
        System.debug('Here start the method**************');
        name = 'Bruno';
        age = 30;
        salary = 100.00;
        isMarried = true;
        System.debug('These are my data types: ' + 'Name: ' + name + ', ' + 'Age: ' + age  + ', ' + 'Salary: ' + salary + ', ' 
        + 'Is married? ' + isMarried);
    }
}