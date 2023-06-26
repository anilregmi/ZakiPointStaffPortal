package zakiemployee

class UrlMappings {

   static mappings = {
       "/search" (controller: "employee", action: "search")


        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/"(view:"/index")
        "500"(view:'/error')
        "404"(view:'/notFound')
    }
}
