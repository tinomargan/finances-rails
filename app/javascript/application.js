// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "tom-select";

document.addEventListener('turbo:load', () => {
  const select = document.querySelector('#category-select');
  if (select && !select.tomselect) {
    new TomSelect(select, {
      plugins: ['remove_button'],
      maxItems: null,
      placeholder: "Odaberi kategoriju",
    });
  }
});