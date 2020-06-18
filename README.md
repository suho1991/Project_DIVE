
# DIVE

중고 상품을 편리하게 사고 팔고 할 수 있는 사이트


------------


### 1. 기술/구조

* 웹 표준
    * `HTML5`
    * `CSS3`
    * `JavaScript`
    * `jQuery`
* Tomcat v9.0 사용
* DBMS - `Oracle 11g`
* SPRING Framework
* `JSP`, `EL`
* `MyBatis`
* Api 사용
    * `jQuery`, `aJax`, `JSON` 파싱
* `SPRING MVC 구조`
* `RESTful Api 구조`
    * 서버 <--> 클라이언트 통신을 위한 REST 인터페이스 구현


------------


#### 2. 구현 중 겪었던 어려움 

* 효율적인 프로젝트 구조 고민

* DB 테이블 관계설정 미숙으로 인한 DB 수정

* 각자 기능 구현한 프로젝트를 합칠 때   
  코드 결합 시 발생하는 세부적인 오류(예- 설정파일 ignore하지 않아 결합시 conflict 발생, 데이터 속성명 불일치) 등
  >>> .ignore file을 생성하여 해결
  
* session 다루는데 어려움을 느낌
  세션의 사용 방법등을 완벽히 파악하지 못해 set, get 등 controller나 jsp 등에서 활용하는데 어려움을 겪음
  >>> google, okky 등 다른 개발자들의 코드등을 찾아보며 활용 방법 이해
  
* 체계적인 설계가 되지 않아 많은 시간 소요


------------

#### 4. 프로젝트 설명 PPT 

* 프로젝트 설계
* 각 기능 설명   
* 팀원 역할  
* PPT 보기 [Link](https://docs.google.com/presentation/d/1X_pm5qu2KIjSAaNNoROyh0tZw7PlQ_8B8T9M9vID6KE/edit?usp=sharing)
