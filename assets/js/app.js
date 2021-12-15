import "phoenix_html";
import socket from "./socket";
import { NEW_MESSAGE, RECEIVED_MESSAGE } from "./constants";
import "../css/app.scss";

console.log(socket.isConnected());

const rootMessagesDiv = document.getElementById("messages");
const form = document.querySelector(".send_message");

rootMessagesDiv.scrollTo(0, rootMessagesDiv.scrollHeight);

const channel = socket.channel("chat:lobby", {});
channel
  .join()
  .receive("ok", (resp) => {
    console.log("Joined successfully", resp);
  })
  .receive("error", (resp) => {
    console.log("Unable to join", resp);
  });

form.addEventListener("submit", (e) => {
  e.preventDefault();

  const nickname = document.getElementById("nickname").value;
  const message = document.getElementById("message").value;

  if (!(nickname && message)) return alert("Invalid message.");

  channel.push(NEW_MESSAGE, { nickname, message });
});

channel.on(RECEIVED_MESSAGE, ({ nickname, message }) => {
  const msg = document.createElement("p");

  msg.innerText = `${nickname}: ${message}`;

  rootMessagesDiv.appendChild(msg);
  rootMessagesDiv.scrollTo(0, rootMessagesDiv.scrollHeight);
});
