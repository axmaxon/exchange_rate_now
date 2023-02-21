import consumer from "../../frontend/channels/consumer"

consumer.subscriptions.create("ExchangeRateChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
    console.log('Налажено соединение с сервером')
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
    console.log('Отключено соединение с сервером')
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    console.log('Получены данные: ' + data.rate )

    if (data.rate) {
      document.getElementById('exchange-rate').innerHTML = data.rate;

    }
  }
});
