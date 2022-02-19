# Vector STL
c++ 'vector'에 포함 되어있는 STL 자료형. 배열과 유사하지만 데이터를 추가, 삭제함에 있어 훨씬 편리하다. 사용 방법은 다음과 같다. <br>
```
vector<int> v1;
vector<int> v2(10); //10개의 방을 생성 후
vector<int> v3(10, 0); //10개의 방을 생성 후, 모두 0으로 초기화
vector<int> v4(v3); //v3을 그대로 복사
```
int 외에도 string, 클래스 객체와 같은 다양한 자료형을 사용할 수 있다. <br>
<br>

## Vector 클래스 함수
* <strong>vector.push_back(param)</strong>: 벡터의 맨 뒤에 원소를 추가한다. <br>
* <strong>vector.pop_back()</strong>: 벡터에 마지막으로 삽입한 값을 빼내고, 반환한다. <br>
* <strong>vector.at(index)</strong>: index 위치에 있는 값을 반환한다. *배열처럼 vecor[index]를 사용한 참조 또한 가능하다.*<br>
* <strong>vector.front()</strong>: 맨 처음에 삽입한 값을 반환한다. <br>
* <strong>vector.end()</strong>: 마지막에 삽입한 값을 반환한다. <br>
* <strong>vector.size()</strong>: 벡터의 사이즈를 반환한다. <br>
* <strong>vector.capacity()</strong>: 벡터가 할당된 메모리 크기를 반환한다. size와는 차이가 있다. <br>
* <strong>vector.empty()</strong>: 벡터가 비어있는지 확인 후, bool 값을 반환한다. <br>
<br>

## 2차원 Vector
2차원 벡터의 사용 방법은 다음과 같다.
```
vector<vector<int>> v1; //일반적인 선언 방법
vector<vector<int>> v2(10, vector<int>(10, 0)); //선언과 동시에 사이즈를 지정하는 경우
```
2차원 벡터에서의 초기화 방식은 꽤 특이하다. <br>
vector<vector<int>> v2(10, vector<int>(10, 0));은 행 갯수 10, 열 갯수 10의 방을 모두 0으로 초기화 하겠다는 의미이다. <br>
