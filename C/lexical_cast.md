# lexical_cast
c++ Boost 라이브러리의 lexical_cast 기능을 사용하여 편리하게 일반된 형식의 형변환을 할 수 있다. 사용방법은 다음과 같다.
```cpp
#include <boost/lexical_cast.hpp>

void main(){
  boost::lexical_cast<type>(value);
}
```
type을 지정하면 value 값을 type 자료형으로 형변환하여 반환한다.

문제가 있을 시, boost::bad_lexical_cast 예외를 발생시킨다.
<br>

## 예제
### string to number
```cpp
#include <boost/lexical_cast.hpp>
#include <vector>

int main(int /*argc*/, char * argv[])
{
    using boost::lexical_cast;
    using boost::bad_lexical_cast;

    std::vector<short> args;

    while (*++argv)
    {
        try
        {
            args.push_back(lexical_cast<short>(*argv));
        }
        catch(const bad_lexical_cast &)
        {
            args.push_back(0);
        }
    }
}
```


## 참고 링크
* 공식 문서 https://www.boost.org/doc/libs/1_60_0/doc/html/boost_lexical_cast.html
