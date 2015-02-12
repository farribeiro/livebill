package livebill

class RequestsStatus {

    String description
    Date createdAt
    
    static hasOne =[request: Requests]
    
    static constraints = {
    }
}
