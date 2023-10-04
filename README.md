# BlueWave
![로고 시안_추](https://github.com/2305PublicDataWebApp/BlueWave/assets/134674375/d3d48c19-a5c2-41e0-8a39-ed69ddccf517)

# 목차
* [프로젝트 소개](#프로젝트-소개)
* [개발 기간](#개발-기간)
* [팀원 소개](#팀원-소개)
* [개발 환경](#개발-환경)
* [기술 스택](#기술-스택)
* [주요 기능 및 상세](#주요-기능-및-상세)
  + 회원 관리
  + 챌린지 게시판
  + 팁공유 게시판
  + 마이 페이지
  + 굿즈 페이지
  + 관리자 페이지
* [실행 화면](#실행-화면)

# 프로젝트 소개
블루웨이브는 환경 보호에 관심 있는 사람들이 모여 서로의 환경 보호 의식을 높이고, 친환경 행동을 촉진하여 지속 가능한 삶을 증진하기 위한 웹사이트이다

# 개발 기간
```
2023-09-01 ~ 2023-09-23
```

# 팀원 소개 
![팀원소개](https://github.com/2305PublicDataWebApp/BlueWave/assets/134674375/d39514a6-8965-43a4-89ba-3209b822365a)

# 개발 환경 
<img src="https://img.shields.io/badge/Eclipse IDE-2C2255?style=for-the-badge&logo=Eclipse IDE&logoColor=white"> <img src="https://img.shields.io/badge/Apache Tomcat-F8DC75?style=for-the-badge&logo=Apache Tomcat&logoColor=white"> <img src="https://img.shields.io/badge/VISUAL STUDIO CODE-1572B6?style=for-the-badge&logo=VISUAL STUDICODE&logoColor=white"> <img src="https://img.shields.io/badge/GITHUB-2C2255?style=for-the-badge&logo=GITHUB&logoColor=white">

# 사용언어
<img src="https://img.shields.io/badge/java-2C2255?style=for-the-badge&logo=java&logoColor=white"> <img src="https://img.shields.io/badge/HTML5-E34F26?style=for-the-badge&logo=HTML5&logoColor=white"> <img src="https://img.shields.io/badge/jQuery-0769AD?style=for-the-badge&logo=jQuery&logoColor=white"> <img src="https://img.shields.io/badge/JavaScript-F7DF1E?style=for-the-badge&logo=JavaScript&logoColor=white"> <img src="https://img.shields.io/badge/CSS-1572B6?style=for-the-badge&logo=CSS&logoColor=white"> <img src="https://img.shields.io/badge/JSTL-E34F26?style=for-the-badge&logo=JSTL&logoColor=white">

# 기술 스택
<img src="https://img.shields.io/badge/spring-6DB33F?style=for-the-badge&logo=spring&logoColor=white"> <img src="https://img.shields.io/badge/Oracle-F80000?style=for-the-badge&logo=Oracle&logoColor=white"> <img src="https://img.shields.io/badge/Apache Maven-C71A36?style=for-the-badge&logo=Apache Maven&logoColor=white"> <img src="https://img.shields.io/badge/mybatis-2C2255?style=for-the-badge&logo=mybatis&logoColor=white">

# 주요 기능 및 상세
### 1. 회원 관리
|기능|내용|
|:---:|:---:| 
|회원가입|일반회원은 기본적인 정보(아이디, 비밀번호, 이름, 닉네임, 이메일, 휴대폰번호, 주소)를 입력하여 회원가입을 진행합니다. 각 입력 정보마다 유효성 검사를 한 뒤 회원가입이 가능합니다.|
|마이페이지|일반회원은 가입했던 정보와 자신이 참여한 챌린지, 좋아요한 챌린지를 볼 수 있고, 관리자는 모든 게시물 조회가 가능합니다.|

### 2. 챌린지 게시판
|기능|내용|
|:---:|:---:| 
|블루웨이브 챌린지|관리자는 챌린지 페이지에서 블루웨이브 챌린지를 생성, 수정, 삭제할 수 있습니다.|
|개인 챌린지|회원은 챌린지 페이지에서 개인 챌린지를 생성, 수정, 삭제할 수 있습니다.|
|모든 챌린지 리스트 조회|회원은 개인 챌린지 중 공개로 표시 된 게시물과 관리자가 제공하는 블루웨이브 챌린지를 리스트로 확인할 수 있습니다.|
|챌린지 게시물 조회|회원은 챌린지 페이지에서 공개로 표시된 개인 챌린지 게시물과 관리자가 제공하는 블루웨이브 챌린지의 게시물을 누르면 해당 챌린지를 실천하고 있는 회원들의 게시물을 확인할 수 있습니다.|
|챌린지 게시물 등록|회원은 참여하고자 하는 챌린지에 제목, 내용, 첨부파일을 입력하여 게시물 등록을 할 수 있습니다. 게시물이 등록되면 포인트 100p가 적립됩니다. |
|챌린지 게시물 수정|회원은 참여하는 챌린지의 본인이 작성한 게시물에 제목, 내용, 첨부파일을 수정할 수 있습니다.|
|챌린지 게시물 삭제|회원은 참여하는 챌린지의 본인이 작성한 게시물을 삭제할 수 있습니다.|
|게시물 좋아요 기능|회원은 다른 회원이 작성한 게시물의 세부정보에서 좋아요를 누르고 해제할 수 있습니다.|
|회원 페이지로 이동 기능|회원은 다른 회원이 작성한 게시물의 세부정보에서 회원의 닉네임을 클릭 해 회원 마이페이지로 이동 후, 세부정보를 볼 수 있습니다. |
|챌린지 명 검색 기능|회원은 검색창에 챌린지 명을 검색하여 다른 회원이 생성한 챌린지 명을 검색할 수 있다.|

### 3. 팁공유 게시판
|기능|내용|
|:---:|:---:| 
|팁 공유 게시판 조회|회원, 관리자는 팁공유 게시판을 조회 할 수 있습니다.|
|게시물 등록, 수정, 삭제|회원, 관리자는 팁공유 게시물을 작성할 수 있고, 회원은 본인이 작성한 게시물만 수정, 삭제할 수 있다. 관리자는 모든 게시물에대한 수정, 삭제 권한이 있다.|
|페이징|한 페이지당 10개의 게시물을 보여주도록 처리했습니다.|

### 4. 마이페이지
|기능|내용|
|:---:|:---:| 
|내 정보 조회|회원이 가입한 정보를 볼 수 있고 수정과 탈퇴가 가능합니다.|
|굿즈 교환 내역 조회|굿즈페이지에서 교환한 상품의 조회가 가능합니다.|
|오늘의 챌린지 조회|회원은 마감기한이 임박한 순으로 자신이 참여하고 있는 챌린지를 5개 조회할 수 있습니다.|
|파란물결 조회|회원은 본인의 활동을 달력형으로 나타내는 '파란 물결'을 조회할 수 있습니다.|
|팔로잉|회원은 타회원을 팔로우/팔로우취소할 수 있으며 팔로잉/팔로워 수와 해당 회원을 조회할 수 있습니다.|
|뱃지|회원은 참여중인 챌린지 갯수(공식/개인), 달성한 챌린지 갯수(공식/개인), 작성한 게시물 갯수, 포인트를 확인할 수 있습니다.|
|회원관리|회원은 이름, 이메일을 입력하여 아이디를 찾을 수 있습니다. 회원은 이름, 이메일을 입력하여 랜덤비밀번호를 받을 수 있습니다.|
|블루웨이브 챌린지 조회|회원은 마이페이지에서 자신이 참여한 블루웨이브 챌린지 정보(기한, 대표 이미지, 이름, 방법 설명, 참여 인원 수, 좋아요 전체 갯수, 진행률 및 완료 여부, 인증 횟수가 포함된다)를 조회할 수 있고, 해당 챌린지에 대한 자신의 인증 게시물을 모아볼 수 있는 페이지로 이동할 수 있다.|
|개인 챌린지 조회|회원은 마이페이지에서 자신이 생성한 개인 챌린지 정보(기한, 대표 이미지, 공개 여부, 이름, 방법 설명, 좋아요 전체 갯수, 진행률 및 완료 여부, 인증 횟수, 수정, 삭제가 포함된다.)를 조회할 수 있고, 해당 챌린지에 대한 자신의 인증 게시물을 모아볼 수 있는 페이지로 이동할 수 있다.|
|개인 챌린지 수정|회원은 마이페이지에서 자신이 생성한 개인 챌린지 정보를 수정할 수 있다.|
|개인 챌린지 삭제|회원은 마이페이지에서 자신이 생성한 개인 챌린지 정보를 삭제할 수 있다.|
|좋아요 게시물 리스트 조회|회원은 자신이 좋아요를 누른 게시물을 리스트로 조회할 수 있다.|

### 5. 굿즈 페이지
|기능|내용|
|:---:|:---:| 
|모든 리스트 조|관리자는 회원들의 정보 리스트, 챌린지명 리스트, 굿즈 상품 리스트를 관리자페이지에서 조회할 수 있다.|
|모든 정보 수정|관리자는 회원 리스트, 팁공유 게시판 리스트, 챌린지명 리스트, 굿즈 리스트를 선택하여 조회 후 정보를 수정할 수 있다.|
|모든 정보 삭제|관리자는 회원 리스트, 팁공유 게시판 리스트, 챌린지명 리스트, 굿즈 리스트를 선택하여 조회 후 정보를 삭제할 수 있다.|
|굿즈 등록|관리자는 굿즈 리스트를 선택하여 굿즈 리스트를 조회 후 상품을 등록할 수 있다.|

### 6. 관리자 페이지
|기능|내용|
|:---:|:---:| 
|모든 리스트 조|관리자는 회원들의 정보 리스트, 챌린지명 리스트, 굿즈 상품 리스트를 관리자페이지에서 조회할 수 있다.|
|모든 정보 수정|관리자는 회원 리스트, 팁공유 게시판 리스트, 챌린지명 리스트, 굿즈 리스트를 선택하여 조회 후 정보를 수정할 수 있다.|
|모든 정보 삭제|관리자는 회원 리스트, 팁공유 게시판 리스트, 챌린지명 리스트, 굿즈 리스트를 선택하여 조회 후 정보를 삭제할 수 있다.|
|굿즈 등록|관리자는 굿즈 리스트를 선택하여 굿즈 리스트를 조회 후 상품을 등록할 수 있다.|

# 실행 화면
### 1. 메인화면
![main1](https://github.com/2305PublicDataWebApp/BlueWave/assets/134674322/72a4e63e-6946-4a89-9c64-878adf490055)
![main2](https://github.com/2305PublicDataWebApp/BlueWave/assets/134674322/e3c25ad2-6e43-413a-b3a3-71daf4f0229d)
![main3](https://github.com/2305PublicDataWebApp/BlueWave/assets/134674322/efd8e12d-3eb7-43e7-aaa7-d8f67dff78d6)

### 2. 로그인
2_1 로그인
![화면 캡처 2023-10-04 181519](https://github.com/2305PublicDataWebApp/BlueWave/assets/134674375/0d6a9ec1-1ff0-4c9e-94ba-7eac77ff7eba)

2_2 회원가입
![화면 캡처 2023-10-04 181452](https://github.com/2305PublicDataWebApp/BlueWave/assets/134674375/79d253f6-c7a6-4c42-9f0e-139a060a30c8)

2_3 아이디 찾기
![화면 캡처 2023-10-04 181834](https://github.com/2305PublicDataWebApp/BlueWave/assets/134674375/a5234385-9c1a-4050-a962-3d1226b5d772)
![화면 캡처 2023-10-04 181900](https://github.com/2305PublicDataWebApp/BlueWave/assets/134674375/c6d1220d-aab2-4c68-91a8-9cb70d8a3de9)

2_4 비밀번호 찾기
![화면 캡처 2023-10-04 181906](https://github.com/2305PublicDataWebApp/BlueWave/assets/134674375/c1dbe05c-9922-437c-9da5-18481216a2cb)
![화면 캡처 2023-10-04 181919](https://github.com/2305PublicDataWebApp/BlueWave/assets/134674375/8bd58df5-5bc6-48c8-ae39-250aba2f4e74)
![화면 캡처 2023-10-04 181932](https://github.com/2305PublicDataWebApp/BlueWave/assets/134674375/3ff3ade0-7a3f-4989-a5b0-5f806fcc3666)

### 3. 마이페이지
![화면 캡처 2023-10-04 181530](https://github.com/2305PublicDataWebApp/BlueWave/assets/134674375/6ed2d43e-5da7-42bc-ae3a-ec5a876de85c)
![화면 캡처 2023-10-04 181550](https://github.com/2305PublicDataWebApp/BlueWave/assets/134674375/fc9bb57b-d511-4afc-8845-058dd0e9c4eb)
![1_마이페이지_블루웨이브챌린지](https://github.com/2305PublicDataWebApp/BlueWave/assets/134674257/89a434cf-87dd-408e-b366-25b05b5c9736)
![2_마이페이지_나의챌린지](https://github.com/2305PublicDataWebApp/BlueWave/assets/134674257/f39a2cfe-50f0-4a66-8139-7b3c38c1929b)
![3_마이페이지_좋아요](https://github.com/2305PublicDataWebApp/BlueWave/assets/134674257/f522a49b-f7fb-4279-b85c-615664ad07be)

3_1 팔로우
![화면 캡처 2023-10-04 181441](https://github.com/2305PublicDataWebApp/BlueWave/assets/134674375/3e63f1ba-e4d8-4a50-8c47-286542ad68cd)
![화면 캡처 2023-10-04 181343](https://github.com/2305PublicDataWebApp/BlueWave/assets/134674375/d769264e-b8d7-408a-b9b2-0da62320a6c2)
![화면 캡처 2023-10-04 181432](https://github.com/2305PublicDataWebApp/BlueWave/assets/134674375/bd1c2cb3-9877-4225-9263-ab9ea41a4cd9)

### 4. 챌린지 게시판
4_1 챌린지명
![챌린지 페이지1](https://github.com/2305PublicDataWebApp/BlueWave/assets/134674191/b1194017-bf73-4a85-8668-39fdc60a0b8e)
![챌린지 페이지2](https://github.com/2305PublicDataWebApp/BlueWave/assets/134674191/47b8aa9a-4a64-423b-91fb-82437882946e)
![1_챌린지생성](https://github.com/2305PublicDataWebApp/BlueWave/assets/134674257/f37a0939-e056-4c31-b4cf-728de9ffe29d)
![2_챌린지수정](https://github.com/2305PublicDataWebApp/BlueWave/assets/134674257/86fe91e0-fc35-497f-9460-68039c66fc54)
![3_챌린지삭제](https://github.com/2305PublicDataWebApp/BlueWave/assets/134674257/13ca26c3-01f8-4896-a70a-c60f27be8afb)
![챌린지 명 세부정보 페이지](https://github.com/2305PublicDataWebApp/BlueWave/assets/134674191/e34e0bcc-2807-4097-84fc-55d1caf04229)
![챌린지 명 검색 페이지](https://github.com/2305PublicDataWebApp/BlueWave/assets/134674191/c8e715dc-50d0-40db-9dc4-c4765b4b81a3)

4_2 챌린지 게시물
![챌린지 게시물 작성 페이지](https://github.com/2305PublicDataWebApp/BlueWave/assets/134674191/ecc9ca2c-8afa-4b31-bdf6-668cecd3a40d)
![챌린지 게시물 수정 페이지](https://github.com/2305PublicDataWebApp/BlueWave/assets/134674191/91802bb7-db68-44ea-8823-d16897aa3f14)
![챌린지 게시물 세부 정보 페이지](https://github.com/2305PublicDataWebApp/BlueWave/assets/134674191/a057157a-e74d-4677-b772-571744948896)
![챌린지 게시물 본인 좋아요 유효성 체크](https://github.com/2305PublicDataWebApp/BlueWave/assets/134674191/8e33cff8-89d3-4933-82d1-32c07fd6638e)

### 5. 팁공유 게시판
![tip1](https://github.com/2305PublicDataWebApp/BlueWave/assets/134674322/746acaa9-0561-4298-86d8-edb89e566849)
![tip2](https://github.com/2305PublicDataWebApp/BlueWave/assets/134674322/0d15c3c5-cde1-4a38-8ef0-f347cb735476)

### 6. 공지 게시판
![공지게시물리스트](https://github.com/2305PublicDataWebApp/BlueWave/assets/134674375/11bcf234-03f8-4160-bfe4-7d38f4451a0d)
![공지게시물상세](https://github.com/2305PublicDataWebApp/BlueWave/assets/134674375/bffed6a0-2982-4ea9-9cb4-e4aadc3bd708)
![공지게시물작성](https://github.com/2305PublicDataWebApp/BlueWave/assets/134674375/99d10aa1-52e0-4f52-8694-2b25d924ae29)
![공지게시물수정](https://github.com/2305PublicDataWebApp/BlueWave/assets/134674375/a5fe5b84-0f20-4706-b20e-e127d9830241)

### 7. 굿즈 페이지
![goods1](https://github.com/2305PublicDataWebApp/BlueWave/assets/134674322/e54b925f-3688-44aa-a041-c9d5840b4ad1)
![goods2](https://github.com/2305PublicDataWebApp/BlueWave/assets/134674322/380e8ae5-008a-40b7-a62b-3b7e743e9ed6)

### 8. 관리자 페이지
![공지리스트](https://github.com/2305PublicDataWebApp/BlueWave/assets/134674375/8d6daf39-62fe-44e9-8436-ffbfaf99ce49)
![챌린지리스트](https://github.com/2305PublicDataWebApp/BlueWave/assets/134674375/f50eb05a-cbc7-4d5f-aa59-6fc7b0f3d612)
![회원리스트](https://github.com/2305PublicDataWebApp/BlueWave/assets/134674375/8c490bf9-bfe9-430d-87c5-76eb2d2b12c2)
![굿즈리스트](https://github.com/2305PublicDataWebApp/BlueWave/assets/134674375/9cbb4a15-5f40-4bd7-8f93-ab0dabcd1cce)
![팁공유리스트](https://github.com/2305PublicDataWebApp/BlueWave/assets/134674375/59655011-bed0-43d2-92ab-388a015b9f9c)

