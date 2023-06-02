import prompt from '@ohos.prompt';
import hello from 'libhello.so'

@Entry
@Component
struct Pageindex {
  @State title: string = 'Page Ability'
  @State message: string = '这是page ability页面'

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
          Text('napi 测试')
            .fontSize(40)
            .fontWeight(FontWeight.Bold)
        }
        .type(ButtonType.Capsule)
        .margin(20)
        .width('80%')
        .height(100)
        .onClick(()=>{
          prompt.showToast({
            message: hello.hello(),
            duration: 2000,
            bottom: 100
          })
        })
        Button() {
          Text('返回main ability')
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
            "abilityName": "MainAbility",
            "parameters": {
              url: 'pages/main'
            }
          }
          globalThis.abilityContext.startAbility(str)
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}