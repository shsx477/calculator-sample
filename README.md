# calculator-sample

수정중...

### KeyPadView.swift
> * 키패드View를 코드로 작성   
> * 2차원 배열로 정보를 입력받아 키패드를 생성 (2x2이상 가능)   
> * AutoLayout 사용   
> * 터치된 정보를 전달하기 위해 delegate 사용   

### CalculationManager.swift
> * 계산로직 처리
> * operator를 closure형태로 저장
> * 재사용성, 확장성 고려하여 작성

### Const.swift
> * 상수 모음

### ViewController.swift
> * KeyPadView, CalculationManager 생성
> * display label 업데이트

### Calculator_1Tests.swift
> * unit test 작성
> * 테스트 실행: Product> Test 실행 (cmd + U)
> * 테스트 코드 작성시 자신의 코드에 맞게 작성
