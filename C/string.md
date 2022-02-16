# string
C++ 'string'에서 지원하는 문자열 자료형.<br>
C에서의 문자열과 C++에서의 문자열의 차이에 집중하며 공부하자. <b>string</b>과 <b>char*</b>, <b>char[]</b> 의 차이에 주의해야한다.<br>

## string 클래스의 멤버 함수
str.compare(param): 자기자신과 매개변수를 비교해서 같으면 0을 반환. 문자열이 같지 않다면, 아스키코드를 기준으로 1, -1을 반환.<br>
str.substr(인덱스, 갯수): 인덱스부터 갯수개를 반환.<br>
str.replace(시작 인덱스, 끝 인덱스, 서브 문자열): 시작 인덱스에서 끝 인덱스-1까지를 서브 문자열로 대체함.<br> 
str.length(): 문자열의 길이 반환.<br> 
str.size(): 문자열의 사이즈 반환.<br>
str.capacity(): 문자열의 메모리 사이즈 반환.<br>
str.clear(): 문자열을 모두 비움. 이 때, capacity는 변하지 않음.<br>
str.empty(): 문자열이 비었는지 확인 후 bool값을 반환.<br>
