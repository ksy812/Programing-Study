# Component

**클래스**에 **@Component** 어노테이션 사용하면, Bean Configuration 파일에 Bean 따로 등록하지 않아도 해당 클래스 **객체**가 **자동으로 등록**됨. 타입을 통해서 Bean 객체를 가져올 수 있음.

Bean 두 개 이상 생성하고 싶다면 Bean Configuration 파일에 추가적으로 작성해야 함.

@Component(name), @Lazy, @Scope같은 각종 어노테이션 함께 사용 가능. 멤버 메서드에 @PostConstructor, @PreDestroy 사용할 수 있음.

## XML

`<context:component-scan base-package="..."/>` : 지정된 패키지 밑에 있는 모든 클래스의 Annotation을 분석해서 실행. ⇒ 해당 태그 여러개 사용할 수 있음.

## JAVA

`@Configuration`

`@ComponentScan(basePackages = {"...", "..."})` : 지정된 패키지 밑에 있는 모든 클래스의 Annotation을 분석해서 실행.
