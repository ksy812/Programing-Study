# string
C++ STL에서 지원하는 문자열 클래스. 'string'을 통해서 사용할 수 있다.<br>
C에서의 문자열과 C++에서의 문자열의 차이에 집중하며 공부하자. <b>string</b>과 <b>char*</b>, <b>char[]</b> 의 차이에 주의해야한다.<br>

## string 클래스의 멤버 함수
str.compare(param): 자기자신과 매개변수를 비교해서 같으면 0을 반환. 문자열이 같지 않다면, 아스키코드를 기준으로 1, -1을 반환.<br>

기본
* str.length(): 문자열의 길이 반환 
* str.size(): 문자열의 사이즈 반환
* str.capacity(): 문자열의 메모리 사이즈 반환
* str.substr(index, cnt): index부터 cnt개를 반환
<br>

추가, 삭제
* str.append(sub): 맨 뒤에 sub를 추가함
* str.append(index, sub): index의 앞에 sub를 추가함
* str.replace(start, end, sub): start ~ end-1을 sub로 대체함

* str.erase(start, end): start ~ end의 문자열을 삭제함
* str.clear(): 문자열을 모두 비움. 이 때, capacity는 변하지 않음
* str.empty(): 문자열이 비었는지 확인 후 bool값을 반환
