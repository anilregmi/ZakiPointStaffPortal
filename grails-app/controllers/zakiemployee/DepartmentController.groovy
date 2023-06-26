package zakiemployee

import grails.converters.JSON

class DepartmentController {
    static scaffold = Department

    def index() { }

//    def search() {
//        def query = params.q // Get the search query parameter from the request
//
//        // Perform the search query
//        def departments = Department.findAll {
//            ilike("departmentName", "%${query}%")
//        }
//        render departments as JSON
//    }


}
