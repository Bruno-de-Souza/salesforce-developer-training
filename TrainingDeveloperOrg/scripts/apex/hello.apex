// Use .apex files to store anonymous Apex.
// You can execute anonymous Apex in VS Code by selecting the
//     apex text and running the command:
//     SFDX: Execute Anonymous Apex with Currently Selected Text
// You can also execute the entire file by running the command:
//     SFDX: Execute Anonymous Apex with Editor Contents

string tempvar = 'Enter_your_name_here';
System.debug('Hello World!');
System.debug('My name is ' + tempvar);

new NotaFiscal().imprimeNota('2345778');

Customer customer = new Customer();
customer.name = 'Bruno Moreira';
customer.email = 'brunomoreiramg@gmail.com';
customer.isActive = true;
customer.type = 'Gold';

customer.addContact('Daniel Silveira', 'danielsilveira111@gmail.com');
customer.addContact('Bruno Moreira', 'brunomoreiramg@gmail.com');


Manager manager = new Manager();
manager.name = 'Bruno Moreira';
manager.salary = 20.000;
system.debug(manager);


Adivisor adivisor = new Adivisor();
adivisor.name = 'Gustavo Morelato';
adivisor.salary = 10.000;
system.debug(adivisor);