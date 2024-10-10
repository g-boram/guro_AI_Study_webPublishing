// 현재시간을 보여줄 영역 ↓
const currentTimeElem = document.getElementById("currentTime");
// 종료시간을 입력받을 input ↓
const endTimeInput = document.getElementById("endTime");
// 종료시간 input 옆 확인 버튼 ↓
const setTimeButton = document.getElementById("setTimeButton");
// 설정된 종료시간을 나타낼 영역 ↓
const setEndTimeElem = document.getElementById("setEndTime");
// 남은시간 카운트를 보여줄 영역 ↓
const countdownElem = document.getElementById("countdown");
// 카운트 시작 버튼 ↓
const startButton = document.getElementById("startButton");
// 카운트 중지 버튼 ↓
const stopButton = document.getElementById("stopButton");
// 종료시간 리셋 버튼 ↓
const resetButton = document.getElementById("resetButton");

let countdownInterval;
let endTime;

// 1. 현재 시간을 실시간으로 타이머
function updateCurrentTime() {
  const now = new Date();
  currentTimeElem.textContent = now.toLocaleTimeString();
}
// 1-1. 현재 시간 실시간 업데이트
setInterval(updateCurrentTime, 1000);

// 2. 카운트 시작 버튼을 누를경우 타이머 카운트 다운 시작
//    & 버튼 disabled 값 처리
startButton.addEventListener("click", () => {
  countdownInterval = setInterval(startCountdown, 1000);
  startButton.disabled = true;
  stopButton.disabled = false;
});

// 2-1. 타이머 카운트 다운을 보여주기 위한 시간값 가공
function startCountdown() {
  const end = new Date(endTime);
  const now = new Date();
  const timeDiff = end - now;

  if (timeDiff <= 0) {
    clearInterval(countdownInterval);
    alert("시간종료!!");
    return;
  }

  const hours = Math.floor(timeDiff / (1000 * 60 * 60));
  const minutes = Math.floor((timeDiff % (1000 * 60 * 60)) / (1000 * 60));
  const seconds = Math.floor((timeDiff % (1000 * 60)) / 1000);

  countdownElem.textContent = `${String(hours).padStart(2, "0")}:${String(minutes).padStart(2, "0")}:${String(
    seconds
  ).padStart(2, "0")}`;
}

// 3. 설정된 종료시간 설정 (확인 버튼을 눌렀을 경우 종료시간 영역에 값 넣기)
setTimeButton.addEventListener("click", () => {
  const inputTime = endTimeInput.value; // 24시간 형식의 시간 입력값 (HH:mm)

  // 빈값일 경우
  if (!inputTime) {
    alert("시간을 입력해주세요");
    endTimeInput.value = "";
    return;
  }
  // : 기준으로 나눈 후 구조분해할당으로 변수이름 동시 선언
  const [hours, minutes] = inputTime.split(":").map(Number);

  // AM/PM 계산
  let period = "AM";
  let adjustedHours = hours;

  if (hours >= 12) {
    period = "PM";
    if (hours > 12) {
      adjustedHours = hours - 12; // 13~23시는 12를 빼서 12시간 형식으로 변환
    }
  } else if (hours === 0) {
    adjustedHours = 12; // 0시는 12 AM으로 변환
  }

  // 변환된 12시간 형식 시간 및 AM/PM 표시
  const displayTime = `${String(adjustedHours).padStart(2, "0")}:${String(minutes).padStart(2, "0")} ${period}`;

  // 입력한 시간을 24시간 형식으로 변환
  let convertedHours = hours;
  if (period === "PM" && hours < 12) {
    convertedHours += 12; // PM인 경우, 12를 더하여 24시간 형식으로 변환
  } else if (period === "AM" && hours === 12) {
    convertedHours = 0; // AM인 경우, 12시는 0으로 변환 (자정)
  }

  // 현재 시간과 비교하기 위해 selectedTime의 날짜를 현재 날짜로 맞춤
  const current = new Date();
  const selectedTime = new Date();
  selectedTime.setFullYear(current.getFullYear(), current.getMonth(), current.getDate()); // 현재 날짜로 설정
  selectedTime.setHours(convertedHours, minutes, 0, 0); // 변환된 24시간 형식 시간으로 설정

  // 비교: 입력한 시간이 현재 시간 이후인지 확인
  if (selectedTime > current) {
    endTime = selectedTime; // 카운트다운에 사용할 종료 시간 설정
    setEndTimeElem.textContent = displayTime; // 12시간 형식으로 화면에 출력
    startButton.disabled = false;
  } else {
    alert("현재 시간 이후를 설정해주세요");
    endTimeInput.value = "";
  }
});

// 4. 카운트 멈추기 버튼
stopButton.addEventListener("click", () => {
  clearInterval(countdownInterval);
  stopButton.disabled = true;
  startButton.disabled = false;
});

// 5-1. 설정된 타이머 값 리셋
function reset() {
  clearInterval(countdownInterval);
  countdownElem.textContent = "--:--:--";
  setEndTimeElem.textContent = "--:--:--";
  startButton.disabled = true;
  stopButton.disabled = true;
  endTimeInput.value = "";
}
// 5. 리셋 버튼 클릭시 함수 실행
resetButton.addEventListener("click", reset);
