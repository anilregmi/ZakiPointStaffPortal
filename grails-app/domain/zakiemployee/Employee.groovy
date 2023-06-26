package zakiemployee

class Employee {
    String photo
    String firstName
    String lastName
    String gender
    String contact
    String designation
    String position
    static belongsTo = [department:Department,team:Team]


    static constraints = {
        firstName blank: false
        lastName blank: false
    }

}
