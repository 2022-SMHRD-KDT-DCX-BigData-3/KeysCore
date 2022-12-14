//음성막대 만들기


const makeBar = () => {
   let barText;
   for(let i = 1; i<=17; i++){
      barText += `<li id="bar${i}"></li>`
   }
   return barText;
}


const originalJS = () => {
//STT API 불러오기

const synth = window.speechSynthesis;

/**
 * 
 */
//TTS API 불러오기 
const audios = new Audio();

 AWS.config.region = 'ap-northeast-1';
        AWS.config.credentials = new AWS.CognitoIdentityCredentials({
            IdentityPoolId: 'ap-northeast-1:09e0dd25-5506-41c1-9ecd-c427f1320d9f',
        });
        
        function speakText(Text) {
            // Create the JSON parameters for getSynthesizeSpeechUrl
            var speechParams = {
                OutputFormat: "mp3",
                SampleRate: "16000",
                Text ,
                TextType: "text",
                VoiceId: "Seoyeon",

            };

            // Create the Polly service object and presigner object
            var polly = new AWS.Polly({ apiVersion: '2016-06-10' });
            var signer = new AWS.Polly.Presigner(speechParams, polly)

            // Create presigned URL of synthesized speech file
            signer.getSynthesizeSpeechUrl(speechParams, function (error, url) {
                if (error) {
                    document.getElementById('result').innerHTML = error;
                } else {
                    audios.src = url;
                    audios.play();
                }
            });
        }

//TTS API불러오기 끝






const audio = new Audio('js/startVoice.mp3');


// index 화면
// speech api 불러오기

window.SpeechRecognition = window.SpeechRecognition || window.webkitSpeechRecognition;
//speech api 초기 설정
const h_speech = new SpeechRecognition();
h_speech.interimResults = true;
h_speech.continuous = true;
h_speech.lang = "ko-KR";
//서버 시작 시 바로 speech api 시작
h_speech.start();
let man = 0;
let woman = 0;
//speech transcript 초기화 함수
const restart = () => {
   h_speech.abort();
   setTimeout(() => h_speech.start(), 1000);
}
const startButton = document.getElementById("start-button");
const stopButton = document.getElementById("stop-button");
const bars = document.querySelectorAll("[id^=bar]");


bars.forEach(function(bar) {
   bar.style.animationPlayState = "paused";
});




//request 보낼 form태그 생성
let formTag = document.createElement("form");



//하이키코를 불렀을 경우 starting을 true로 바꿔서 인삿말 출력
//ordering을 true로 바꿔서 주문모드로 진입
let starting = false;
let ordering = false;

//formTag 생성 및 이동할 url 설정
const goMainMenu = () => {
   document.getElementById("formContainer").appendChild(formTag);
   formTag.action = "/1"

   if (man > woman) {

      formTag.innerHTML = `<input name='menu_gender' type="text" value="0" />`
   } else {
      formTag.innerHTML = `<input name='menu_gender' type="text" value="1" />`

   }
   formTag.method = "get";

   formTag.submit();
   restart();

}

const orderComplete = () => {
   formTag.method = "post";
   formTag.action = "/menu";


   formTag.submit();
   restart();
}

const goIndex = () => {
   formTag.action = "/";
   formTag.method = "get";
   setTimeout(() => formTag.submit(), 500);
   starting = false;
   order = false;
   restart();
}


//speech api로 받은 transcript 로직처리
h_speech.onresult = function(e) {

   //transcript 값들 join으로 하나의 문장으로 바꿔주기

   let h_text = Array.from(e.results).map(result => result[0].transcript).join("");

   console.log(h_text)
   //main_menu request 함수
   init();

   //하이 키코 라는 단어가 존재하지 않아 하이코 or 하이킥으로 인식함으로 하이코 및 하이킥으로 인식 처리
   if (!starting) {
      console.log(starting)
      if (h_text.indexOf("하이코") !== -1 || h_text.indexOf("하이킥") !== -1 ||  h_text.indexOf("아이쿠") !== -1) {
         speakText("어서오세요 하이키코입니다. 메인메뉴로 가고 싶으시면 '메인메뉴 보여줘' 이라고 말씀해주세요.")
         bars.forEach(function(bar) {
            bar.style.animationPlayState = "running";
         });
         starting = true;
         

         
         setTimeout(() => {
            console.log("timer가 실행되었습니다.");
            timer();
         }, 1000);

         h_speech.interimResults = true;
         //하이 키코가 인식되면 transcript 초기화
         man = 0;
         woman = 0;
         h_speech.abosrt();
         setTimeout(()=>{h_speech.start()
         man = 0;
         woman = 0;
         }, 4000);
         h_speech.interimResults = false;

      }
   } else {
      if (h_text.indexOf("메인 메뉴") !== -1 || h_text.indexOf("메인메뉴") !== -1) {
         goMainMenu();
      }

      // if (h_text.indexOf("메뉴") !== -1) {
      //    console.log("네~");
      //    h_speech.onend;
      //    speech.start();
      // }
      if (h_text.indexOf("메인 화면") !== -1 || h_text.indexOf("메인화면") !== -1) {
         location.href = "http://127.0.0.1:5500/src/main/webapp/index.html";
      }
   }


};



//남녀 목소리 구분 api


// more documentation available at
// https://github.com/tensorflow/tfjs-models/tree/master/speech-commands

// the link to your model provided by Teachable Machine export panel
const URL = "https://teachablemachine.withgoogle.com/models/_FOcslroz/";

async function createModel() {
   const checkpointURL = URL + "model.json"; // model topology
   const metadataURL = URL + "metadata.json"; // model metadata

   const recognizer = speechCommands.create(
      "BROWSER_FFT", // fourier transform type, not useful to change
      undefined, // speech commands vocabulary feature, not useful for your models
      checkpointURL,
      metadataURL);

   // check that model and metadata are loaded via HTTPS requests.
   await recognizer.ensureModelLoaded();

   return recognizer;
}
console.log(man + "입니다.")

function timer() {

   let time = setInterval(() => {
      if (status == "남자") {
         man++;
         console.log("남자 : " + man);
      } else if (status == "여자") {
         woman++;
         console.log("여자 : " + woman);
      }


      /* if(man > woman){
           document.getElementById('gender').innerHTML = "입력된 목소리는 남자입니다."
        } else{
           document.getElementById('gender').innerHTML = "입력된 목소리는 여자입니다."
        } */
   }, 500)
}

async function init() {
   const recognizer = await createModel();
   const classLabels = recognizer.wordLabels(); // get class labels



   //현재 음성을 남자인지 여자인지 체크할 변수 하나 생성
   let gender = "배경 소음";



   // listen() takes two arguments:
   // 1. A callback function that is invoked anytime a word is recognized.
   // 2. A configuration object with adjustable fields

   recognizer.listen(result => {
      const scores = result.scores; // probability of prediction for each class




      //현재 분류한 데이터가 남자인지 여자인지 체크 (1은)
      if (0.5 <= result.scores[0]) { //score 값이 0.8 이상인 값의
         status = classLabels[0]; //class 이름(남자 or 여자) 가져오기
      } else if (0.5 <= result.scores[1]) {
         status = classLabels[1];
      } else if (0.5 <= result.scores[2]) {
         status = classLabels[2];
      }




   }, {
      includeSpectrogram: true, // in case listen should return result.spectrogram
      probabilityThreshold: 0.75,
      invokeCallbackOnNoiseAndUnknown: true,
      overlapFactor: 0.0 // probably want between 0.5 and 0.75. More info in README
   });

   // Stop the recognition in 5 seconds.
   // setTimeout(() => recognizer.stopListening(), 5000);
}



}

originalJS();
