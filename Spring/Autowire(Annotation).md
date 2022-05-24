# Annotation을 이용한 Autowire

spring 2.5 버전부터 제공하는 방식.

1. `<context:annotation-config/>` : bean 클래스 java 파일에 등록되어 있는 annotation을 분석해서 실행함.
2. `@Configuration` : 해당 자바 파일이 bean 설정을 위한 자바 파일임을 명시함.

## Annotation 종류

1. **@Autowired**
    
    참조변수에서만 사용이 가능하다. 멤버변수, setter(), 생성자에 추가될 수 있다.
    
    container에서 멤버 변수와 같은 타입의 bean을 찾아서 자동으로 주입한다.
    
    실행 시, **자동으로 setter()를 만들어 호출**하기 때문에, 굳이 개발자가 setter를 만들 필요Xx. 당연히 id 값 또한 필요 없다.
    
2. **@Qualifier(”name”)**
    
    자동 주입을 해야하는데, 같은 타입의 bean이 여러개 등록되어있을 때, **이름**을 부여하는 방식.
    
3. **@Value(”value”)**
    
    **기본형 변수를 자동 주입** 할 때에 사용한다.
    
    디폴트 매개변수 st → **xml 파일에 bean 태그 외 아무것도 안 쓸 수 있음.**
    
4. **@Required**
    
    반드시 주입해야 할 프로퍼티로 설정한다. (setter)
    
    spring 5.1 버전부터 Deprecated 됨. 반드시 주입해야 할 프로퍼티는 생성자 주입을 이용하도록 변경됨.
    

```xml
<Class 파일>
@Autowired
@Qualifier("d1")
private DataBean1 data1;

<XML>
<context:annotation-config/>
<bean id="d1" class="kr.hs.study.beans.DataBean1"/>
<bean id="test" class="kr.hs.study.beans.TestBean2"/>
```

---

# JSR250 Annotation

스프링에서 기본적으로 제공하지는 않지만(spring-context 라이브러리 만으로는 안 된다는 뜻), 자바의 공통 어노테이션이다. **Jsr250 라이브러리**를 설치해야한다.

## Annotation 종류

1. **@Resource**
    @Autowired + @Qualifier. 멤버변수 타입, 이름과 동일한 객체 찾아서 자동주입.
    
2. **@PostConstruct**
    init-method 옵션과 동일
    
3. **@PreDestroy**
    destroy-method 옵션과 동일
   
