package zakiemployee
//import grails.rest.*
//
//@Resource(uri='/zakiEmployee', formats=['json', 'xml'])
class Department {
    String departmentName
    String description
    static hasMany = [team:Team,employee:Employee]


    static constraints = {
        departmentName blank: false
    }

}
