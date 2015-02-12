package livebill

class Requests {

    String request
    
    static hasMany = [status: RequestsStatus]
    
    static constraints = {
        request(nullable: false, primary_key: true)
    }
}
