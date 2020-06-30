import "jquery-bar-rating";

const initStarRating = () => {
  $('#review_rating').barrating({
    theme: 'font-awesome'
  });
};

export { initStarRating };