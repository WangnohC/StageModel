import router from '@ohos.router'

@Entry
@Component
struct Main {
  @State title: string = 'Main Ability'
  @State message: string = '这是main页面'

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
          Text('进入page ability测试页面')
            .fontSize(40)
            .fontWeight(FontWeight.Bold)
        }
        .type(ButtonType.Capsule)
        .margin(20)
        .width('80%')
        .height(100)
        .onClick(()=>{
          router.replace({
            url: 'pages/page'
          })
        })
        Button() {
          Text('进入common event测试页面')
            .fontSize(40)
            .fontWeight(FontWeight.Bold)
        }
        .type(ButtonType.Capsule)
        .margin(20)
        .width('80%')
        .height(100)
        .onClick(()=>{
          router.replace({
            url: 'pages/commonevent'
          })
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}