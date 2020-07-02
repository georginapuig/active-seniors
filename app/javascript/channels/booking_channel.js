import consumer from "./consumer";

const initBookingCable = () => {
  console.log('subscriber initialized');
  const messagesContainer = document.getElementById('messages');

  if (messagesContainer) {
    const id = messagesContainer.dataset.bookingId;

    consumer.subscriptions.create({ channel: "BookingChannel", id: id }, {
      received(data) {
        console.log(data); // called when data is broadcast in the cable
        messagesContainer.insertAdjacentHTML('beforeend', data);
      },
    });
  }
};

export { initBookingCable };