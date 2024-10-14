/**
 * @author bruno.moreira
 */
public class Manager extends Employee {
    
    public Manager() {
        super();
        System.debug( 'Construtor Manager');
    }

    //Sobrecarga: Capacidade da classe filha modificar o comportamento de um metódo da classe pai. O metódo na classe pai precisa ter a palavra reservada "virtual" e o metodo filho precisa ter a palavra reservada "override".
    override
    public Decimal getBonus () {
        Decimal bonus = super.getBonus();
        return bonus + 7000;       
    } 

}