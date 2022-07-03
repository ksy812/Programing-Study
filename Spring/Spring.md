# Spring
오늘날 가장 많이 사용하는 Java 기반 응용프로그램 개발 **프레임워크**이다.  모든 Java 애플리케이션 개발에 이용가능하나, 주로 Java EE 위의 **웹 개발**에 사용한다.

2003년 ‘Rod Johnson’이 발표했다.

<aside>
💡 **프레임워크**: 프로그램을 작성할 때 뼈대가 되는 골격

</aside>

## Spring Framework 특징

- 메모리를 적게 사용하는 경량의 컨테이너로써, 자바 객체를 직접 관리
- POJO(Plain Old Java Object) 방식
    - 오래된 방식의 단순한 자바 오브젝트. 무거운 객체를 만드는 것에 대해 반발하며 생긴 개념이다.
    - 자바 모델이나, 기능, 프레임워크 등에 따르지 않고 홀로 **독립적**이며 **단순한 기능만**을 가진 객체들을 의미한다.
    자바에서는 이러한 객체들을 Bean이라고 부른다.
- **IoC**(Inversion of Control)
    - 제어의 역전. 개발의 흐름과 객체에 대한 제어권을 개발자가 아닌, 스프링이 가진다.
- **DI**(Dependency Injection)
    - 의존성 주입. 개체 생성 시, 객체가 관리할 값을 넣어주는 것(생성자/setter)
- **AOP**(Aspect-Oriented Programming)
    - 관점 지향 프로그래밍.
- iBATIS, myBATIS, JPA, Hibernate등의 데이터베이스 라이브러리 지원
- 자바 코드 작성을 줄일 수 있다.

## Bean 객체

- spring IoC 컨테이너에 의해서 인스턴스화, 관리, 생성된다.
- 스프링은 기본 **싱글톤**(singleton)이다.
- 객체 생성 방법은 xml을 이용하는 방법, java annotation을 이용하는 방법으로 나눌 수 있다.
- bean 태그&어노테이션: 사용할 Bean을 정의한다.
- 생성한 bean을 가져오는 방법
    - 다운캐스팅: `TestBean obj = (TestBean)ctx.getBean(”t1”);`
    - 가져올 객체의 클래스 명시: `TestBean obj = ctx.getBean(”t1”, TestBean.class);`
- bean 객체를 생성하는 시점은 스프링이 config.xml(객체 설정 파일)을 불러올 때이다.
- IoC 컨테이너가 종료될 때 bean 객체가 소멸된다.

## 컨텍스트 종류

- **ClassPathXmlApplicationContext**: xml에서 bean 객체 설정 하는 경우
- **GenericXmlApplicationContext**: “
- **AnnotationConfigApplicationContext**: 자바 파일에서 bean 개체 설정 하는 경우

## 라이브러리

[https://mvnrepository.com/](https://mvnrepository.com/) 에서 알맞은 버전의 코드를 복사한 후, pom.xml에 붙여넣는다.

- Spring Core: spring-context
- Log: slf4j-api, lombok
    - slf4j: 로깅에 대한 추상 레이어를 제공하는 인터페이스의 모음.
    - lombok: DTO, VO, Entity에 대한 작업을 보다 쉽고 수정이 간편하도록 도와주는 라이브러리
