package livebill

class TonnersAmounts {

    Date collectedAt
    int amount
    
    static hasOne = [tonner: Tonners]
    
    static constraints = {
        
    }
}

