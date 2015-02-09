package livebill

class Printers {

    String manufacturer
    String model
    String departament
    BigInteger printedPages
    Date createdAt
    Date updatedAt
    
    static hasMany = [pages: PrintersSupplies]
    static hasOne = [tonner: Tonners]
    
    static constraints = {
        
    }
    
}
