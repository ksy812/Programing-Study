# Spring
오늘날 가장 많이 사용하는 Java 기반 응용프로그램 개발 **프레임워크**이다.  모든 Java 애플리케이션 개발에 이용가능하나, 주로 웹 개발에 사용한다.

2003년 ‘Rod Johnson이 발표했다.

## Spring Framework 특징
- 경량의 컨테이너로써 자바 객체 직접 관리
- POJO(Plain Old Java Object) 방식
    - 오래된 방식의 단순한 자바 오브젝트. 무거운 객체를 만드는 것에 대해 반발하며 생긴 개념이다.
- **IoC**(Inversion of Control)
    - 제어의 역전. 개발의 흐름과 객체에 대한 제어권을 개발자가 아닌, 스프링이 가진다.
- **DI**(Dependency Injection)
    - 의존성 주입. 개체 생성 시, 객체가 관리할 값을 넣어주는 것(생성자/setter)
- **AOP**(Aspect-Oriented Programming)
    - 관점 지향 프로그래밍.
- 자바 코드 작성을 줄일 수 있다.
- 객체 생성 방법은 xml을 이용하는 방법, java annotation을 이용하는 방법으로 나눌 수 있다.
- 객체를 생성하는 시점은 config.xml을 불러올 때이다.
- 스프링은 기본 **싱글톤**(single tone)이다.

## 라이브러리
[https://mvnrepository.com/](https://mvnrepository.com/) 에서 알맞은 버전의 코드를 복사한 후, pom.xml에 붙여넣는다.
- Spring Core: spring-context
- Log: sf4j, lombok
