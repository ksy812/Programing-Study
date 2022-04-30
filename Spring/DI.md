# DI(dependency Injection): 의존성 주입

Bean객체를 생성할 때, 객체가 관리할 값이나 객체를 주입하는 것을 말한다. xml에서 작업하는 방식, java에서 작업하는 방식으로 나뉜다.

## XML

ClassPathXmlApplicationContext ctx = new ClassPathXmlAplicationContext(”kr/hs/study/config/config.xml”);

1. **Constructor DI**(생성자를 통한 주입)
    1. 기본형 변수: `<constructor-arg value=  [type=  index=  ] />`
    2. 참조형 변수:
        1. `<constructor-arg ref="주입할 객체 ID" />`
        2. `<constructor-arg> <bean class="주입할 객체 클래스**주소"**/></constructor-arg>`
        
2. **Setter DI**(Setter를 통한 주입)
    1. 기본형 변수: `<property name=  value=  />`
    2. 참조형 변수: `<property name=  ref=  />`
    - 원리: name에 지정된 이름의 **setter 메서드**를 호출하여 실행하는 것. 만약 해당 멤버변수의 setter 메서드가 존재하지 않는다면, 스프링이 자동으로 생성.
    - **기본생성자**가 있는지 꼭 확인할 것. 없을 시 동작 Xx

```xml
<bean id="t1" class="kr.hs.study.beans.TestBean" lazy-init="true">
	<constructor-arg value="11" type="int"/>
	<constructor-arg value="Wacom" type="java.lang.String"/>
	<constructor-arg>
		<bean class="kr.hs.study.beans.DataBean"/>
	</constructor-arg>
</bean>
	    
<bean id="d2" class="kr.hs.study.beans.DataBean2"/>
<bean id="t2" class="kr.hs.study.beans.TestBean2" lazy-init="true">
  <property name="data1" value="22"/>
	<property name="data3" ref="d2"/>
</bean>
```

### Bean 태그 속성

- lazy-init = “true”: xml 파일을 불러올 때가 아닌, getBean() 메서드를 사용할 때에 객체를 생성함.
- scope = ”prototype”: 스프링은 기본 싱글톤이다. 객체 생성 시마다 새로운 객체를 만들고 싶다면 이 속성을 사용해야한다.
- init-method: 생성자를 호출할 때 함께 동작할 메서드를 등록함.
- destory-method: 객체 소멸 이전에 실행되는 메서드. (ctx.close() 바로 이전)

