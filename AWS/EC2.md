# EC2 (Elastic Cloud Compute)

`#가상컴퓨터` `#IaaS`

인프라를 제공해주는 서비스.

AWS의 **가장 기본적인 자원**이며 **가상 머신**상에 **OS** 설치 되어 있는 형태이다. 리눅스와 윈도우 등의 서버를 제공한다. (사용하는 OS에 따라서 가격에 차이 O)

즉, **가상의 컴퓨터**이나 실제 컴퓨터와 같은 동작을 한다.

클라우드를 사용하면 일반 컴퓨터에서는 사용하지 못하는 대용량 메모리 사용이 가능하다는 것이 큰 장점이다.

- IaaS: Infrastructure as a service
- PaaS: Platform as a service
- SasS: software as a service

<br>

## EC2 인스턴스

하나의 서버(컴퓨터)를 의미한다.

인스턴스에는 여러 타입들이 존재한다.

인스턴스는 중지, 재실행이 가능하다. 인스턴스를 종료할 시에는 인스턴스가 완전시 삭제되며 복구가 불가능하다.

## AMI(Amazon Machine Image)

가상 머신은 Image를 활용하여 생성된다. 여기서 이미지란 사진을 말하는 것이 아닌, OS, 설치 된 프로그램, 설정 등이 포함 된 파일을 말한다. 이미지를 사용하면 여러 서버에서 동일한 환경을 구성할 수 있다. AWS에서 다양한 종류의 AMI를 제공하고 있다.

## Security Group

EC2 인스턴스에 대한 보안 설정

Inbound, outbound에 대해서 접속 허용 설정이 가능하다.

- Inbound: 외부에서 인스턴스로 들어오는 네트워크
- Outbound: 인스턴스에서 외부로 나가는 네트워크

## Key Pair

EC2 인스턴스에 접속하기 위한 암호화 된 파일

AWS 처음 사용 시 새로운 Key Pair를 생성해야 한다. 이는 타인과 공유해서는 안된다. 

## Elastic IP

EC2 인스턴스는 private IP 와 public IP를 보유하고있다.

기본적으로 할당되는 public IP는 인스턴스 재실행 후에는 변경된다. 영구적인 public IP 설정을위해서 Elastic IP를 사용해야한다. Elastic IP는 실행 중인 인스턴스에 연동하여 사용할시에는 무료이다.
