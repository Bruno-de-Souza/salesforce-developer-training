/**
 * @author bruno.moreira
 */
public class Celular {
        
    public String marca;

    public String modelo;

    public List<sistemaOperacional> sistemasOperacionais;    

    public Celular() {

        this.marca = marca;
        this.modelo = modelo;
        this.sistemasOperacionais = new List<sistemaOperacional>();
        
        System.debug( 'Construtor Default!' );
        
    }

    public Celular(String marca) {

        this();
        this.marca = marca;

        System.debug( 'Construtor que recebe a marca!' );

    }

    public Celular(String marca, String modelo) {

        this(marca);
        this.modelo = modelo;

        System.debug( 'Construtor que recebe a marca e modelo!' );

    }

    public void addSistemasOperacionais(String sistemaOperacional) {

        SistemaOperacional so = new SistemaOperacional();
        so.name = sistemaOperacional;
        this.sistemasOperacionais.add(so);

        System.debug(' Sistema Operacional adicionado! ');

    }

}