public class Mock<C: CalleeKey> {
    
    var calls = [Call]()
    var stubs = [String: Stub]()
    
    public init() {}
    
    public typealias Call = (callee: C, arguments: Arguments)
    public typealias Stub = (Call) throws -> Any?
    
}

public struct Arguments {
    
    public let arguments: [Any?]
    
    init(_ arguments: [Any?]) {
        self.arguments = arguments
    }
    
}

public extension Arguments {

    func argument(_ position: Int) -> Any? {
        guard position < arguments.count else {
            return nil
        }
        
        return arguments[position]
    }
    
    func argument<T>(_ position: Int) -> T? {
        return argument(position) as? T
    }
    
}
