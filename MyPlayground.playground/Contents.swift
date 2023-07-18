//클래스 제네릭 자료 타입을 T로 할경우 Int, String에 대한 처리나 나머지 연산 처리(Swift는 실수형을 기준으로 바로 나머지 연산 할수없음)등에 대한 처리를 다 해줘야 함으로 인해 기본 타입은 실수형으로 제한
class Calculator<T: FloatingPoint> {
    func calculate(operation: Character, first: T, second: T) -> T? {
        switch operation {
        case "+":
            let addOperation = AddOperation<T>()
            let additionResult = addOperation.add(first: first, second: second)
            return additionResult
        case "-":
            let subtractOperation = SubtractOperation<T>()
            let subtractitionResult = subtractOperation.subtract(first: first, second: second)
            return subtractitionResult
        case "*":
            let multiPlyOperation = MultiplyOperation<T>()
            let multiPlyResult = multiPlyOperation.multiply(first: first, second: second)
            return multiPlyResult
        case "/":
            let divideOperation = DivideOperation<T>()
            let divideResult = divideOperation.divide(first: first, second: second)
            return divideResult
        case "%":
            let modOperation = ModOperation<T>()
            let modResult = modOperation.mod(first: first, second: second)
            return modResult
        default:
            return nil
        }
    }
}
//쓸일은 없겠지만 외부모듈에서 접근한다는 가정
open class AbstractOperation<T: FloatingPoint> {
    @available(iOS 3.0, *)
    open  func add(first: T, second: T) -> T? {
        return nil
    }
    
    @available(iOS 3.0, *)
    open func subtract(first: T, second: T) -> T? {
        return nil
    }
    
    @available(iOS 3.0, *)
    open func divide(first: T, second: T) -> T? {
        return nil
    }
    
    @available(iOS 3.0, *)
    open func multiply(first: T, second: T) -> T? {
        return nil
    }
    
    @available(iOS 3.0, *)
    open func mod(first: T, second: T) -> T? {
        return nil
    }
}
final class AddOperation<T: FloatingPoint>: AbstractOperation<T> {
    override final func add(first: T, second: T) -> T? {
        return first + second
    }
}

final class SubtractOperation<T: FloatingPoint>: AbstractOperation<T> {
    override final func subtract(first: T, second: T) -> T? {
        return first - second
    }
}

final class MultiplyOperation<T: FloatingPoint>: AbstractOperation<T> {
    override final func multiply(first: T, second: T) -> T? {
        return first * second
    }
}

final class DivideOperation<T: FloatingPoint>: AbstractOperation<T> {
    override final func divide(first: T, second: T) -> T? {
        if second != 0 { // 두번째 피연산자가 0일경우 정의가 성립하지 않으므로..
            return first / second
        } else {
           return nil
        }
    }
}
final class ModOperation<T: FloatingPoint>: AbstractOperation<T> {
    override final func mod(first: T, second: T) -> T? {
        if second != 0 {
            return first.truncatingRemainder(dividingBy: second)//정수형을 버리고 소수부분을 기준으로 나머지 계산된 결과를 처리함 ex) 10.5/3 -> 정수형 3 버림, 그이후 나머지 연산한 1.5를 반환
        } else {
            return nil
        }
    }
}

let calculator = Calculator<Double>()// or  Calculator<Float>()//


let addResult = calculator.calculate(operation: "+", first: 5.0, second: -13.0)
if let value = addResult{
    print("덧셈 -> : \(value)")
    //print(Int(value)) 정수형으로 할경우 소수점버리는것은 감안
}
let subResult = calculator.calculate(operation: "-", first: -15.0, second: 3.0)
if let value = subResult{
    print("뺄샘 -> : \(value)")
    //print(Int(value)) 정수형으로 할경우 소수점버리는것은 감안
}
let multiplyResult = calculator.calculate(operation: "*", first: 5.0, second: -3.5)
if let value = multiplyResult{
    print("곱셈 -> : \(value)")
    //print(Int(value)) 정수형으로 할경우 소수점버리는것은 감안
}

let divideResult = calculator.calculate(operation: "/", first: 10.5, second: 3.0)
if let value = divideResult{
    print("나눗셈 -> : \(value)")
    //print(Int(value)) 정수형으로 할경우 소수점버리는것은 감안
}

let modResult = calculator.calculate(operation: "%", first: 10.5, second: 3.0)
if let value = modResult{
    print("나머지 -> : \(value)")
    //print(Int(value)) 정수형으로 할경우 소수점버리는것은 감안
}


