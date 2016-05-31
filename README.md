# SwiftMockGen
A build tool to process Protocols into Mock class definitions. Inspired by Swift's gyb script, Moq and a desire to not manually write mock classes.

```swift
protocol SampleProtocol {
    var GetterOnly : String { get }
    
    
    func NoParams() -> String
}
```

generates

```swift
class MockSampleProtocol {
    func GetterOnly(name: String) : Verifiable
    func GetterOnly(() -> String ) : Verifiable
    
    func NoParams(returnValue: String) : Verifiable
    func NoParams(overrideImpl: () -> String) : Verifiable
    
    let Object : SampleProtocol
}
```

**Not supported**
* protocol inheritence
* static
* mutating funcs
