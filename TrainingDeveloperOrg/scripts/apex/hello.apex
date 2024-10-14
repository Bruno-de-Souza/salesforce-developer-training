aula1 - Introdução ao Apex: {

    Customer customer = new Customer('User01', 'Active', Date.today());

    Celular celular = new celular();
    celular.marca = 'Apple';
    celular.modelo = 'Iphone 6';
    celular.addSistemasOperacionais( 'IOS');    
    Celular celular2 = new Celular( 'Android' );
    Celular celular3 = new Celular( 'Xiomi', 'Hello World' );

    Contato contato = new contato();
    contato.nome = 'teste 1';
    contato.email = 'teste1@teste.com';
    contato.telefone = '31977665544';

}

aula3 - Nivelamento de OO: {

    Account account = new account();
    account.Name = 'acc01';
    account.addError('CNPJ Inválido!');
    System.debug(account.hasErrors());
    System.debug(account.get('Name'));

    Lead lead = new lead();
    lead.Company = 'company02';
    lead.addError('Nome de Lead Inválido!');
    System.debug(lead.hasErrors());
    System.debug(lead.get('Company'));

    Contact contact = new Contact();
    contact.FirstName = 'test03';
    contact.Phone = '8089808080809';
    contact.addError('Contato Inválido');
    System.debug( contact.hasErrors());
    System.debug( contact.get('FirstName'));

    Customer customer = new Customer();
    customer.name = 'customer01';
    System.debug(customer.toString());
    
    Account acc02 = new Account();
    acc02.Name = 'acc02';
    System.debug(acc02.toString());

    Advisor advisor = new advisor();
    advisor.name = 'advisor';
    advisor.salary = 3000;
    System.debug(advisor.getBonus());

    Manager manager = new Manager();
    manager.name = 'manager';
    manager.salary = 10000;
    System.debug(manager.getBonus());

    Advisor advisor2 = new Advisor();
    Manager manager2 = new Manager();
    Employee employee = advisor2;


}

