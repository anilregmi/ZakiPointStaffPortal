package zakiemployee

import grails.converters.JSON
import org.springframework.web.multipart.MultipartFile
import java.util.UUID
import java.io.File

class EmployeeController {
    static scaffold = Employee

    def index() {}

    def search() {
        def departmentQuery = params.departmentQuery // Get the department search query parameter
        def employeeQuery = params.employeeQuery // Get the employee search query parameter

        // Perform the search query for departments
        def departments = Department.findAll {
            ilike("departmentName", "%${departmentQuery}%")
        }

        // Perform the search query for employees
        def employees = Employee.findAll {
            ilike("firstName", "%${employeeQuery}%")

        }

        if (departmentQuery && employeeQuery) {
            def filteredEmployees = employees.findAll { employee ->
                employee.department?.departmentName == departmentQuery
            }

            if (filteredEmployees) {
                render view: '/employee/index', model: [departments: departments, employees: filteredEmployees, noResults: false]
            } else {
                // Handle the case when no matching employees are found
                render view: '/employee/index', model: [departments: departments, employees: filteredEmployees, noResults: true, alertMessage: 'No match found']
            }
        }

        else if (!departmentQuery && employeeQuery) {
            render view: '/employee/index', model: [employees: employees]
        }
        else if (departmentQuery && !employeeQuery) {
            render view: '/employee/index', model: [departments: departments]
        }else {
            render view: '/employee/index', model: [ employees: employees]        }
    }
}

//    def search() {
//        def query = params.q // Get the search query parameter from the request
//
//        // Perform the search query
//        def employees = Employee.findAll {
//            ilike("firstName", "%${query}%")
//        }
//        render employees as JSON
//    }
//    def upload() {
//        MultipartFile uploadedFile = request.getFile('myFile')
//
//        if (uploadedFile && !uploadedFile.isEmpty()) {
//            // Specify the folder where you want to store the image
//            String folderPath = 'C:\\Users\\DELL\\Downloads\\photos\\'
//
//            // Generate a unique file name for the image
//            String fileName = UUID.randomUUID().toString() + '.' + uploadedFile.getOriginalFilename().split("\\.")[-1]
//
//            // Store the image file in the specified folder
//            String filePath = folderPath + fileName
//            new File(folderPath).mkdirs()
//            uploadedFile.transferTo(new File(filePath))
//
//            // Save the file path in your database
//            def profile = new Employee(filePath: filePath)
//            profile.save()
//
//            // Redirect to the get action to retrieve the uploaded image
//            redirect(action: "get", id: profile.id)
//
//        } else {
//            // Handle case when no file is selected
//            render "No file selected."
//        }
//    }
//
//    def get() {
//        def profile = Employee.get(params.id)
//        if (profile) {
//            // Render the uploaded image in the view
//            render(contentType: 'image/jpeg', file: new File(profile.filePath))
//        } else {
//            render "Image not found."
//        }
//    }
//}
