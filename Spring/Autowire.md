# Autowire: 자동주입

그동안 Bean을 정의할 때 주입할 객체는 생성자를 통한 주입이나 setter를 통한 주입을 사용했다.

**참조형** 멤버변수에는 자동주입이 가능하다. **내부적으로는 Setter DI 방식으로 동작함.**


## 종류

- **autowire = “byName”**
    
    멤버변수와 이름이 같은 bean을 찾아서 주입함.
    
- **autowire = ”byType”**
    
    멤버변수와 타입이 같은 bean을 찾아서 주입함.
    
    동일한 타입의 bean이 2개 이상인 경우 에러 발생.
    
- **autowire = “constructor”** (byType)
    
    생성자의 멤버변수와 타입이 동일한 bean을 찾아서 주입.
    
    동일한 타입의 bean이 2개 이상인 경우 에러 발생.
    

`@Bean(autowire="주입방식")`: 자동 주입 방식 설정

cf: Autowire.BY_NAME, Autowire.BY_TYPE   ⇒ spring 5.1부터 deprecated 됨(사용하지 않음). Bean에 직접 설정하는 방식 추천함.
