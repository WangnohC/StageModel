import router from '@ohos.router'

@Entry
@Component
struct Commonevent {
  @State title: string = 'Main Ability'
  @State message: string = '这是common event测试页面'

  build() {
    Row() {
      Column() {
        Text(this.title)
          .fontSize(60)
          .fontWeight(FontWeight.Bold)
          .margin(30)
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
          .margin(30)
        Button() {
          Text('跳转至common event')
            .fontSize(40)
            .fontWeight(FontWeight.Bold)
        }
        .type(ButtonType.Capsule)
        .margin(20)
        .width('80%')
        .height(100)
        .onClick(()=>{
          let str = {
            "bundleName": "com.oh.demo.stage",
            "abilityName": "CommonEvent",
            "parameters": {
              url: 'pages/commoneventindex'
            }
          }
          globalThis.abilityContext.startAbility(str)
        })
        Button() {
          Text('返回main页面')
            .fontSize(40)
            .fontWeight(FontWeight.Bold)
        }
        .type(ButtonType.Capsule)
        .margin(20)
        .width('80%')
        .height(100)
        .onClick(()=>{
          router.replace({
            url: 'pages/main'
          })
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}