import commonEvent from '@ohos.commonEvent'
import prompt from '@ohos.prompt'

const EVENT = "common event";
//要订阅的公共事件相关信息
const COMMON_EVENT_SUBSCRIBE_INFO = {
  events: [EVENT]
};
//要发布的公共事件相关信息
const COMMON_EVENT_PUBLISH_DATA = {
  code: 1,
  data: "information_data",
  isOrdered: false
};

//用于保存创建成功的订阅者对象，后续使用其完成订阅及退订的动作
var commonEventSubscriber;

//订阅公共事件回调
function subscribeCallback(err, data) {
  console.info("subscribe callback data = " + JSON.stringify(data));
}

//创建订阅者回调
function createSubscriberCallback(err, data) {
  commonEventSubscriber = data;
  //订阅公共事件
  commonEvent.subscribe(commonEventSubscriber, subscribeCallback);
  prompt.showToast({
    message: "create subscriber successfully",
    duration: 2000,
    bottom: 100
  });
}

//发布公共事件回调
function publishCallback(err) {
  prompt.showToast({
    message: "publish successfully",
    duration: 2000,
    bottom: 100
  });
}

@Entry
@Component
struct Commoneventindex {
  @State title: string = 'Common Event'
  @State message: string = '这是common event页面'

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
          Text('创建订阅者')
            .fontSize(40)
            .fontWeight(FontWeight.Bold)
        }
        .type(ButtonType.Capsule)
        .margin(20)
        .width('80%')
        .height(100)
        .onClick(()=>{
          commonEvent.createSubscriber(COMMON_EVENT_SUBSCRIBE_INFO, createSubscriberCallback)
        })
        Button() {
          Text('发布公共事件')
            .fontSize(40)
            .fontWeight(FontWeight.Bold)
        }
        .type(ButtonType.Capsule)
        .margin(20)
        .width('80%')
        .height(100)
        .onClick(()=>{
          commonEvent.publish(EVENT, COMMON_EVENT_PUBLISH_DATA, publishCallback)
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