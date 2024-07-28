/**
 * @author bruno.moreira
 */
public class Manager extends Employee {
    
    public Manager() {
        name = 'John';
    }

    override
    public Decimal getBonus() {
        return super.getBonus() + 2000;
    }

}