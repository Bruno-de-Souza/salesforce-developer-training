/**
 * @author bruno.moreira
 */
public class Customer {

    public String name;
    
    public String email;
    
    public String type;
    
    public String status;
    
    public Boolean isActive;
    
    public Decimal balance; 
    
    public Long employees;
    
    public List<CustomerContact> contacts;
    
    public Date createdDate;
    
    public DateTime lastModifiedDate;

    public Customer () {
        this.isActive = true;
        this.status = 'Não Iniciado';        
        this.contacts = new List<CustomerContact>();
        System.debug('Construtor default');
    }

    public Customer (String name) {
        
        //"this.name" sombreamento de variável local do metodo construtor com a mesma variável de instância da classe.

        this(); // deve ser o primeiro comando do construtor
        this.name = name;
        System.debug('Construtor que recebe o name');
    }

    public Customer (String name, String status) {
        this(name);
        this.status = status;
        System.debug('Construtor que recebe o name e status');
    }

    //Boa prática é colocar a tríade de parâmetros no construtor "Máximo de 3 parâmetros no construtor".
    public Customer(String name, String status, String type) {
        this(name, status);
        this.type = type;
        System.debug('Construtor que recebe name, status e type');
    }

    //Sobrecarga - Variando os argumentos/parâmetros no construtor
    public Customer(String name, String status, Date createdDate) {
        this(name, status);
        this.createdDate = Date.today();
        System.debug('Construtor que executa a mesma operação de forma diferente!');
    }


    public void addContact ( String name, String email ) {

        CustomerContact contact = new CustomerContact();
        contact.name = name;
        contact.email = email;

        contacts.add(contact);

        System.debug('Adicionado o Nome : ' + contact.name);
        System.debug('Adicionado o Email : ' + contact.email);
        System.debug('Total de Contatos : ' + contacts.size() );

    }

    public void show () {

        System.debug('Show Customer into debug log');

    }

}