# Vector STL
c++ 'vector'에 포함 되어있는 STL 자료형. 배열과 유사하지만 데이터를 추가, 삭제함에 있어 훨씬 편리하다. 사용 방법은 다음과 같다. <br>
```cpp
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
* <strong>vector.erase(start, end)</strong>: start~end 위치에 있는 값을 삭제한다. <br>
<br>

## 2차원 Vector
2차원 벡터의 사용 방법은 다음과 같다.
```cpp
vector<vector<int>> v1; //일반적인 선언 방법
vector<vector<int>> v2(10, vector<int>(10, 0)); //선언과 동시에 사이즈를 지정하는 경우
```
2차원 벡터에서의 초기화 방식은 꽤 특이하다. <br>
vector<vector<int>> v2(10, vector<int>(10, 0));은 행 갯수 10, 열 갯수 10의 방을 모두 0으로 초기화 하겠다는 의미이다. <br>
<br>
  
## 중복값 제거
### unique
c++ 'algorithm'에 포함 되어있는 vector 중복값 제거 함수. <br>
```cpp
#include <vector>
#include <algorithm>
using namespace std;

void main()
{
  vector<int> num;
  num.push_back(1);   num.push_back(2);
  num.push_back(3);   num.push_back(3);
  num.push_back(4);   num.push_back(5);
  num.push_back(5);   num.push_back(6);
  
  vector<int> v1(num);
  unique(v1.begin(), v1.end(); //1, 2, 3, 4, 5, 6, 5, 6
  
  vector<int> v2(num);
  v2.erase(unique(v2.begin(), v2.end()), v2.end()); //1, 2, 3, 4, 5, 6
}
```
위에서 알 수 있듯이 unique를 단독으로 사용하는 경우에는 문제가 발생한다. <strong>중복값을 제거하되, 벡터의 사이즈는 변하지 않기 때문의 기존의 값들이 남아있는 것이다.</strong> 이러한 문제는 resize()를 사용함으로써 해결할 수 있다. <br>
그보다도 더 간편한 방법이 있는데, <strong>바로 unique와 erase를 함께 쓰는 것이다.</strong> 이렇게 사용하는 경우에는 중복값이 있는 인덱스를 아예 삭제하기 때문에 따로 resize)_를 사용하지 않아도 된다.<br>
