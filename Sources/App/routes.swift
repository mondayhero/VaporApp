import Vapor

/// Register your application's routes here.
public func routes(_ router: Router) throws {
 
    // Example of configuring a controller
    let helloController = HelloController(service: ProjectServices.greetingService)
    let routerGroup = router.grouped("greeting").grouped(RequestMiddleware())
    routerGroup.post("hello", use: helloController.sayHello)
    
}
