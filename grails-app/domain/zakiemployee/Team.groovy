package zakiemployee
//import grails.rest.*
//
//@Resource(uri='/zakiEmployee', formats=['json', 'xml'])
class Team {
    String teamName
    static hasMany = [employee:Employee]
    static belongsTo = [department:Department]

    static constraints = {
        teamName blank: false
    }

}
