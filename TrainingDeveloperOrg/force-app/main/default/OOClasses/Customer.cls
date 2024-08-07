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
    public Date createdDate;
    public Datetime lastModifiedDate;    
    public List<CustomerContact> contacts;

    public Customer() {

        status = 'Não Iniciado';
        isActive = true;
        contacts = new List<CustomerContact>();

    }

    public Customer (String name) {

        this();
        this.name = name;

    }

    public void addContact (String name, String email) {

        CustomerContact contact = new CustomerContact();

        contact.name = name;
        contact.email = email;

        contacts.add(contact);

        System.debug('Contact name: ' + contact.name);
        System.debug('Contact email: ' + contact.email);

        System.debug('Total de Contatos adicionados: ' + contacts.size());

    }

    public void show () {

        System.debug('Show Customer into debug log');

    }

} 