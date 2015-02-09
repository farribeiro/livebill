package livebill

class PrintersSupplies {

    Date colletedAt
    int cyan
    int yellow
    int magenta
    int black
    int amount
    
    static hasOne = [printer: Printers]
    
    static constraints = {
    }
}
