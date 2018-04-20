import Routing
import Vapor

/// Register your application's routes here.
///
/// [Learn More →](https://docs.vapor.codes/3.0/getting-started/structure/#routesswift)
public func routes(_ router: Router) throws {
    // Basic "Hello, world!" example
    router.get("hello") { req in
        return "Hello, world!"
    }
    
/*
    router.post(InfoData.self, at: "info") { req, data -> String in
        
        // let data = try req.content.decode(InfoData.self).await(on: req)
        return "Hello \(data.name)!"
    }
*/
    router.post(InfoData.self, at: "info") { req, data -> InfoResponse in
        
        // let data = try req.content.decode(InfoData.self).await(on: req)
        return InfoResponse(request: data)
    }
    

    
    

    // Example of configuring a controller
    let todoController = TodoController()
    router.get("todos", use: todoController.index)
    router.post("todos", use: todoController.create)
    router.delete("todos", Todo.parameter, use: todoController.delete)
}

struct InfoResponse: Content {
    let request: InfoData
}

struct InfoData: Content {
    let name: String
}
