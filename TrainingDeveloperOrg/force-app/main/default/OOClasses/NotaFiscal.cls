/**
 * @author bruno.moreira
 */
public with sharing class NotaFiscal {
    
    public NotaFiscal() {        
    }

    public void imprimeNota ( String value ) {

        System.debug( 'Nota: '  + value);

    }

}