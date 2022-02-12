# qsort 함수
'stdlib.h'에서 지원하는 정렬 함수로, 퀵 정렬을 사용한다. 사용 방법은 다음과 같다. <br>
```
qsort(배열 이름, 배열의 길이, 배열의 크기, 정렬 비교 함수);
```
첫 번째 매개변수로 배열 이름이 아닌 배열의 주소를 사용해도 무관하다. <br>

## 정렬 비교 함수
```
int OrderAscending(const void* a, const void* b) {
	return *(const int*)a - *(const int*)b;
}

int OrderDescending (const void* a, const void* b) {
	return *(const int*)b - *(const int*)a;
}
```
