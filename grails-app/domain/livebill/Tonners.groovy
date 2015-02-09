package livebill

class Tonners {

    String referenceModel
    int amount
    
    static hasMany = [printer: Printers]
    
    static constraints ={
        referenceModel(primary_key: true)
    }
}