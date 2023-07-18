//
//  ViewController.swift
//  Calc
//
//  Created by 박유경 on 2023/07/18.
//

import UIKit


class Calculator<T: FloatingPoint> {
    func calculate(operation: String, first: T, second: T) -> T? {
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
open class AbstractOperation<T: FloatingPoint> {
    @available(iOS 3.0, *)
     func add(first: T, second: T) -> T? {
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
class AddOperation<T: FloatingPoint>: AbstractOperation<T> {
    override func add(first: T, second: T) -> T? {
        return first + second
    }
}

class SubtractOperation<T: FloatingPoint>: AbstractOperation<T> {
    override func subtract(first: T, second: T) -> T? {
        return first - second
    }
}

class MultiplyOperation<T: FloatingPoint>: AbstractOperation<T> {
    override func multiply(first: T, second: T) -> T? {
        return first * second
    }
}

class DivideOperation<T: FloatingPoint>: AbstractOperation<T> {
    override func divide(first: T, second: T) -> T? {
        if second != 0 { // 두번째 피연산자가 0일경우 정의가 성립하지 않으므로..
            return first / second
        } else {
           return nil
        }
    }
}
class ModOperation<T: FloatingPoint>: AbstractOperation<T> {
    override func mod(first: T, second: T) -> T? {
        if second != 0 {
            return first.truncatingRemainder(dividingBy: second)//Swift에선 실수형으론 나머지 연산자를 할 수 없어 정수형으로 바꾼후 나머지 연산자를 하기 위해 truncate함
        } else {
            return nil
        }
    }
}



class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let calculator = Calculator<Double>()// 덧셈 기능하도록 초기화)
        
        
        let addResult = calculator.calculate(operation: "+", first: 5.0, second: 3.0)
        if let value = addResult{
            print(value)
        }
        let subResult = calculator.calculate(operation: "-", first: 5.0, second: 3.0)
        if let value = subResult{
            print(value)
        }
        let multiplyResult = calculator.calculate(operation: "*", first: 5.0, second: 3.0)
        if let value = multiplyResult{
            print(value)
        }
  
        let divideResult = calculator.calculate(operation: "/", first: 5.0, second: 3.0)
        if let value = divideResult{
            print(value)
        }

        let modResult = calculator.calculate(operation: "%", first: 5.0, second: 3.0)
        if let value = modResult{
            print(value)
        }
        
    }

}

