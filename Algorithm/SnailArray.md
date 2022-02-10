# 달팽이 배열

```
int row = 0, col = -1, num = 1;
int forward = N; //몇 칸 전진할 것인지
int sign = 1; //1 또는 -1을 가짐
int arr[N][N];
while(forward != 0){
  for(int i=0; i<forward; i++){
	  col += sign;
		arr[row][col] = num++;
  }
			
	forward--;
	if(forward == 0) break;
			
	for(int i=0; i<forward; i++){
	  row += sign;
	  arr[row][col] = num++;
	}
	sign *= -1; //부호를 바꿈
}
```
