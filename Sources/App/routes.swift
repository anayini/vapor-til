import Vapor

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    // Basic "It works" example
    router.get { req in
        return "It works!"
    }
    
    // Basic "Hello, world!" example
    router.get("hello") { req in
        return "Hello, world!"
    }
    
//    router.get("api", "acronyms", Int.parameter) { req -> Future<Acronym> in
//        guard let param = try? req.parameters.next() as Int, let intParam = param as? Int else { return }
//        return Acronym.self.find(param, on: .sqlite)
//    }
//        
    
    router.post("api", "acronyms") { req -> Future<Acronym> in
        let acronym = try req.content.decode(Acronym.self)
        return acronym.flatMap(to: Acronym.self) { acronym in
            acronym.save(on: req)
        }
    }
}
